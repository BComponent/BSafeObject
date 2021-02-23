//
//  NSMutableDictionary+Safe.m
//  BSafeObject_Example
//
//  Created by 王宝明 on 2020/9/4.
//  Copyright © 2020 1250829271@qq.com. All rights reserved.
//

#import "NSMutableDictionary+Safe.h"
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"
#import "BSafe.h"

@implementation NSMutableDictionary (Safe)
//#ifdef DEBUG
//
//#else   // release模式下不会发生崩溃

#pragma mark --- init method

+ (void)load {
    //只执行一次这个方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        // 替换 removeObjectForKey:
        NSString *tmpRemoveStr = @"removeObjectForKey:";
        NSString *tmpSafeRemoveStr = @"safeMutable_removeObjectForKey:";
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSDictionaryM")
                                     originalSelector:NSSelectorFromString(tmpRemoveStr)                                     swizzledSelector:NSSelectorFromString(tmpSafeRemoveStr)];
        
        
        
        // 替换 setObject:forKey:
        NSString *tmpSetStr = @"setObject:forKey:";
        NSString *tmpSafeSetRemoveStr = @"safeMutable_setObject:forKey:";
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSDictionaryM")
                                     originalSelector:NSSelectorFromString(tmpSetStr)                                     swizzledSelector:NSSelectorFromString(tmpSafeSetRemoveStr)];
        
    });
    
}

#pragma mark --- implement method

/**
 根据akey 移除 对应的 键值对
 
 @param aKey key
 */
- (void)safeMutable_removeObjectForKey:(id<NSCopying>)aKey {
    BSafe * safe = [BSafe shareManager];
    if (!safe.config) {
        return [self safeMutable_removeObjectForKey:aKey];
    }
    if (!aKey) {
        NSString * threadStack = [self threadStack];
        NSString * reason = @"NullKeyValueException";
        NSString * crash = [NSString stringWithFormat:@"%@:Attempt to insert nil value--%@",reason,threadStack];
        [safe.config stackBlock:crash reason:reason];
        return;
    }
    [self safeMutable_removeObjectForKey:aKey];
}

/**
 将键值对 添加 到 NSMutableDictionary 内
 
 @param anObject 值
 @param aKey 键
 */
- (void)safeMutable_setObject:(id)anObject forKey:(id<NSCopying>)aKey {
    BSafe * safe = [BSafe shareManager];
    if (!safe.config) {
        return [self safeMutable_setObject:anObject forKey:aKey];
    }
    if (!anObject) {
        NSString * threadStack = [self threadStack];
        NSString * reason = @"NullKeyValueException";
        NSString * crash = [NSString stringWithFormat:@"%@:Attempt to insert nil value--%@",reason,threadStack];
        [safe.config stackBlock:crash reason:reason];
        return;
    }
    if (!aKey) {
        NSString * threadStack = [self threadStack];
        NSString * reason = @"NullKeyValueException";
        NSString * crash = [NSString stringWithFormat:@"%@:Attempt to insert nil value--%@",reason,threadStack];
        [safe.config stackBlock:crash reason:reason];
        return;
    }
    return [self safeMutable_setObject:anObject forKey:aKey];
}
//#endif
@end
