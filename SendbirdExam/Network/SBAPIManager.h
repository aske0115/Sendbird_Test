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


NS_ASSUME_NONNULL_BEGIN

@interface SBAPIManager : NSObject
+(SBAPIManager *)shared;

- (void)requestWithQuery:(NSString *)query completion:(void(^)(SBBaseBookModel* model))completion;
@end

NS_ASSUME_NONNULL_END
