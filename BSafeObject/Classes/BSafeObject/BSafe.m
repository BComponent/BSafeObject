//
//  BSafe.m
//  BSafeObject
//
//  Created by 王宝明 on 2021/2/23.
//

#import "BSafe.h"

@implementation BSafe
+ (instancetype)shareManager{
    static BSafe * manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[BSafe alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}


+ (void)starWithConfig:(BSafeConfig *)config{
#if DEBUG
    //debug环境不拦截奔溃
#else
    BSafe * safe = [BSafe shareManager];
    safe.config = config;
#endif
}

@end
