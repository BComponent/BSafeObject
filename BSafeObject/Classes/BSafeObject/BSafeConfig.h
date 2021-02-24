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
 *name 崩溃名称
 *reasonKey 崩溃关键字
 *reason 崩溃原因
 *callStack 堆栈信息
 *callStackString 堆栈信息
 */
@property(nonatomic,copy) void (^threadStackBlock)(NSString * name,NSString * reasonKey,NSString * reason,NSArray * callStack,NSString * callStackString);
/**
 *实现threadStackBlock回调
 *name 崩溃name
 *reason 崩溃原因
 *reasonKey 崩溃原因key
 */
- (void)stackBlock:(NSString *)name reason:(NSString *)reason reasonKey:(NSString *)reasonKey;
@end

NS_ASSUME_NONNULL_END
