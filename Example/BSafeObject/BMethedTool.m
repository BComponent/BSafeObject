//
//  BMethedTool.m
//  BSafeObject_Example
//
//  Created by 王宝明 on 2021/2/4.
//  Copyright © 2021 1250829271@qq.com. All rights reserved.
//

#import "BMethedTool.h"
#import <objc/runtime.h>

@implementation BMethedTool
//- (void)test_aaaaaa{
//    NSLog(@"test_aaaaaa--");
//}
//
////- (void)testMethed:(NSString *)text{
////    NSLog(@"testMethed--%@",text);
////}
//
//+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    NSString *selName = NSStringFromSelector(sel);
//    NSLog(@"selName--%@",selName);
//    
//    BOOL respond = [self respondsToSelector:sel];
//    NSLog(@"respond--%d",respond);
//    
//    
//    if (sel == @selector(testMethed:)) {
//    Method method2 = class_getInstanceMethod(self, @selector(test_aaaaaa));
//        class_addMethod(self, sel, method_getImplementation(method2), method_getTypeEncoding(method2));
//        // 这里class_addMethod（）中第一个参数self是类对象
//        // 如果是类方法，则class_addMethod（）调用时，第一个参数应该写元类对象object_getClass(self)
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
//}
//+ (BOOL)resolveClassMethod:(SEL)sel{
//    return [super resolveClassMethod:sel];
//}
@end
