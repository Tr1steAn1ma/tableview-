//
//  TableViewCell.h
//  tableview展开菜单
//
//  Created by TiAmo_假情绪 on 16/1/11.
//  Copyright © 2016年 TiAmo_假情绪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userIma;
@property (weak, nonatomic) IBOutlet UILabel *UserName;
@property (weak, nonatomic) IBOutlet UILabel *message;
@property (weak, nonatomic) IBOutlet UILabel *time;

@end
