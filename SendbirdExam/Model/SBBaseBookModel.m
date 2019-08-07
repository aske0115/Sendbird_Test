//
//  SBBaseBookModel.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 03/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBBaseBookModel.h"
@interface SBBaseBookModel()

@property (nonatomic, assign, readwrite) NSInteger totalCount;
@property (nonatomic, assign, readwrite) NSInteger errorCode;
@end


@implementation SBBaseBookModel

- (id)initWithJSON:(NSDictionary *)dictionary {
    self = [super init];
    if (self) {
        _totalCount = [(NSString *)dictionary[@"total"] integerValue];
        _errorCode = [(NSString *)dictionary[@"error"] integerValue];
        
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
