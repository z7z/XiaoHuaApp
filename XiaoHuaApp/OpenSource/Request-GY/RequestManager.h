//
//  RequestManager.h
//  LimitFree
//
//  Created by Erichow on 14-1-7.
//  Copyright (c) 2014年 Erichow. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "URLRequest.h"

@interface RequestManager : NSObject

+(void)requestWithUrl:(NSString *)url IsCache:(BOOL)isCache
               Finish:(void(^)(NSData * data))finishBlock Failed:(void(^)())failedBlock;

@end
