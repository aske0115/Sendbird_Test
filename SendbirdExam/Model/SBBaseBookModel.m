//
//  SBBaseBookModel.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 03/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBBaseBookModel.h"

@implementation SBBaseBookModel
- (id)initWithJSON:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        NSArray *book = dictionary[@"books"];
        for(NSDictionary *dic in book){
            
        }
        self.books = dictionary[@"books"];
    }
    
    return self;
}
@end
