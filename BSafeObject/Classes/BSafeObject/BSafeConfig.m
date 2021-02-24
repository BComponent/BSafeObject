//
//  BSafeConfig.m
//  BSafeObject
//
//  Created by 王宝明 on 2021/2/23.
//

#import "BSafeConfig.h"
#include <libkern/OSAtomic.h>
#include <execinfo.h>


@implementation BSafeConfig

- (void)stackBlock:(NSString *)name reason:(NSString *)reason reasonKey:(NSString *)reasonKey
{
    NSArray *  stackArray = [self threadStack];
    if (stackArray.count > 0) {
        NSString *threadStack = [[NSString alloc]initWithData:[NSJSONSerialization dataWithJSONObject:stackArray options:0 error:nil] encoding:NSUTF8StringEncoding];
        if (threadStack.length < 1) {
            threadStack = @"";
        }
        if (self.threadStackBlock) {
            self.threadStackBlock(name,reasonKey,reason,stackArray,threadStack);
        }
    }
}


- (NSArray *)threadStack{
    void* callstack[128];
    int frames = backtrace(callstack, 128);
    char **strs = backtrace_symbols(callstack, frames);
    int len=sizeof(strs);
    int i;
    NSMutableArray *backtrace = [NSMutableArray arrayWithCapacity:frames];
    for (i = 0;i < len;i++){
        [backtrace addObject:[NSString stringWithUTF8String:strs[i]]];
    }
    free(strs);
    
//    NSLog(@"=====>>>>>堆栈<<<<<=====\n%@",threadStack);
    return backtrace;
}
@end
