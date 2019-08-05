//
//  SBBaseBookTableViewCell.m
//  SendbirdExam
//
//  Created by GeunHwa Lee on 05/08/2019.
//  Copyright © 2019 Aske. All rights reserved.
//

#import "SBBaseBookTableViewCell.h"


@interface SBBaseBookTableViewCell ()



@end


@implementation SBBaseBookTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

//- (void)configureCell:(SBBookModel *)model {
//    self.titleLabel.text = model.title;
//    self.subtitleLabel.text = model.subtitle;
//    self.priceLabel.text = model.price;
//    [self.thumbnailImageView setImageWithURL:model.thumbnailImageURL];
//}

@end
