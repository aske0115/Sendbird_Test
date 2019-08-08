//
//  SBSearchBookResultViewController.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 07/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBBookListViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SBSearchBookResultViewController : SBBookListViewController
- (void)requestSearch:(NSString *)query initialRequest:(BOOL)isFirst;
@end

NS_ASSUME_NONNULL_END
