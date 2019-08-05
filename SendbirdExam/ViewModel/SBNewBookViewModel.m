//
//  SBNewBookViewModel.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 06/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBNewBookViewModel.h"
#import "SBBookModel.h"
#import "SBAPIManager.h"

@interface SBNewBookViewModel ()
@property (nonatomic, strong) NSArray<SBBookModel *> *model;
@end
@implementation SBNewBookViewModel

- (void)requestNewBookWithCompletion:(void (^)(void))completion {
    [[SBAPIManager shared] requestNewBook:^(SBBaseBookModel * _Nonnull model) {
        dispatch_async(dispatch_get_main_queue(), ^{
            __weak typeof(self) weakSelf = self;
            weakSelf.model = model.books;
            completion();
        });
    }];
}

- (NSInteger)modelCount {
    return self.model.count;
}

- (NSString *)title:(NSIndexPath *)path {
    return self.model[path.row].title;
}

- (NSString *)subTitle:(NSIndexPath *)path {
    return self.model[path.row].subtitle;
}

- (NSString *)price:(NSIndexPath *)path {
    return self.model[path.row].price;
}

- (NSURL *)thumbNailURL:(NSIndexPath *)path {
    return self.model[path.row].thumbnailImageURL;
}
@end
