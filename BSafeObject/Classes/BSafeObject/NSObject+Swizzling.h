//
//  NSObject+Swizzling.h
//  BSafeObject_Example
//
//  Created by 王宝明 on 2020/9/4.
//  Copyright © 2020 1250829271@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Swizzling)

/**
 *  交换两个函数实现指针  参数均为NSString类型
 *
 *  @param systemMethodString 系统方法名string
 *  @param systemClassString  系统实现方法类名string
 *  @param safeMethodString   自定义hook方法名string
 *  @param targetClassString  目标实现类名string
 */
+ (void)SwizzlingMethod:(NSString *)systemMethodString systemClassString:(NSString *)systemClassString toSafeMethodString:(NSString *)safeMethodString targetClassString:(NSString *)targetClassString;

/**
 *方法交换
 */
+ (void)exchangeInstanceMethodWithSelfClass:(Class)selfClass
originalSelector:(SEL)originalSelector
swizzledSelector:(SEL)swizzledSelector;

@end

NS_ASSUME_NONNULL_END
