//
//  popView.h
//  团购项目
//
//  Created by Yi Zhang on 2019/2/23.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class popView;

@protocol MyPopviewDataSource <NSObject>

- (NSInteger)numberOfRowsInLeftTable:(popView *)popView;
- (NSString *)popView:(popView *)popView titleForRow:(NSInteger)row;
- (NSString *)popView:(popView *)popView imageForRow:(NSInteger)row;
- (NSArray *)popView:(popView *)popView subDataForRow:(NSInteger)row;

@end

@protocol MyPopviewDelegate <NSObject>

- (void)popView:(popView *)popView didSelectRowAtLeftTable:(NSInteger)row;
- (void)popView:(popView *)popView didSelectRowAtRightTable:(NSInteger)row;

@end

@interface popView : UIView

@property (nonatomic, strong)NSArray *categoryArr;
@property (nonatomic, strong)NSArray *cityArr;

@property (nonatomic, assign)id<MyPopviewDataSource> dataSource;
@property (nonatomic, assign)id<MyPopviewDelegate> delegate;

+ (popView*)makePopView;

@end

NS_ASSUME_NONNULL_END
