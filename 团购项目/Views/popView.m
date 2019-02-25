//
//  popView.m
//  团购项目
//
//  Created by Yi Zhang on 2019/2/23.
//  Copyright © 2019 Yi Zhang. All rights reserved.
//

#import "popView.h"

@interface popView() <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *leftTV;
@property (weak, nonatomic) IBOutlet UITableView *rightTV;
@property (nonatomic, assign) NSInteger selectRow;

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
        //CategoryModel *md = [_categoryArr objectAtIndex:indexPath.row];
        cell.textLabel.text = [self.dataSource popView:self titleForRow:indexPath.row];
        cell.imageView.image = [UIImage imageNamed:[self.dataSource popView:self imageForRow:indexPath.row]];
        NSArray *subDataArray = [self.dataSource popView:self subDataForRow:indexPath.row];
        if (subDataArray.count) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return cell;
    } else {
        static NSString *str = @"Mycell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        }
        cell.textLabel.text = [self.dataSource popView:self subDataForRow:_selectRow][indexPath.row];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == _leftTV) {
        self.selectRow = indexPath.row;
        [_rightTV reloadData];
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == _leftTV) {
        // return _categoryArr.count;
        return [self.dataSource numberOfRowsInLeftTable:self];
    } else {
        return [self.dataSource popView:self subDataForRow:_selectRow].count;
    }
}

@end
