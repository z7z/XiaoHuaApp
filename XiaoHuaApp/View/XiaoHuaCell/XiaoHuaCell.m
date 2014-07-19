//
//  XiaoHuaCell.m
//  XiaoHuaApp
//
//  Created by 周仕野 on 14-7-10.
//  Copyright (c) 2014年 GYT.co. All rights reserved.
//

#import "XiaoHuaCell.h"

@implementation XiaoHuaCell

- (void)awakeFromNib
{
    // Initialization code
    self.XH_content2 = [[UILabel alloc] init];
    self.XH_content2.font = [UIFont systemFontOfSize:16];
    self.XH_content2.lineBreakMode = NSLineBreakByWordWrapping;
    self.XH_content2.numberOfLines = 0;
    self.autoresizingMask = 0;
    [self.XH_content.superview addSubview:self.XH_content2];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)autoSize{
    UIFont *font = [UIFont systemFontOfSize:16];
    CGSize size = CGSizeMake(286,2000);
    CGSize labelsize = [self.XH_content.text sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    CGRect xh = self.XH_content.frame ;
    self.XH_content.frame = CGRectMake(xh.origin.x, xh.origin.y, xh.size.width, labelsize.height);
}
- (void)setXiaoHua:(XiaoHuaModel *)xiaohua{

}
- (void)setXiaoHuaContent:(NSString *)content{
    self.XH_content2.text = content ;
    UIFont *font = [UIFont systemFontOfSize:16];
    CGSize size = CGSizeMake(286,2000);
    CGSize labelsize = [self.XH_content2.text sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
    CGRect xh = self.XH_content.frame ;
    self.XH_content2.frame = CGRectMake(xh.origin.x, xh.origin.y, xh.size.width, labelsize.height);
}

@end
