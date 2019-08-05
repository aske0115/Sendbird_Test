//
//  SBResult.h
//  SendbirdExam
//
//  Created by GeunHwa Lee on 06/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SBResult<ObjectType> : NSObject
@property (nonatomic, strong, nullable) ObjectType value;
@property (nonatomic, strong, nullable) NSError *error;
@end

NS_ASSUME_NONNULL_END
