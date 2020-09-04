//
//  BViewController.m
//  BSafeObject
//
//  Created by 1250829271@qq.com on 09/04/2020.
//  Copyright (c) 2020 1250829271@qq.com. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@end

@implementation BViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // 测试数组
//    NSArray *arr = @[@"1",@"2",@"2",@"2",@"2",@"2",@"2",@"2",@"2"];
//    NSMutableArray *tableArray = [[NSMutableArray alloc] initWithArray:arr];
////    NSLog(@"arr====%@   tableArray====%@",arr[100],tableArray[100]);
////    NSLog(@"arr====%@   tableArray====%@",[arr objectAtIndex:100],tableArray[100]);
//
//    // 测试字典
//    NSDictionary *dict = @{@"name":@"",@"age":@"20"};
//    NSMutableDictionary *tableDict = [[NSMutableDictionary alloc] initWithDictionary:dict];
////    NSString * dicstr ;
////    NSDictionary *dict1 = @{@"name":dicstr};
//    NSLog(@"dict---name====%@   tableDict---age====%@",[dict objectForKey:@"name"],[tableDict objectForKey:@"age"]);
//    NSLog(@"dict---name====%@   tableDict---age====%@",[dict objectForKey:@"name"],[tableDict objectForKey:@"age"]);
//
//    // 测试字符串
//    NSMutableString *tableString = [[NSMutableString alloc] initWithFormat:@"防止项目数组字典越界崩溃"];
//    NSLog(@"%@",[tableString substringFromIndex:100]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
