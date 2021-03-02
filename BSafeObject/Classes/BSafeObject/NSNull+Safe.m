//
//  NSNull+Safe.m
//  BSafeObject
//
//  Created by 王宝明 on 2020/9/4.
//

#import "NSNull+Safe.h"
#import <objc/runtime.h>
#import "BSafe.h"
#import "NSObject+Swizzling.h"

@implementation NSNull (Safe)


//#ifdef DEBUG
//
//#else   // release模式下不会发生崩溃

- (void)forwardInvocation:(NSInvocation *)anInvocation{
     anInvocation.target = nil;
     [anInvocation invoke];
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    @synchronized([self class])
    {
        BSafe * safe = [BSafe shareManager];
        if (!safe.config) {
            return  nil;
        }
        //look up method signature
        NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
        if (!signature)
        {
            //not supported by NSNull, search other classes
            static NSMutableSet *classList = nil;
            static NSMutableDictionary *signatureCache = nil;
            if (signatureCache == nil)
            {
                classList = [[NSMutableSet alloc] init];
                signatureCache = [[NSMutableDictionary alloc] init];

                //get class list
                int numClasses = objc_getClassList(NULL, 0);
                Class *classes = (Class *)malloc(sizeof(Class) * (unsigned long)numClasses);
                numClasses = objc_getClassList(classes, numClasses);

                //add to list for checking
                NSMutableArray * excluded = [NSMutableArray array];
                for (int i = 0; i < numClasses; i++)
                {
                    //determine if class has a superclass
                    Class someClass = classes[i];
                    Class superclass = class_getSuperclass(someClass);
                    while (superclass)
                    {
                        if (superclass == [NSObject class])
                        {
                            [classList addObject:someClass];
                            break;
                        }
                        [excluded addObject:NSStringFromClass(superclass)];
                        superclass = class_getSuperclass(superclass);
                    }
                }

                //remove all classes that have subclasses
                for (Class someClass in excluded)
                {
                    [classList removeObject:someClass];
                }

                //free class list
                free(classes);
            }

            //check implementation cache first
            NSString *selectorString = NSStringFromSelector(aSelector);
            signature = signatureCache[selectorString];
            if (!signature)
            {
                //find implementation
                for (Class someClass in classList)
                {
                    if ([someClass instancesRespondToSelector:aSelector])
                    {
                        signature = [someClass instanceMethodSignatureForSelector:aSelector];

                        NSString * name = @"NSRangeException";
                        NSString * reasonKey = @"NullParamterException";
                        
                        NSString * reason = [NSString stringWithFormat:@"%@:[NSNull %@] Unrecognized Selector Sent to Instance",reasonKey,NSStringFromSelector(aSelector)];
                        [safe.config stackBlock:name reason:reason reasonKey:reasonKey];
                        break;
                    }
                }

                //cache for next time
                signatureCache[selectorString] = signature ?: [NSNull null];
            }
            else if ([signature isKindOfClass:[NSNull class]])
            {
                signature = nil;
            }
        }
        return signature;
    }
}

//#endif
@end
