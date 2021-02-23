//
//  NSObject+Method.m
//  BSafeObject
//
//  Created by 王宝明 on 2021/2/4.
//

#import "NSObject+Method.h"
#import <objc/runtime.h>


@implementation NSObject (Method)

#ifdef DEBUG

#else   // release模式下不会发生崩溃

#endif

//- (void)test_aaaaaa{
//    NSLog(@"test_aaaaaa--");
//}
//
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    if (NSStringFromClass(self)) {
//        NSLog(@"selfClass -- %@",NSStringFromClass(self) );
//    }
//
//
//    NSString *selName = NSStringFromSelector(sel);
//    NSLog(@"selName--%@----%@",selName,selName.class);
//
//    BOOL respond = [self respondsToSelector:sel];
//    NSLog(@"respond--%d",respond);

//    if (sel == @selector(testMethed:)) {
//    Method method2 = class_getInstanceMethod(self, @selector(test_aaaaaa));
//        class_addMethod(self, sel, method_getImplementation(method2), method_getTypeEncoding(method2));
//        // 这里class_addMethod（）中第一个参数self是类对象
//        // 如果是类方法，则class_addMethod（）调用时，第一个参数应该写元类对象object_getClass(self)
//        return YES;
//    }
//    return YES;
//    return [self resolveInstanceMethod:sel];
//}
//+ (BOOL)resolveClassMethod:(SEL)sel{
//    return [self resolveClassMethod:sel];
//}


@end
