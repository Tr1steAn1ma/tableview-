//
//  ViewController.m
//  tableview展开菜单
//
//  Created by TiAmo_假情绪 on 16/1/11.
//  Copyright © 2016年 TiAmo_假情绪. All rights reserved.
//

#import "ViewController.h"
#import "ScreenAdaptation.h"
#import "TableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *titleArray;
    BOOL reload;//默认YES 点击即展开
    NSInteger number;//上次点击下标
    NSInteger index;//分区下标
    NSInteger count;//cell行数
}
@property(nonatomic,strong)NSArray *nameArray;
@property(nonatomic,strong)NSArray *titleArray;
@property(nonatomic,strong)UITableView *tab;
@property(nonatomic,strong)NSMutableArray *buttonArray;


@end

@implementation ViewController


//-(void)setThisPage
//{
//    self.navigationItem.title = @"tableView展开菜单";



-(NSArray *)nameArray
{
    if (!_nameArray) {
        NSArray *array0 = @[@"陪伴是最长情的告白",@"我在你身边",@"半阳～",@"久伴",@"love story"];
        NSArray *array1 = @[@"这是第一条测试数据",@"这是第二条测试数据",@"这是第三条测试数据",@"这是第四条测试数据",@"这是第五条测试数据",@"这是第六条测试数据",@"这是第七条测试数据",@"这是第八条测试数据",@"这是第九条测试数据",@"这是第十条测试数据"];
        NSArray *array2 = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
        NSArray *array3 = @[@"a",@"b",@"c",@"d",@"e"];
        NSArray *array4 = @[@"11",@"22",@"33"];
        NSArray *array5 = @[@"q",@"w",@"e",@"r",@"x",@"y",];
        self.nameArray = [NSMutableArray arrayWithObjects:array0,array1,array2,array3,array4,array5,nil];
    }
    return _nameArray;
}
-(NSArray *)titleArray
{
    if (!_titleArray) {
        self.titleArray = [NSArray arrayWithObjects:@".",@"..",@"...",@"....",@".....",@"......", nil];
    }
    return _titleArray;
}
-(NSMutableArray *)buttonArray
{
    for (int i = 0; i<self.titleArray.count; i++) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithObject:@"否" forKey:@"点击"];
        [_buttonArray addObject:dic];
    }
    return _buttonArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.buttonArray = [NSMutableArray array];
    self.navigationItem.title = @"tableView展开菜单";
    
    self.view.backgroundColor = [UIColor orangeColor];
    
        _tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, widthEx(375), widthEx(603)) style:UITableViewStylePlain];
        _tab.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tab.delegate = self;
        _tab.dataSource = self;
    
        [self.view addSubview:_tab];

}


//设置分区
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMakeEx(0, 0, 375, 30)];
    view1.backgroundColor = [UIColor blackColor];
    UIButton *btnTitle = [[UIButton alloc] initWithFrame:CGRectMakeEx(0, 0, 375, 30)];
    btnTitle.titleLabel.font = [UIFont systemFontOfSize:12];
    btnTitle.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btnTitle.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    [btnTitle setTitle:self.titleArray[section] forState:UIControlStateNormal];
    [btnTitle addTarget:self action:@selector(touchUpButton:) forControlEvents:UIControlEventTouchUpInside];
    btnTitle.tag = section;
    [view1 addSubview:btnTitle];

       return view1;
}
//分区个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.titleArray.count;
}
//分区高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 30;
}
-(void)touchUpButton:(UIButton *)sender
{
    if ([[self.buttonArray[sender.tag] valueForKey:@"点击"] isEqualToString:@"否"]) {
        [self.buttonArray[sender.tag] setObject:@"是" forKey:@"点击"];
    }else
    {
        [self.buttonArray[sender.tag] setObject:@"否" forKey:@"点击"];
    }
    NSIndexSet *indexSet=[[NSIndexSet alloc]initWithIndex:sender.tag];
    [self.tab reloadSections:indexSet withRowAnimation:UITableViewRowAnimationFade];
    NSLog(@"--------");
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}
//cell个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([[self.buttonArray[section] valueForKey:@"点击"] isEqualToString:@"是"])
    {
        return [self.nameArray[section] count];
    }else
    {
        return 0;
    }
}
//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString*cellIdentifier = @"TableViewCell";
    TableViewCell*cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell==nil) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"TableViewCell" owner:self options:nil]firstObject];
    }
    if ([[self.buttonArray[indexPath.section] valueForKey:@"点击"] isEqualToString:@"是"]) {
        cell.UserName.text = [self.nameArray[indexPath.section] objectAtIndex:indexPath.row];
//        cell.textLabel.text = [self.nameArray[indexPath.section] objectAtIndex:indexPath.row];
    }else
    {
        return nil;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
