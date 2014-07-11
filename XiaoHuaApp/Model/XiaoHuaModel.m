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
        height = height + 21 ;
    }
    
    if (![self.XH_content isKindOfClass:[NSNull class]]
        &&![self.XH_content isEqualToString:@""]) {
        UIFont *font = [UIFont systemFontOfSize:16];
        CGSize size = CGSizeMake(285,2000);
        CGSize labelsize = [self.XH_content sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
        height = height + size.height ;
    }
    
//    if (![self.XH_picture_url isKindOfClass:[NSNull class]]) {
//        float x = 286.0 / self.XH_picture_width.floatValue ;
//        height = height + x * self.XH_picture_height.floatValue ;
//    }
    
    height = height + 42 ;
    
    return height ;
}

@end
