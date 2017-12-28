//
//  MOOneViewController.m
//  音频Demo
//
//  Created by mo on 2017/12/28.
//  Copyright © 2017年 momo. All rights reserved.
//

#import "MOOneViewController.h"
#import "MOMultiLanguage.h"

@interface MOOneViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView_main;

@property (nonatomic, strong)NSMutableArray *array_main;

@end

@implementation MOOneViewController

- (void)initData{
    
    NSMutableArray *array = [NSMutableArray array];
    
    [array addObject:[MOMultiLanguage getLanguageWithKey:@"域名"]];
    [array addObject:[MOMultiLanguage getLanguageWithKey:@"编辑"]];
    [array addObject:[MOMultiLanguage getLanguageWithKey:@"查看连接"]];
    [array addObject:[MOMultiLanguage getLanguageWithKey:@"取消"]];
    [array addObject:[MOMultiLanguage getLanguageWithKey:@"确定"]];
    [array addObject:[MOMultiLanguage getLanguageWithKey:@"人"]];
    [array addObject:[MOMultiLanguage getLanguageWithKey:@"月"]];
    [array addObject:[MOMultiLanguage getLanguageWithKey:@"我"]];
    [array addObject:[MOMultiLanguage getLanguageWithKey:@"添加"]];
    [array addObject:[MOMultiLanguage getLanguageWithKey:@"删除"]];
    [array addObject:[MOMultiLanguage getLanguageWithKey:@"上网密码"]];
    [array addObject:[MOMultiLanguage getLanguageWithKey:@"填写信息"]];
    [array addObject:[MOMultiLanguage getLanguageWithKey:@"确认"]];
    [array addObject:[MOMultiLanguage getLanguageWithKey:@"小时"]];
    [array addObject:[MOMultiLanguage getLanguageWithKey:@"分钟"]];
    self.array_main = array;
    [self.tableView_main reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView_main.rowHeight = 80;
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"切换" style:UIBarButtonItemStyleDone target:self action:@selector(rigButton)];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"清除" style:UIBarButtonItemStyleDone target:self action:@selector(leftButton)];

    [self initData];
    
}

- (void)rigButton{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *str_language = [userDefaults valueForKey:@"MOMultiLanguage"];
    
    if (str_language.length == 0 || [str_language isEqualToString:@"dic_chinese"]) {

        
        [userDefaults setObject:@"dic_english" forKey:@"MOMultiLanguage"];
        
    }else{
        
        [userDefaults setObject:@"dic_chinese" forKey:@"MOMultiLanguage"];
    }
    
    [userDefaults synchronize];
    
    
    NSLog(@"%@",str_language);
    
     [self initData];
    
}

- (void)leftButton{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:@"MOMultiLanguage"];
    [self initData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.array_main.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.array_main[indexPath.row];
    
    return cell;
    
}

- (UITableView *)tableView_main{
    if (!_tableView_main) {
        _tableView_main = [[UITableView alloc] initWithFrame:self.view.frame];
        _tableView_main.delegate = self;
        _tableView_main.dataSource = self;
        _tableView_main.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_tableView_main];
    }
    return _tableView_main;
}
- (NSMutableArray *)array_main{
    
    if (!_array_main) {
        _array_main = [NSMutableArray array];
    }
    return _array_main;
}

@end
