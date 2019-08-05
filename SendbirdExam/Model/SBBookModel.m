//
//  SBBookModel.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 03/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBBookModel.h"

@implementation SBBookModel
- (id)initWithJSON:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        self.bookId = dictionary[@"isbn13"];
        self.bookURL = [NSURL URLWithString:dictionary[@"url"]];
        self.title = dictionary[@"title"];
        self.subtitle = dictionary[@"subtitle"];
        self.price = dictionary[@"price"];
        self.thumbnailImageURL = [NSURL URLWithString:dictionary[@"image"]];
    }
    return self;
}
@end
