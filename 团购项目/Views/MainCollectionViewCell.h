//
//  MainCollectionViewCell.h
//  团购项目
//
//  Created by Yi Zhang on 2019/2/26.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class dealModel;

@interface MainCollectionViewCell : UICollectionViewCell

- (void)showUIWithModel:(dealModel *)model;

@end

NS_ASSUME_NONNULL_END
