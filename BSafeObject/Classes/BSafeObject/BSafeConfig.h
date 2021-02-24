//
//  BSafeConfig.h
//  BSafeObject
//
//  Created by 王宝明 on 2021/2/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BSafeConfig : NSObject

/**
 *  SDK Debug开关, 默认关闭， Debug打开时会拦截debug模式下的崩溃
 */
@property (nonatomic, assign) BOOL debugMode;

/**
 *threadStackBlock回调
 *exception 堆栈信息
 *rease 崩溃原因
 */
@property(nonatomic,copy) void (^threadStackBlock)(NSString * exception,NSString * reason);
/**
 *实现threadStackBlock回调
 *stack 堆栈信息
 *rease 崩溃原因
 */
- (void)stackBlock:(NSString *)stack reason:(NSString *)rease;
@end

NS_ASSUME_NONNULL_END
