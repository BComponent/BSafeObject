//
//  BSafe.h
//  BSafeObject
//
//  Created by 王宝明 on 2021/2/23.
//

#import <Foundation/Foundation.h>
#import "BSafeConfig.h"


NS_ASSUME_NONNULL_BEGIN



@interface BSafe : NSObject
+ (instancetype)shareManager;


/**
 *调用sdk的初始化方法
 *config 传入唯一的初始化的config
 */
+ (void)starWithConfig:(BSafeConfig *)config;

@property (nonatomic, strong)BSafeConfig * config;
@end

NS_ASSUME_NONNULL_END
