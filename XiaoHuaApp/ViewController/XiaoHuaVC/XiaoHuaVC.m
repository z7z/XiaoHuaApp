//
//  XiaoHuaVC.m
//  XiaoHuaApp
//
//  Created by 周仕野 on 14-7-10.
//  Copyright (c) 2014年 GYT.co. All rights reserved.
//

#import "XiaoHuaVC.h"
#import "RequestManager.h"
#import "XiaoHuaModel.h"
#import "XiaoHuaCell.h"
#import "UIImageView+WebCache.h"
@interface XiaoHuaVC ()

@end

@implementation XiaoHuaVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _page = 1;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // 变量init
    _xiaoHuaArray = [[NSMutableArray alloc] init];
    // 控件init
    _xiaoHuaTable = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    _xiaoHuaTable.dataSource = self ;
    _xiaoHuaTable.delegate   = self ;
    _xiaoHuaTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_xiaoHuaTable];
    [self loadXiaoHuaWithPage:_page];
}

- (void)loadXiaoHuaWithPage:(int)page{
    NSString * url = [NSString stringWithFormat:@"%@%d",self.XH_UrlStr,page];
    [RequestManager requestWithUrl:url IsCache:NO Finish:^(NSData *data) {
        NSArray * array=[NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        NSLog(@"%@",array);
        for (NSDictionary * newsDic in array) {
            XiaoHuaModel * xiaohua=[[XiaoHuaModel alloc]init];
            xiaohua.XH_title=[newsDic objectForKey:@"title"];
            xiaohua.XH_content=[newsDic objectForKey:@"content"];
            xiaohua.XH_picture_url=[newsDic objectForKey:@"picture_url"];
            xiaohua.XH_picture_width = [[newsDic objectForKey:@"dimensions"]objectForKey:@"width"] ;
            xiaohua.XH_picture_height = [[newsDic objectForKey:@"dimensions"]objectForKey:@"height"]  ;
            [_xiaoHuaArray addObject:xiaohua];
        }
        [_xiaoHuaTable reloadData];
    } Failed:^{
        NSLog(@"读取失败，网络错误");
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"_xiaoHuaArray = %d",[_xiaoHuaArray count]);
    return [_xiaoHuaArray count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    XiaoHuaModel * xiaohua = [_xiaoHuaArray objectAtIndex:indexPath.row];
    return [xiaohua getCellHeight]+50;
//    return 394;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    XiaoHuaCell * cell = [tableView dequeueReusableCellWithIdentifier:@"xiaohuaCell"];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"XiaoHuaCell" owner:nil options:0]lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone ;
    }
    XiaoHuaModel * xiaohua = [_xiaoHuaArray objectAtIndex:indexPath.row];
    [cell setXiaoHuaContent:xiaohua.XH_content];
    if (![xiaohua.XH_picture_url isKindOfClass:[NSNull class]]) {
        [cell.XH_picture sd_setImageWithURL:[NSURL URLWithString:xiaohua.XH_picture_url]];
    }else{
        cell.XH_picture.image = nil;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([_xiaoHuaArray count]-indexPath.row==2) {
        _page = _page + 1;
        [self loadXiaoHuaWithPage:_page];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
