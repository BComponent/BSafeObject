//
//  BSafeConfig.m
//  BSafeObject
//
//  Created by 王宝明 on 2021/2/23.
//

#import "BSafeConfig.h"

@implementation BSafeConfig

- (void)stackBlock:(NSString *)stack reason:(NSString *)rease
{
    if (self.threadStackBlock) {
        self.threadStackBlock(stack,rease);
    }
}
@end
