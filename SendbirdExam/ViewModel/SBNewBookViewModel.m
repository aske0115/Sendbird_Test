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
#import "SBResult.h"
@interface SBNewBookViewModel ()
@property (nonatomic, strong) NSArray<SBBookModel *> *model;
@end
@implementation SBNewBookViewModel

- (void)requestNewBookWithCompletion:(void (^)(void))completion {
    [[SBAPIManager shared] requestNewBooks:^(SBResult<SBBaseBookModel *> * _Nonnull result) {
        if (result.value != nil) {
            dispatch_async(dispatch_get_main_queue(), ^{
                __weak typeof(self) weakSelf = self;
                weakSelf.model = result.value.books;
                completion();
            });
        } else {
            NSLog(@"Erorr == %@",result.error.description);
            completion();
        }
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
