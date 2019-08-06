//
//  SBDetailBookMldel.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 03/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBBookModel.h"
/*
 "error": "0"
 "authors": "Julien Vehent"
 "publisher": "Manning"
 "iSBn10": "1617294136"
 "pages": "384"
 "year": "2018"
 "rating": "5"
 "desc": "An application running in the cloud can benefit from incredible efficiencies, but they come with unique security threats too. A DevOps team's highest priority is understanding those risks and hardening the system against them.Securing DevOps teaches you the essential techniques to secure your cloud ..."
 "pdf": {
 "Chapter 2": "https://itbook.store/files/9781617294136/chapter2.pdf",
 "Chapter 5": "https://itbook.store/files/9781617294136/chapter5.pdf"
 }
 */

NS_ASSUME_NONNULL_BEGIN

@interface SBDetailBookModel : SBBookModel
@property (nonatomic, assign) NSInteger errorCode;
@property (nonatomic, readonly) NSString *authors;
@property (nonatomic, readonly) NSString *publisher;
@property (nonatomic, readonly) NSString *isbn10;
@property (nonatomic, readonly) NSString *pages;
@property (nonatomic, readonly) NSString *year;
@property (nonatomic, readonly) NSString *rating;
@property (nonatomic, readonly) NSString *desc;
@property (nonatomic, readonly) NSString *language;
@property (nonatomic, readonly) NSDictionary *pdf;
@end

NS_ASSUME_NONNULL_END
