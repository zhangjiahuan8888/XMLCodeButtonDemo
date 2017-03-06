//
//  ViewController.m
//  XMLCodeButtonDemo
//
//  Created by aurorac on 16/11/2.
//  Copyright © 2016年 xiaomaolv. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+GetCode.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *codeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    codeBtn.frame = CGRectMake(100, 100, 100, 40);
    [codeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [codeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    codeBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    codeBtn.layer.cornerRadius = 16;
    codeBtn.backgroundColor = [UIColor redColor];
    [codeBtn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:codeBtn];
}

- (void)clickBtn:(UIButton *)button{
    [button startTimeWithNormalColor:[UIColor redColor] CountColor:[UIColor lightGrayColor]];
}

@end
