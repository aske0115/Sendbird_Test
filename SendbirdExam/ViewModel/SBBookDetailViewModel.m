//
//  SBBookDetailViewModel.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 06/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBBookDetailViewModel.h"
#import "SBDetailBookModel.h"
#import "SBAPIManager.h"
#import "SBResult.h"
@interface SBBookDetailViewModel ()
@property (nonatomic, strong) SBDetailBookModel *model;
@property (nonatomic, readwrite) NSString *title;
@property (nonatomic, readwrite) NSString *subTitle;
@property (nonatomic, readwrite) NSString *desc;
@property (nonatomic, readwrite) NSURL *thumbnailURL;
@end
@implementation SBBookDetailViewModel
- (void)requestBookWithBookID:(NSString *)isbn13 completion:(void(^)(BOOL success, NSError *error))completion {
    [[SBAPIManager shared] requestBookWithBookid:isbn13 completion:^(SBResult<SBDetailBookModel *> * _Nonnull result) {
        if (result.value != nil) {
            __weak typeof(self) weakSelf = self;
            //            dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.model = result.value;
            weakSelf.title = weakSelf.model.title;
            weakSelf.subTitle =  weakSelf.model.subtitle;
            weakSelf.desc = weakSelf.model.desc;
            weakSelf.thumbnailURL = weakSelf.model.thumbnailImageURL;
            completion(true,nil);
            //            });
        } else {
            NSLog(@"Erorr == %@",result.error.description);
            completion(false,result.error);
        }
    }];
}
- (NSArray *)arrayWithDictionary {
    if(self.model == nil) {
        return @[];
    }
    return @[@{@"Price" : self.model.price},
             @{@"Rating"  :   self.model.rating},
             @{@"Author"  :   self.model.authors},
             @{@"Publisher"   :   self.model.publisher},
             @{@"Pages"   :   self.model.pages},
             @{@"Language"    :   self.model.language},
             @{@"ISBN-10" :   self.model.isbn10},
             @{@"ISBN-13" :   self.model.isbn13}
             ];
}

- (nullable NSDictionary *)pdf {
    return self.model.pdf;
}

@end
