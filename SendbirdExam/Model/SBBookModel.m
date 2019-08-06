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
        _isbn13 = dictionary[@"isbn13"];
        _bookURL = [NSURL URLWithString:dictionary[@"url"]];
        _title = dictionary[@"title"];
        _subtitle = dictionary[@"subtitle"];
        _price = dictionary[@"price"];
        _thumbnailImageURL = [NSURL URLWithString:dictionary[@"image"]];
    }
    return self;
}
@end
