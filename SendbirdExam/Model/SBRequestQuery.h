//
//  SBRequestQuery.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 03/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, APIRequestType) {
    requestNew = 0,
    requestSearch,
    requestDetail
};

@interface SBRequestQuery : NSObject
- (id)initWithQuery:(NSString *)query;
- (NSString *)query:(APIRequestType)type;
//@property (nonatomic)
//+(NSString *)queryWithType:(APIRequestType)type param:(NSDictionary *)param;
////+ (NSURLQueryItem *)searchQuery:(NSString *)query page:(NSInteger)page;
////+ (NSURLQueryItem *)booksQuery:(NSString *)bookId;
////+(NSString *)booksQuery:(NSString *)bookId;
////+(NSString *)searchQuery:(NSString *)query page:(NSInteger)page;
////+(NSString *)
@end

NS_ASSUME_NONNULL_END
