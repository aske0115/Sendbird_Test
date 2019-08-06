//
//  SBNewBookViewModel.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 06/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBNewBookViewModel : NSObject
- (void)requestNewBookWithCompletion:(void(^)(void))completion;

- (NSInteger)modelCount;

- (NSString *)isbn13:(NSIndexPath *)path;
- (NSString *)title:(NSIndexPath *)path;
- (NSString *)subTitle:(NSIndexPath *)path;
- (NSString *)price:(NSIndexPath *)path;
- (NSURL *)thumbNailURL:(NSIndexPath *)path;
@end

NS_ASSUME_NONNULL_END
