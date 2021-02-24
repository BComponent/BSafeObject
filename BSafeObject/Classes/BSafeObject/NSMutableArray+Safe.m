//
//  NSMutableArray+Safe.m
//  BSafeObject_Example
//
//  Created by 王宝明 on 2020/9/4.
//  Copyright © 2020 1250829271@qq.com. All rights reserved.
//

#import "NSMutableArray+Safe.h"
#import <objc/runtime.h>
#import "NSObject+Swizzling.h"
#import "BSafe.h"

@implementation NSMutableArray (Safe)

#pragma mark --- init method

//#ifdef DEBUG
//
//#else   // release模式下不会发生崩溃

+ (void)load {
    //只执行一次这个方法
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        //替换 objectAtIndex:
        NSString *tmpGetStr = @"objectAtIndex:";
        NSString *tmpSafeGetStr = @"safeMutable_objectAtIndex:";
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayM")
                                     originalSelector:NSSelectorFromString(tmpGetStr)                                     swizzledSelector:NSSelectorFromString(tmpSafeGetStr)];
        
        //替换 removeObjectsInRange:
        NSString *tmpRemoveStr = @"removeObjectsInRange:";
        NSString *tmpSafeRemoveStr = @"safeMutable_removeObjectsInRange:";
        
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayM")
                                     originalSelector:NSSelectorFromString(tmpRemoveStr)                                     swizzledSelector:NSSelectorFromString(tmpSafeRemoveStr)];
        
        
        //替换 insertObject:atIndex:
        NSString *tmpInsertStr = @"insertObject:atIndex:";
        NSString *tmpSafeInsertStr = @"safeMutable_insertObject:atIndex:";
        
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayM")
                                     originalSelector:NSSelectorFromString(tmpInsertStr)                                     swizzledSelector:NSSelectorFromString(tmpSafeInsertStr)];
        
        //替换 removeObject:inRange:
        NSString *tmpRemoveRangeStr = @"removeObject:inRange:";
        NSString *tmpSafeRemoveRangeStr = @"safeMutable_removeObject:inRange:";
        
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayM")
                                     originalSelector:NSSelectorFromString(tmpRemoveRangeStr)                                     swizzledSelector:NSSelectorFromString(tmpSafeRemoveRangeStr)];
        
        
        // 替换 objectAtIndexedSubscript
        
        NSString *tmpSubscriptStr = @"objectAtIndexedSubscript:";
        NSString *tmpSecondSubscriptStr = @"safeMutable_objectAtIndexedSubscript:";
        [NSObject exchangeInstanceMethodWithSelfClass:NSClassFromString(@"__NSArrayM")
                                     originalSelector:NSSelectorFromString(tmpSubscriptStr)                                     swizzledSelector:NSSelectorFromString(tmpSecondSubscriptStr)];
    });
    
}

//#endif

#pragma mark --- implement method

/**
 取出NSArray 第index个 值
 
 @param index 索引 index
 @return 返回值
 */
- (id)safeMutable_objectAtIndex:(NSUInteger)index {
    BSafe * safe = [BSafe shareManager];
    if (!safe.config) {
        return [self safeMutable_objectAtIndex:index];
    }
    if (index >= self.count){
        NSString * name = @"NSRangeException";
        NSString * reasonKey = @"IndexOutOfBoundsException";
        NSString * reason = [NSString stringWithFormat:@"%@:Out of bound",reasonKey];
        [safe.config stackBlock:name reason:reason reasonKey:reasonKey];
        return nil;
    }
    return [self safeMutable_objectAtIndex:index];
}

/**
 NSMutableArray 移除 索引 index 对应的 值
 
 @param range 移除 范围
 */
- (void)safeMutable_removeObjectsInRange:(NSRange)range {
    BSafe * safe = [BSafe shareManager];
    if (!safe.config) {
        return [self safeMutable_removeObjectsInRange:range];
    }
    
    if (range.location > self.count) {
        NSString * name = @"NSRangeException";
        NSString * reasonKey = @"IndexOutOfBoundsException";
        NSString * reason = [NSString stringWithFormat:@"%@:Out of bound",reasonKey];
        [safe.config stackBlock:name reason:reason reasonKey:reasonKey];
        return;
    }
    
    if (range.length > self.count) {
        NSString * name = @"NSRangeException";
        NSString * reasonKey = @"IndexOutOfBoundsException";
        NSString * reason = [NSString stringWithFormat:@"%@:Out of bound",reasonKey];
        [safe.config stackBlock:name reason:reason reasonKey:reasonKey];
        return;
    }
    
    if ((range.location + range.length) > self.count) {
        NSString * name = @"NSRangeException";
        NSString * reasonKey = @"IndexOutOfBoundsException";
        NSString * reason = [NSString stringWithFormat:@"%@:Out of bound",reasonKey];
        [safe.config stackBlock:name reason:reason reasonKey:reasonKey];
        return;
    }
    
    return [self safeMutable_removeObjectsInRange:range];
}


/**
 在range范围内， 移除掉anObject
 
 @param anObject 移除的anObject
 @param range 范围
 */
- (void)safeMutable_removeObject:(id)anObject inRange:(NSRange)range {
    BSafe * safe = [BSafe shareManager];
    if (!safe.config) {
        return [self safeMutable_removeObject:anObject inRange:range];
    }
    if (range.location > self.count) {
        NSString * name = @"NSRangeException";
        NSString * reasonKey = @"IndexOutOfBoundsException";
        NSString * reason = [NSString stringWithFormat:@"%@:Out of bound",reasonKey];
        [safe.config stackBlock:name reason:reason reasonKey:reasonKey];
        return;
    }
    
    if (range.length > self.count) {
        NSString * name = @"NSRangeException";
        NSString * reasonKey = @"IndexOutOfBoundsException";
        NSString * reason = [NSString stringWithFormat:@"%@:Out of bound",reasonKey];
        [safe.config stackBlock:name reason:reason reasonKey:reasonKey];
        return;
    }
    
    if ((range.location + range.length) > self.count) {
        NSString * name = @"NSRangeException";
        NSString * reasonKey = @"IndexOutOfBoundsException";
        NSString * reason = [NSString stringWithFormat:@"%@:Out of bound",reasonKey];
        [safe.config stackBlock:name reason:reason reasonKey:reasonKey];
        return;
    }
    
    if (!anObject){
        NSString * name = @"NSRangeException";
        NSString * reasonKey = @"NullKeyValueException";
        NSString * reason = [NSString stringWithFormat:@"%@:Attempt to insert nil value",reasonKey];
        [safe.config stackBlock:name reason:reason reasonKey:reasonKey];
        return;
    }
    
    return [self safeMutable_removeObject:anObject inRange:range];
    
}

/**
 NSMutableArray 插入 新值 到 索引index 指定位置
 
 @param anObject 新值
 @param index 索引 index
 */
- (void)safeMutable_insertObject:(id)anObject atIndex:(NSUInteger)index {
    BSafe * safe = [BSafe shareManager];
    if (!safe.config) {
        return [self safeMutable_insertObject:anObject atIndex:index];
    }
    if (index > self.count) {
        NSString * name = @"NSRangeException";
        NSString * reasonKey = @"IndexOutOfBoundsException";
        NSString * reason = [NSString stringWithFormat:@"%@:Out of bound",reasonKey];
        [safe.config stackBlock:name reason:reason reasonKey:reasonKey];
        return;
    }
    
    if (!anObject){
        NSString * name = @"NSRangeException";
        NSString * reasonKey = @"NullKeyValueException";
        NSString * reason = [NSString stringWithFormat:@"%@:Attempt to insert nil value",reasonKey];
        [safe.config stackBlock:name reason:reason reasonKey:reasonKey];
        return;
    }
    
    [self safeMutable_insertObject:anObject atIndex:index];
}


/**
 取出NSArray 第index个 值 对应 __NSArrayI
 
 @param idx 索引 idx
 @return 返回值
 */
- (id)safeMutable_objectAtIndexedSubscript:(NSUInteger)idx {
    BSafe * safe = [BSafe shareManager];
    if (!safe.config) {
        return [self safeMutable_objectAtIndexedSubscript:idx];
    }
    if (idx >= self.count){
        NSString * name = @"NSRangeException";
        NSString * reasonKey = @"IndexOutOfBoundsException";
        NSString * reason = [NSString stringWithFormat:@"%@:Out of bound",reasonKey];
        [safe.config stackBlock:name reason:reason reasonKey:reasonKey];
        return nil;
    }
    return [self safeMutable_objectAtIndexedSubscript:idx];
}


@end
