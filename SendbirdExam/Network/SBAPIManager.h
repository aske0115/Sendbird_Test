//
//  SBAPIManager.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 03/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

#import "SBRequestQuery.h"
#import "SBBaseBookModel.h"
#import "SBDetailBookModel.h"
#import "SBResult.h"

NS_ASSUME_NONNULL_BEGIN

@interface SBAPIManager : NSObject
+(SBAPIManager *)shared;

- (void)requestNewBooks:(void(^)(SBResult<SBBaseBookModel *> *))completion;
- (void)requestWithQuery:(NSString *)query completion:(void(^)(SBBaseBookModel* model))completion;
- (void)requestBookWithBookid:(NSString *)bookId completion:(void(^)(SBDetailBookModel *))completion;
- (void)requestNewBook:(void(^)(SBBaseBookModel *))completion;
- (void)requestSearchQuery:(NSString *)query page:(NSInteger)page completion:(void(^)(SBBaseBookModel *))completion;
@end

NS_ASSUME_NONNULL_END
