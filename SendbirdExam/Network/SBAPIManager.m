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

- (void)requestBookWithBookid:(NSString *)bookId completion:(void(^)(SBResult<SBDetailBookModel *> *))completion {
    
    [[AFHTTPSessionManager manager] GET:[urlString stringByAppendingString:[@"/books/" stringByAppendingString:bookId]] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject != nil) {
            SBResult<SBDetailBookModel *> *model = [[SBResult alloc] init];
            model.value = [[SBDetailBookModel alloc] initWithJSON:responseObject];
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(model);
            });
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        SBResult<SBDetailBookModel *> *model = [[SBResult alloc] init];
        model.error = error;
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(model);
        });
    }];
}

- (void)requestNewBooks:(void(^)(SBResult<SBBaseBookModel *> *))completion
{
    [[AFHTTPSessionManager manager] GET:[urlString stringByAppendingString:@"/new"] parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject != nil) {
            SBResult<SBBaseBookModel *> *model = [[SBResult alloc] init];
            model.value = [[SBBaseBookModel alloc] initWithJSON:responseObject];
            dispatch_async(dispatch_get_main_queue(), ^{
                completion(model);
            });
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        SBResult<SBBaseBookModel *> *model = [[SBResult alloc] init];
        model.error = error;
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(model);
        });
    }];
}

- (void)requestSearchQuery:(NSString *)query page:(NSInteger)page completion:(void(^)(SBResult<SBBaseBookModel *> *))completion {
    
}
@end
