//
//  MainCollectionViewCell.m
//  团购项目
//
//  Created by Yi Zhang on 2019/2/26.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "MainCollectionViewCell.h"
#import "dealModel.h"
#import "UIImageView+WebCache.h"

@interface MainCollectionViewCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *oldPriceLabel;
@property (weak, nonatomic) IBOutlet UILabel *salesNumLabel;

@end

@implementation MainCollectionViewCell

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg_dealcell"]];
}

- (void)showUIWithModel:(dealModel *)model
{
    [self.imageView sd_setImageWithURL: [NSURL URLWithString:model.image_url]];
    self.titleLabel.text = model.title;
    self.detailLabel.text = model.Description;
    self.priceLabel.text = model.current_price;
    self.oldPriceLabel.text = model.list_price;
}

@end
