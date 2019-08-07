//
//  SBNewBookViewModel.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 06/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBBookViewModel : NSObject
- (void)requestNewBookWithCompletion:(void(^)(void))completion;
- (void)requestSearchBookWithQuery:(NSString *)query first:(BOOL)isFirst  completion:(void(^)(void))completion;

- (NSInteger)modelCount;

- (NSString *)isbn13:(NSIndexPath *)path;
- (NSString *)title:(NSIndexPath *)path;
- (NSString *)subTitle:(NSIndexPath *)path;
- (NSString *)price:(NSIndexPath *)path;
- (NSURL *)thumbNailURL:(NSIndexPath *)path;

- (BOOL)hasMoreList;
@end

NS_ASSUME_NONNULL_END
