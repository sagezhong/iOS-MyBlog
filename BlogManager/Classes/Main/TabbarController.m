//
//  TabbarController.m
//  BlogManager
//
//  Created by 史莱斯 on 2018/7/27.
//  Copyright © 2018年 史莱斯. All rights reserved.
//

#import "TabbarController.h"
#import "NavigationViewController.h"
#import "ManagerViewController.h"
#import "BlogViewController.h"

@interface TabbarController ()

@end

@implementation TabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setUpChildeViewController];
    self.tabBarItem.title = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


- (void)setUpChildeViewController {
    //添加子控件
    BlogViewController *blogVC = [[BlogViewController alloc] init];
    [self setUpChildViewController:blogVC image:[UIImage imageNamed:@"blog_n"] selectedImage:[UIImage imageNamed:@"blog_s"] title:@"博客"];
    
    //添加子控件
    ManagerViewController *managerVC = [[ManagerViewController alloc] init];
    [self setUpChildViewController:managerVC image:[UIImage imageNamed:@"manager_n"] selectedImage:[UIImage imageNamed:@"manager_s"] title:@"后台"];
    
    
}

-(void)setUpChildViewController:(UIViewController *)vc
                          image:(UIImage *)image
                  selectedImage:(UIImage *)selectedImage
                          title:(NSString *)title {
    // 关闭默认的颜色
    vc.tabBarItem.image = image;
    vc.tabBarItem.selectedImage = selectedImage;
 
    vc.tabBarItem.titlePositionAdjustment = UIOffsetMake(15, 15);
    vc.title = title;
    
    CGFloat offset = 5.0;
    vc.tabBarItem.imageInsets = UIEdgeInsetsMake(offset, 0, -offset, 0);
    
    
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:vc];
    nav.navigationBar.barTintColor = [UIColor colorWithRed:33/255.0 green:33/255.0 blue:33/255.0 alpha:1];
    [nav.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    [self addChildViewController:nav];
    
    
    
    
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
