//
//  ViewController.m
//  MethodSwizzle
//
//  Created by Patty on 16/8/25.
//  Copyright © 2016年 Patty. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *array = @[@"数据"];
    NSLog(@"array obj:%@",[array objectAtIndex:2]);
    
    NSMutableArray *mutableArray = [NSMutableArray arrayWithObjects:@"12",@"34", nil];
    NSLog(@"mutableArray obj:%@",mutableArray[2]);
    
    NSDictionary *dict = @{@"name":@"大大"};
    NSLog(@"dict obj:%@",[dict objectForKey:@"address"]);

    
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"12",@"year", nil];
    NSLog(@"mutableDict obj:%@",[mutableDict objectForKey:@"ad"]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
