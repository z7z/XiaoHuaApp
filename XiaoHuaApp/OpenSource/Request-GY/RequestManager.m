//
//  RequestManager.m
//  LimitFree
//
//  Created by Erichow on 14-1-7.
//  Copyright (c) 2014年 Erichow. All rights reserved.
//

#import "RequestManager.h"

@implementation RequestManager

+(void)requestWithUrl:(NSString *)url IsCache:(BOOL)isCache
               Finish:(void (^)(NSData *))finishBlock Failed:(void (^)())failedBlock{
    URLRequest * request=[[URLRequest alloc]init];
    request.url=url;
    request.isCache=isCache;
    request.finishBlock=finishBlock;
    request.failedBlock=failedBlock;
    [request startRequest];
}

@end
