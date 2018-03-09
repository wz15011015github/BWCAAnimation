//
//  CAAnimationViewController.m
//  CAAnimation
//
//  Created by ff on 2018/2/27.
//  Copyright © 2018年 BTStudio. All rights reserved.
//

#import "CAAnimationViewController.h"
#import "Macro.h"
#import "CABasicAnimationListViewController.h"
#import "CAKeyframeAnimationListViewController.h"
#import "CATransitionListViewController.h"
#import "OtherListViewController.h"

@interface CAAnimationViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation CAAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 11.0, *)) {
        self.navigationController.navigationBar.prefersLargeTitles = YES;
        self.navigationItem.largeTitleDisplayMode = UINavigationItemLargeTitleDisplayModeAlways;
    } else {
        // Fallback on earlier versions
    }
    
    self.navigationItem.title = @"CAAnimation";
    
    [self.view addSubview:self.tableView];
}


#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (0 == section) {
        return 3;
    } else if (1 == section) {
        return 1;
    } else if (2 == section) {
        return 1;
    } else {
        return 1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    NSString *text = @"";
    if (0 == indexPath.section) {
        if (0 == indexPath.row) {
            text = @"CABasicAnimation (基础动画)";
        } else if (1 == indexPath.row) {
            text = @"CAKeyframeAnimation (关键帧动画)";
        } else if (2 == indexPath.row) {
            text = @"CASpringAnimation (弹性动画)";
        }
    } else if (1 == indexPath.section) {
        text = @"CATransition (转场动画)";
    } else if (2 == indexPath.section) {
        text = @"CAAnimationGroup (组动画)";
    } else {
        text = @"其他";
    }
    cell.textLabel.text = text;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (0 == section) {
        return @"CAPropertyAnimation (属性动画)";
    } else if (1 == section) {
        return @"CATransition (转场动画)";
    } else if (2 == section) {
        return @"CAAnimationGroup (组动画)";
    } else {
        return @"其他";
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    if (0 == section) {
        return @"Tips: iOS 9.0之后新增CASpringAnimation类，它实现弹簧效果的动画，是CABasicAnimation的子类.";
    }
    return @"";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *title = @"";
    if (0 == indexPath.section) {
        if (0 == indexPath.row) {
            title = @"CABasicAnimation (基础动画)";
            CABasicAnimationListViewController *vc = [[CABasicAnimationListViewController alloc] init];
            vc.title = title;
            [self.navigationController pushViewController:vc animated:YES];
            
        } else if (1 == indexPath.row) {
            title = @"CAKeyframeAnimation (关键帧动画)";
            CAKeyframeAnimationListViewController *vc = [[CAKeyframeAnimationListViewController alloc] init];
            vc.title = title;
            [self.navigationController pushViewController:vc animated:YES];
            
        } else if (2 == indexPath.row) {
            title = @"CASpringAnimation (弹性动画)";
        }
    } else if (1 == indexPath.section) {
        title = @"CATransition (转场动画)";
        CATransitionListViewController *vc = [[CATransitionListViewController alloc] init];
        vc.title = title;
        [self.navigationController pushViewController:vc animated:YES];
    } else if (2 == indexPath.section) {
        title = @"CAAnimationGroup (组动画)";
    } else if (3 == indexPath.section) {
        title = @"其他";
        OtherListViewController *vc = [[OtherListViewController alloc] init];
        vc.title = title;
        [self.navigationController pushViewController:vc animated:YES];
    }
}


#pragma mark - Getters

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellIdentifier"];
    }
    return _tableView;
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
