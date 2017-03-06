//
//  UIButton+GetCode.m
//  XMLCodeButtonDemo
//
//  Created by aurorac on 16/11/2.
//  Copyright © 2016年 xiaomaolv. All rights reserved.
//

#import "UIButton+GetCode.h"

@implementation UIButton (GetCode)
-(void)startTimeWithNormalColor:(UIColor *)normalColor CountColor:(UIColor *)countColor{
    __block int timeout = 20; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:@"获取验证码" forState:UIControlStateNormal];
                self.backgroundColor = normalColor;
                self.userInteractionEnabled = YES;
            });
        }else{
            int seconds = timeout % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:[NSString stringWithFormat:@"%@秒后重发",strTime] forState:UIControlStateNormal];
                self.backgroundColor = countColor;
                self.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}

@end
