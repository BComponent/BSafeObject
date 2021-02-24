//
//  BViewController.m
//  BSafeObject
//
//  Created by 1250829271@qq.com on 09/04/2020.
//  Copyright (c) 2020 1250829271@qq.com. All rights reserved.
//

#import "BViewController.h"
#import "BMethedTool.h"
@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    // 测试数组
    NSArray *arr = @[@"1",@"2",@"2",@"2",@"2",@"2",@"2",@"2",@"2"];
//    NSMutableArray *tableArray = [[NSMutableArray alloc] initWithArray:arr];
    NSLog(@"arr==%@===%@==%@",arr[1],[arr objectAtIndex:100],[arr objectAtIndexedSubscript:1]);
//    NSLog(@"mutableArr==%@===%@==%@==%@",tableArray[100],[tableArray objectAtIndex:100],[tableArray objectAtIndexedSubscript:100],[tableArray objectsAtIndexes:[NSIndexSet indexSetWithIndex:1]]);
//    [tableArray insertObject:nil atIndex:100];
//    [tableArray removeObject:nil inRange:NSMakeRange(5, 1)];
//    [tableArray removeObjectsInRange:NSMakeRange(5, 10)];
//
//    // 测试字典
  
//    [NSDictionary alloc] initWithObjects:<#(nonnull NSArray *)#> forKeys:<#(nonnull NSArray<id<NSCopying>> *)#>
//    NSDictionary * dic = [[NSDictionary alloc] initWithObjects:@"1" forKeys:@"key1" count:1];
//    NSDictionary *dict = @{@"name":@"",@"age":@"20"};
//    NSMutableDictionary *tableDict = [[NSMutableDictionary alloc] initWithDictionary:dict];
//    [tableDict removeObjectForKey:nil];
////    NSString * dicstr ;
////    NSDictionary *dict1 = @{@"name":dicstr};
//    NSLog(@"dict---name====%@   tableDict---age====%@",[dict objectForKey:@"name"],[tableDict objectForKey:@"age"]);
//    NSLog(@"dict---name====%@   tableDict---age====%@",[dict objectForKey:@"name"],[tableDict objectForKey:@"age"]);
//
//    // 测试字符串
//    NSMutableString *tableString = [[NSMutableString alloc] initWithFormat:@"防止项目数组字典越界崩溃"];
//    NSLog(@"%@",[tableString substringFromIndex:100]);
    
//    BMethedTool * tool = [BMethedTool new];
//    [tool testMethed:@"hellow word"];
    
    
//    NSArray * nullArray = [NSNull new];
//    NSLog(@"----%lu",(unsigned long)nullArray.count);
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
