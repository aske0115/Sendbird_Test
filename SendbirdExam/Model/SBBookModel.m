//
//  SBBookModel.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 03/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBBookModel.h"

@implementation SBBookModel
- (id)initWithBookModel:(NSDictionary *)model {
    self = [super init];
    if (self) {
        self.bookId = model[@"isbn13"];
        self.bookURL = [NSURL URLWithString:model[@"url"]];
        self.title = model[@"title"];
        self.subtitle = model[@"subtitle"];
        self.price = model[@"price"];
        self.thumbnailImageURL = [NSURL URLWithString:model[@"image"]];
    }
    return self;
}
@end
