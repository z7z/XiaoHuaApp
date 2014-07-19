//
//  XiaoHuaCell.h
//  XiaoHuaApp
//
//  Created by 周仕野 on 14-7-10.
//  Copyright (c) 2014年 GYT.co. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XiaoHuaModel.h"

@interface XiaoHuaCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *XH_content;
@property (weak, nonatomic) IBOutlet UIImageView *XH_picture;

@property (nonatomic,retain) UILabel * XH_content2;

- (void)autoSize;
- (void)setXiaoHua:(XiaoHuaModel *)xiaohua;
- (void)setXiaoHuaContent:(NSString *)content;
@end
