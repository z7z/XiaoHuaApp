//
//  XiaoHuaModel.h
//  XiaoHuaApp
//
//  Created by 周仕野 on 14-7-9.
//  Copyright (c) 2014年 GYT.co. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIFont.h>
#import <UIKit/UIStringDrawing.h>
@interface XiaoHuaModel : NSObject

@property (nonatomic,copy) NSString * XH_title;
@property (nonatomic,copy) NSString * XH_content;
@property (nonatomic,copy) NSString * XH_picture_url;
@property (nonatomic,copy) NSString * XH_picture_width;
@property (nonatomic,copy) NSString * XH_picture_height;
@property (nonatomic,copy) NSString * XH_up_votes_count;
@property (nonatomic,copy) NSString * XH_down_votes_count;

@property (nonatomic,copy) NSString * XH_user_name;
@property (nonatomic,copy) NSString * XH_user_avatar_url;


-(NSInteger)getCellHeight;
-(NSInteger)getContentHeight;



@end
