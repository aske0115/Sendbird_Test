//
//  SBSearchKeywordViewModel.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 07/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBSearchKeywordViewModel.h"

@interface SBSearchKeywordViewModel ()
@property (nonatomic, readwrite) NSArray<NSString *> *keywords;
@end


@implementation SBSearchKeywordViewModel
- (NSArray<NSString *> *)keywords {
//    return @[@"sendbird",@"swift",@"objective-c",@"iOS",@"Apple"];
    return [self savedKeyword];
}

- (NSArray<NSString *> *)prefixKeyword:(NSString *)keyword {
//    NSArray *arr = @[@"sendbird",@"swift",@"objective-c",@"iOS",@"Apple"];
    NSArray *arr = [self savedKeyword];
    NSPredicate *sPredicate =
    [NSPredicate predicateWithFormat:@"SELF contains[c] %@",keyword];
    return [arr filteredArrayUsingPredicate:sPredicate];
//    arr filteredArrayUsingPredicate:[NSPredicate pre]
}
- (NSMutableArray<NSString *> *)savedKeyword {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *savedKeyword = (NSMutableArray *)[defaults objectForKey:@"recentKeywords"];
    if(savedKeyword == nil) {
        savedKeyword = [NSMutableArray array];
    }
    return savedKeyword;
}
- (void)saveSearchKeyword:(NSString *)keyword {
    if (keyword == nil) {
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSMutableArray *savedKeyword = [NSMutableArray arrayWithArray:[self savedKeyword]];
    if (![savedKeyword containsObject:keyword]) {
        [savedKeyword insertObject:keyword atIndex:0];
    }
    [defaults setObject:savedKeyword forKey:@"recentKeywords"];
    [defaults synchronize];
}

@end
