//
//  SBAPIManager.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 03/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBAPIManager.h"

@implementation SBAPIManager

static NSString *urlString = @"https://api.itbook.store/1.0/";

+(SBAPIManager *)shared {
    static SBAPIManager *instance = nil;
    static dispatch_once_t once = 0;
    dispatch_once(&once,^{
        instance = [[SBAPIManager alloc] init];
    });
    return instance;
}

- (void)requestWithQuery:(NSString *)query completion:(void(^)(SBBaseBookModel* model))completion {
//    completion([SBBaseBookModel init]);
    
/*
 var components = URLComponents(url: url!, resolvingAgainstBaseURL: true)!
 components.queryItems = query
 
 var urlRequest = URLRequest(url: components.url!)
 urlRequest.httpMethod = "GET"
 urlRequest.addValue("jquboLPVpxvTYXNmPOMU", forHTTPHeaderField: "X-Naver-Client-Id")
 urlRequest.addValue("i8cUP0rRNR", forHTTPHeaderField: "X-Naver-Client-Secret")
 
 return urlRequest
*/
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:[urlString stringByAppendingString:query]] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:15.f];
    request.HTTPMethod = @"GET";
   
    [[[AFHTTPSessionManager manager] dataTaskWithRequest:request uploadProgress:^(NSProgress * _Nonnull uploadProgress) {
        
    } downloadProgress:^(NSProgress * _Nonnull downloadProgress) {
        
    } completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
//        NSLog(responseObject);
        completion([[SBBaseBookModel alloc] initWithJSON:(NSDictionary *)responseObject]);
    }] resume];
//    [A]
//    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
//
//    }] resume];
//    request.
//    request.
}
@end
