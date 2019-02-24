//
//  popView.m
//  团购项目
//
//  Created by Yi Zhang on 2019/2/23.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "popView.h"
#import "CategoryModel.h"

@interface popView() <UITableViewDelegate, UITableViewDataSource>

//@property (nonatomic, strong)NSArray *categoryArr;
@property (weak, nonatomic) IBOutlet UITableView *leftTV;
@property (weak, nonatomic) IBOutlet UITableView *rightTV;
@property (strong, nonatomic) CategoryModel *selectedModel;
@end

@implementation popView

+ (popView *)makePopView
{
    return [[[NSBundle mainBundle] loadNibNamed:@"popView" owner:self options:nil] firstObject];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath
{
    if (tableView == _leftTV) {
        static NSString *str = @"Mycell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        CategoryModel *md = [_categoryArr objectAtIndex:indexPath.row];
        cell.textLabel.text = md.name;
        cell.imageView.image = [UIImage imageNamed:md.small_icon];
        if (md.subcategories.count) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return cell;
    } else {
        static NSString *str = @"Mycell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.textLabel.text = _selectedModel.subcategories[indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _leftTV) {
        _selectedModel = [_categoryArr objectAtIndex:indexPath.row];
        [_rightTV reloadData];
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _leftTV) {
        return _categoryArr.count;
    } else {
        return _selectedModel.subcategories.count;
    }
}

@end
