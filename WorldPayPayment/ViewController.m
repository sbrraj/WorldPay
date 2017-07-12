//
//  ViewController.m
//  WorldPayPayment
//
//  Created by Rajshekhar on 10/07/17.
//  Copyright © 2017 Rajshekhar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *array = @[@"1",@"1",@"3",@"2",@"3",@"5"];
    NSMutableSet *set = [[NSMutableSet alloc]init];
    [set setByAddingObjectsFromArray:array];
//    for (int i=0; i<array.count; i++) {
//        [set setByAddingObject:array[i]];
//        
//    }
    
    NSSet *telephoneSet = [NSSet setWithArray:array];
    
    NSLog(@"array ==>>%@",array);
    NSLog(@"set ==>>%@",set);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
