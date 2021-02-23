//
//  NSDictionary+Safe.m
//  BSafeObject_Example
//
//  Created by 王宝明 on 2020/9/4.
//  Copyright © 2020 1250829271@qq.com. All rights reserved.
//

#import "NSDictionary+Safe.h"
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"
#import "BSafe.h"

@implementation NSDictionary (Safe)
//#ifdef DEBUG
//
//#else   // release模式下不会发生崩溃

+ (void)load{
    [self SwizzlingMethod:@"initWithObjects:forKeys:count:" systemClassString:@"__NSPlaceholderDictionary" toSafeMethodString:@"initWithObjects_st:forKeys:count:" targetClassString:@"NSDictionary"];
}

-(instancetype)initWithObjects_st:(id *)objects forKeys:(id<NSCopying> *)keys count:(NSUInteger)count {
    
    BSafe * safe = [BSafe shareManager];
    if (!safe.config) {
        return [self initWithObjects_st:objects forKeys:keys count:count];
    }
    
    NSUInteger rightCount = 0;
    for (NSUInteger i = 0; i < count; i++) {
        if (!(keys[i] && objects[i])) {
            NSString * threadStack = [self threadStack];
            NSString * reason = @"IndexOutOfBoundsException";
            NSString * crash = [NSString stringWithFormat:@"%@:Out of bound--%@",reason,threadStack];
            [safe.config stackBlock:crash reason:reason];
            break;
        }else{
            rightCount++;
        }
    }
    self = [self initWithObjects_st:objects forKeys:keys count:rightCount];
    return self;
}

//#endif
@end
