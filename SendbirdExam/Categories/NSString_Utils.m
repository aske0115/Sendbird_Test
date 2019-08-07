//
//  NSString_Utils.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 08/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "NSString_Utils.h"

@implementation NSString (Utils)
- (NSString *)stringByUrlEncoding
{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}
@end
