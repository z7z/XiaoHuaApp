//
//  XiaoHuaModel.m
//  XiaoHuaApp
//
//  Created by 周仕野 on 14-7-9.
//  Copyright (c) 2014年 GYT.co. All rights reserved.
//

#import "XiaoHuaModel.h"

@implementation XiaoHuaModel

-(NSInteger)getCellHeight{
    NSInteger height = 0 ;
    if (![self.XH_title isKindOfClass:[NSNull class]]
                &&![self.XH_title isEqualToString:@""]) {
//        height = height + 21 ;
    }
    
    if (![self.XH_content isKindOfClass:[NSNull class]]
                &&![self.XH_content isEqualToString:@""]) {
        UIFont *font = [UIFont systemFontOfSize:16];
        CGSize size = CGSizeMake(286,2000);
        CGSize labelsize = [self.XH_content sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
        height = height + labelsize.height ;
    }
    
//      接口有问题
    if (![self.XH_picture_url isKindOfClass:[NSNull class]]
                &&![self.XH_picture_url isEqualToString:@""]) {
        // NSLog(@"beng %@",self.XH_picture_url);
        float x = 286.0 / self.XH_picture_width.floatValue ;
        height = height + x * self.XH_picture_height.floatValue ;
    }
    
    height = height + 42 + 15;
    
    return height ;
}

// 获取文字高度 ［宽度：285 字号：16］
-(NSInteger)getContentHeight{
    UIFont *font = [UIFont systemFontOfSize:16];
    CGSize size = CGSizeMake(286,2000);
    CGSize labelsize = [self.XH_content sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    NSLog(@"-----------\n%@\n",self.XH_content);
    NSLog(@"文字高度：%f",labelsize.height);
    return labelsize.height ;
}

@end
