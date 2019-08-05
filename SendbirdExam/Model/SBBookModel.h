//
//  SBBookModel.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 03/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBBookModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *bookId;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSURL *thumbnailImageURL;
@property (nonatomic, strong) NSURL *bookURL;

- (id)initWithBookModel:(NSDictionary *)model;
@end

NS_ASSUME_NONNULL_END
