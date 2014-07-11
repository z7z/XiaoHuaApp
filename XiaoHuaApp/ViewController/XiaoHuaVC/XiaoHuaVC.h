//
//  XiaoHuaVC.h
//  XiaoHuaApp
//
//  Created by 周仕野 on 14-7-10.
//  Copyright (c) 2014年 GYT.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XiaoHuaVC : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
    int _page;
    
    UITableView     * _xiaoHuaTable;
    NSMutableArray  * _xiaoHuaArray;
}

@property (nonatomic,copy) NSString * XH_UrlStr;

@end
