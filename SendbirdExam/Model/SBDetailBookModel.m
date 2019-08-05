//
//  SBDetailBookMldel.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 03/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

/**
 {
 "error": "0"
 "title": "Securing DevOps"
 "subtitle": "Security in the Cloud"
 "authors": "Julien Vehent"
 "publisher": "Manning"
 "isbn10": "1617294136"
 "isbn13": "9781617294136"
 "pages": "384"
 "year": "2018"
 "rating": "5"
 "desc": "An application running in the cloud can benefit from incredible efficiencies, but they come with unique security threats too. A DevOps team's highest priority is understanding those risks and hardening the system against them.Securing DevOps teaches you the essential techniques to secure your cloud ..."
 "price": "$26.98"
 "image": "https://itbook.store/img/books/9781617294136.png"
 "url": "https://itbook.store/books/9781617294136"
 "pdf": {
 "Chapter 2": "https://itbook.store/files/9781617294136/chapter2.pdf",
 "Chapter 5": "https://itbook.store/files/9781617294136/chapter5.pdf"
 }
 }
 **/
#import "SBDetailBookModel.h"
@interface SBDetailBookModel ()
@property (nonatomic, strong) NSString *authors;
@property (nonatomic, strong) NSString *publisher;
@property (nonatomic, strong) NSString *isbn10;
@property (nonatomic, strong) NSString *pages;
@property (nonatomic, strong) NSString *year;
@property (nonatomic, strong) NSString *raing;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSDictionary *pdf;
@end
@implementation SBDetailBookModel
- (id)initWithJSON:(NSDictionary *)dictionary {
    self = [super initWithJSON:dictionary];
    if (self) {
        self.authors = dictionary[@"authors"];
        self.publisher = dictionary[@"publisher"];
        self.pages = dictionary[@"pages"];
        self.year = dictionary[@"year"];
        self.desc = dictionary[@"desc"];
        self.pdf = dictionary[@"pdf"];
    }
    return self;
}
@end
