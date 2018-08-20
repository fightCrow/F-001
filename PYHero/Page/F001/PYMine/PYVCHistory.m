//
//  PYVCHistory.m
//  PYHero
//
//  Created by crow on 2018/8/19.
//  Copyright © 2018 Bob Lee. All rights reserved.
//

#import "PYVCHistory.h"
#import "PYCellShakeNumber.h"

@interface PYVCHistory ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) UITableView *tableView; ///<

@end

@implementation PYVCHistory


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"历史记录";
    [self setup];
    [self setupData];
}

- (void)setup {
    CGFloat bottomNav = [UIApplication sharedApplication].statusBarFrame.size.height + self.navigationController.navigationBar.frame.size.height;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, bottomNav, kScreenWidth, kScreenHeight - bottomNav - PYSafeBottomHeight) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.tableFooterView = [UIView new];
    tableView.backgroundColor = [UIColor clearColor];
    self.tableView = tableView;
    [self.view addSubview:self.tableView];
}

- (void)setupData {
    if (self.type == PYHistoryTypeVoice) {
        
    }else if (self.type == PYHistoryTypeShake) {
        self.mArrData = @[[PYUserManage py_getShakeData:PYLotteryTypeUnionLotto],[PYUserManage py_getShakeData:PYLotteryTypeLecaGreati],[PYUserManage py_getShakeData:PYLotteryTypeSuperLotto]].mutableCopy;
    }else if (self.type == PYHistoryTypeVR) {
        
    }
}

#pragma mark - tabelView Delegate dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.type == PYHistoryTypeShake ? self.mArrData.count : 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.type == PYHistoryTypeShake ? [self.mArrData[section] count] : self.mArrData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.type == PYHistoryTypeShake) {
        NSString *cellID = indexPath.section == 0 ? @"cellShakeUnion" : indexPath.section == 1 ? @"cellShakeLeca" : @"cellShakeSuper";
        if (indexPath.section == 0) {
            PYCellShakeNumber *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                cell = [[PYCellShakeNumber alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            }
            
            NSArray *arr = self.mArrData[indexPath.section];
            [cell py_setupData:[arr objectAtIndex:indexPath.row] type:PYLotteryTypeUnionLotto];
            return cell;
        }else if (indexPath.section == 1) {
            PYCellShakeNumber *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                cell = [[PYCellShakeNumber alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            }
            
            NSArray *arr = self.mArrData[indexPath.section];
            [cell py_setupData:[arr objectAtIndex:indexPath.row] type:PYLotteryTypeLecaGreati];
            return cell;
        }else {
            PYCellShakeNumber *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
            if (!cell) {
                cell = [[PYCellShakeNumber alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
            }
            
            NSArray *arr = self.mArrData[indexPath.section];
            [cell py_setupData:[arr objectAtIndex:indexPath.row] type:PYLotteryTypeSuperLotto];
            return cell;
        }
    }else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@""];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@""];
        }
        
        return cell;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (self.type == PYHistoryTypeShake) {
        UILabel *lab = [[UILabel alloc] init];
        lab.font = kFont_XL;
        lab.textColor = kColor_Normal;
        lab.text = section == 0 ? @"    双色球中奖记录" : section == 1 ? @"    七乐彩中奖记录" : @"    大乐透中奖记录";
        lab.backgroundColor = [UIColor colorWithARGBString:@"#eeeeee"];
        return lab;
    }else {
        return [UIView new];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return self.type == PYHistoryTypeShake ? 40 : 0.01;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end