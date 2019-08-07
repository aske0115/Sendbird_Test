//
//  SBBaseBookModel.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 03/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SBBookModel.h"

NS_ASSUME_NONNULL_BEGIN



@interface SBBaseBookModel : NSObject
@property (nonatomic, assign, readonly) NSInteger totalCount;
@property (nonatomic, assign, readonly) NSInteger errorCode;
@property (nonatomic, strong) NSArray<SBBookModel *> *books;
- (id)initWithJSON:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
