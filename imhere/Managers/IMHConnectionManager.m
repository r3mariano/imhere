//
//  IMHConnectionManager.m
//  imhere
//
//  Created by Aci Cartagena on 5/2/15.
//  Copyright (c) 2015 imhere. All rights reserved.
//


#import "IMHConnectionManager.h"

static IMHConnectionManager *_instance = nil;

@interface IMHConnectionManager ()


@end

@implementation IMHConnectionManager

+ (IMHConnectionManager *)sharedManager
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
        [config setHTTPAdditionalHeaders:@{@"Accept":@"application/json"}];
        config.requestCachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
        NSURLCache *cache = [[NSURLCache alloc] initWithMemoryCapacity:10 * 1204 * 1024 diskCapacity:50 * 1024 * 1024 diskPath:nil];
        [config setURLCache:cache];
        _instance = [[IMHConnectionManager alloc] initWithBaseURL:[NSURL URLWithString:kBaseUrl] sessionConfiguration:config];
        _instance.responseSerializer = [AFJSONResponseSerializer serializer];

    });
    return _instance;
}

#pragma mark - properties

- (NSURLSessionDataTask *)heya
{
    return [self POST:@"heya/" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"yey");
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"aww");
    }];
}

@end