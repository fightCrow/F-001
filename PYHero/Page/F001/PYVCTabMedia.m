//
//  PYVCTabMedia.m
//  PYHero
//
//  Created by Bob Lee on 2018/8/15.
//  Copyright © 2018年 Bob Lee. All rights reserved.
//

#import "PYVCTabMedia.h"

@interface PYVCTabMedia ()

@end

@implementation PYVCTabMedia

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.tabBarItem.title;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
