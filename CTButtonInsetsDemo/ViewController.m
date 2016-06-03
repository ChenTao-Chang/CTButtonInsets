//
//  ViewController.m
//  CTButtonInsetsDemo
//
//  Created by changchentao on 16/6/3.
//  Copyright © 2016年 changchentao. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+ImageTitleInsets.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 50, 200, 200);
    button.imageRect = CGRectMake(5, 5, 150, 150);
    button.titleRect = CGRectMake(50, 160, 80, 30);
    [button setTitle:@"btnTitle" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"godfather.jpg"] forState:UIControlStateNormal];
    
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
