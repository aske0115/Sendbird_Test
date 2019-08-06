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
        NSMutableArray *booksArray = [[NSMutableArray alloc] init];
       
        for(NSDictionary *dic in book){
            [booksArray addObject:[[SBBookModel alloc] initWithJSON:dic] ];
        }
        
        _books = booksArray;
    }
    
    return self;
}

@end
