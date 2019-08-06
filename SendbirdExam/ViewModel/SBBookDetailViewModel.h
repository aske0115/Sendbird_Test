//
//  SBBookDetailViewModel.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 06/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBBookDetailViewModel : NSObject

@property (nonatomic, readonly) NSString *title;
@property (nonatomic, readonly) NSString *subTitle;
@property (nonatomic, readonly) NSString *desc;
@property (nonatomic, readonly) NSURL *thumbnailURL;

//@property (nonatomic, readonly) NSString *price;
//@property (nonatomic, readonly) NSString *rating;
//@property (nonatomic, readonly) NSString *author;
//@property (nonatomic, readonly) NSString *publisher;
//@property (nonatomic, readonly) NSString *title;
//@property (nonatomic, readonly) NSString *title;
//@property (nonatomic, readonly) NSString *title;

- (void)requestBookWithBookID:(NSString *)isbn13 completion:(void(^)(BOOL success, NSError *error))completion;

- (NSArray *)arrayWithDictionary;

- (nullable NSDictionary *)pdf;
@end

NS_ASSUME_NONNULL_END
