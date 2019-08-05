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

- (void)requestBookWithBookid:(NSString *)bookId completion:(void(^)(SBDetailBookModel *))completion {
    [[AFHTTPSessionManager manager] GET:[urlString stringByAppendingString:[@"/books/" stringByAppendingString:bookId]] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject != nil) {
            completion([[SBDetailBookModel alloc] initWithJSON:responseObject]);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    }];
}
- (void)requestNewBooks:(void(^)(SBResult<SBBaseBookModel *> *))completion
{
    [[AFHTTPSessionManager manager] GET:[urlString stringByAppendingString:@"/new"] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject != nil) {
            SBResult<SBBaseBookModel *> *model = [[SBResult alloc] init];
            model.value = [[SBBaseBookModel alloc] initWithJSON:responseObject];
//
            completion(model);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        SBResult<SBBaseBookModel *> *model = [[SBResult alloc] init];
        model.error = error;
        completion(model);
    }];
}
- (void)requestNewBook:(void(^)(SBBaseBookModel *))completion {
    
    [[AFHTTPSessionManager manager] GET:[urlString stringByAppendingString:@"/new"] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject != nil) {
            completion([[SBBaseBookModel alloc] initWithJSON:responseObject]);
        }
//        NSLog(responseObject);
        //            completion(
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//        NSLog(error.description);
    }];
}

- (void)requestSearchQuery:(NSString *)query page:(NSInteger)page completion:(void(^)(SBBaseBookModel *))completion {
    
}
@end
