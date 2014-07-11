//
//  URLRequest.m
//  LimitFree
//
//  Created by Erichow on 14-1-7.
//  Copyright (c) 2014年 Erichow. All rights reserved.
//

#import "URLRequest.h"
#import "NSString+Hashing.h"

@implementation URLRequest

-(id)init{
    if (self==[super init]) {
        _mData=[[NSMutableData alloc]init];
    }
    return self;
}

-(void)startRequest{
//    [self retain];
    //缓存
    if (self.isCache) {
        //使用缓存
        NSString * path=[NSHomeDirectory() stringByAppendingFormat:@"/tmp/%@",[self.url MD5Hash]];
        NSFileManager * manager=[NSFileManager defaultManager];
        //文件存在
        if ([manager fileExistsAtPath:path]) {
            NSData * data=[NSData dataWithContentsOfFile:path];
            self.finishBlock(data);
            return;
        }
    }
    //开始请求
    NSURL * url=[NSURL URLWithString:self.url];
    NSURLRequest * request=[NSURLRequest requestWithURL:url];
    [NSURLConnection connectionWithRequest:request delegate:self];
}
//四大方法
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
//    [UIApplication sharedApplication].networkActivityIndicatorVisible=YES;
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [_mData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
//    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
    if (self.isCache) {
        NSString * path=[NSHomeDirectory() stringByAppendingFormat:@"/tmp/%@",[self.url MD5Hash]];
        [_mData writeToFile:path atomically:YES];
    }
    self.finishBlock(_mData);
//    [self release];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
//    [UIApplication sharedApplication].networkActivityIndicatorVisible=NO;
    self.failedBlock();
//    [self release];
}

-(void)dealloc{
    self.url=nil;
    self.finishBlock=nil;
    self.failedBlock=nil;
//    [_mData release];
//    [super dealloc];
}

@end
