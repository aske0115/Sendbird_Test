//
//  SBBookModel.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 03/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SBBookModelDelegate
@required
- (id)initWithJSON:(NSDictionary *)dictionary;
@end

@interface SBBookModel : NSObject <SBBookModelDelegate>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, strong) NSString *bookId;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSURL *thumbnailImageURL;
@property (nonatomic, strong) NSURL *bookURL;

- (id)initWithJSON:(NSDictionary *)dictionary;
@end

NS_ASSUME_NONNULL_END
