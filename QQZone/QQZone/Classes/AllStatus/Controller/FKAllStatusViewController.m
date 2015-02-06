//
//  FKAllStatusViewController.m
//  QQZone
//
//  Created by kun on 15/2/4.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKAllStatusViewController.h"
#import "FKSegmentControl.h"
#import "FKCommon.h"

@implementation FKAllStatusViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    NSArray *items = @[@"全部", @"全部11", @"全部22"];
    if(iOS7)
    {
        UISegmentedControl *sc = [[UISegmentedControl alloc] initWithItems:items];
        sc.frame = CGRectMake(0, 0, 300, 30);
        sc.selectedSegmentIndex = 0;
        sc.tintColor = [UIColor grayColor];
        self.navigationItem.titleView = sc;
    }
    else
    {
        FKSegmentControl *sc = [[FKSegmentControl alloc] init];
        sc.items = items;
        sc.frame = CGRectMake(0, 0, 300, 30);
        sc.selectedSegmentIndex = 0;
        self.navigationItem.titleView = sc;
    }
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"exit" style:UIBarButtonItemStyleDone target:self action:@selector(exit)];
}
- (void)exit
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIViewController *loginVc = [storyboard instantiateInitialViewController];
    
    self.view.window.rootViewController = loginVc;
}
@end
