//
//  SBRequestQuery.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 03/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBRequestQuery.h"

@interface SBRequestQuery()
@property (nonatomic, strong) NSString *searchQuery;
@property (nonatomic, assign) NSInteger currentPage;
@property (nonatomic, strong) NSString *bookId;
@end
@implementation SBRequestQuery
//+ (NSArray<NSURLQueryItem *> *)searchQuery:(NSString *)query page:(NSInteger)page {
//    return @[[NSURLQueryItem queryItemWithName:@"query" value:query],[NSURLQueryItem queryItemWithName:@"page" value:@(page).stringValue]];
//
//}
//
//+ (NSURLQueryItem *)booksQuery:(NSString *)bookId {
//    return [NSURLQueryItem queryItemWithName:@"books" value:bookId];
//
//}
//+(NSString *)queryWithType:(APIRequestType)type searchQuery:(nullable NSString *)query page:(NSInteger)page bookId:(nullable NSString *)bookId {
//    switch(type) {
//        case requestNew: {
//            return @"/new";
//        }
//        case requestSearch: {
//            return @"/search/"
//        }
//    }
//}

- (id)initWithQuery:(NSString *)query {
    self = [super init];
    if (self) {
        self.searchQuery = query;
    }
    return self;
}

- (NSString *)query:(APIRequestType)type {
    switch(type) {
        case requestNew: {
            return @"/new";
        }
        case requestSearch: {
            if (self.searchQuery != nil) {
                return [@"/search/" stringByAppendingString:self.searchQuery] ;
            }
            return @"";
        }
        case requestDetail: {
            return [@"/books/" stringByAppendingString:self.searchQuery];
        }
    }
}
@end
