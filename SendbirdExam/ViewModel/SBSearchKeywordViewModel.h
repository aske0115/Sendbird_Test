//
//  SBSearchKeywordViewModel.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 07/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBSearchKeywordViewModel : NSObject
//@property (nonatomic, readonly) NSArray<NSString *> *keywords;
- (NSArray<NSString *> *)keywords;
- (NSArray<NSString *> *)prefixKeyword:(NSString *)keyword;
- (void)saveSearchKeyword:(NSString *)keyword;
@end

NS_ASSUME_NONNULL_END
