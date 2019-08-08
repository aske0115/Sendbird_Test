//
//  SBNewBookViewModel.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 06/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBBookViewModel.h"
#import "SBBookModel.h"
#import "SBBaseBookModel.h"
#import "SBAPIManager.h"
#import "SBResult.h"
#import "NSString_Utils.h"


@interface SBBookViewModel ()
@property (nonatomic, strong) SBBaseBookModel *model;
@property (nonatomic, assign) NSInteger page;

@end
@implementation SBBookViewModel

- (id)init {
    self = [super init];
    if (self) {
        _model = [[SBBaseBookModel alloc] init];
        _page = 0;
    }
    return self;
}

- (void)requestNewBookWithCompletion:(void(^)(BOOL success, NSError *error))completion {
    [[SBAPIManager shared] requestNewBooks:^(SBResult<SBBaseBookModel *> * _Nonnull result) {
        if (result.value != nil && result.value.totalCount > 0) {
            __weak typeof(self) weakSelf = self;

                weakSelf.model = result.value;
                completion(true,nil);
        } else {
            if(result.error == nil) {
                completion(false,[NSError errorWithDomain:@"response EmptyData" code:-1001 userInfo:nil]);
            } else {
                completion(false,result.error);
            }
        }
    }];
}

- (void)requestSearchBookWithQuery:(NSString *)query first:(BOOL)isFirst  completion:(void(^)(BOOL success, NSError *error))completion {
    
    if(isFirst) {
        self.page = 0;
    }
    
    self.page++;
    
    [[SBAPIManager shared] requestSearchQuery:query.stringByUrlEncoding page:self.page completion:^(SBResult<SBBaseBookModel *> * _Nonnull result) {
        if (result.value != nil && result.value.totalCount > 0) {
            __weak typeof(self) weakSelf = self;
            //            dispatch_async(dispatch_get_main_queue(), ^{
            if(weakSelf.page == 1) {
                weakSelf.model = result.value;
            } else {
                weakSelf.model.books = [weakSelf.model.books arrayByAddingObjectsFromArray:result.value.books];
//                [weakSelf.model.books arrayByAddingObjectsFromArray:result.value.books];
            }
            
            completion(true,nil);
            //            });
        } else {
            if(result.error == nil) {
                completion(false,[NSError errorWithDomain:@"No SearchResult" code:-99 userInfo:nil]);
            } else {
                completion(false,result.error);
            }
        }
    }];
}

- (BOOL)hasMoreList {
    return self.model.totalCount > self.model.books.count;
}

- (NSInteger)modelCount {
    return self.model.books.count;
}

- (NSString *)isbn13:(NSIndexPath *)path {
    return self.model.books[path.row].isbn13;
}

- (NSString *)title:(NSIndexPath *)path {
    return self.model.books[path.row].title;
}

- (NSString *)subTitle:(NSIndexPath *)path {
    return self.model.books[path.row].subtitle;
}

- (NSString *)price:(NSIndexPath *)path {
    return self.model.books[path.row].price;
}

- (NSURL *)thumbNailURL:(NSIndexPath *)path {
    return self.model.books[path.row].thumbnailImageURL;
}
@end
