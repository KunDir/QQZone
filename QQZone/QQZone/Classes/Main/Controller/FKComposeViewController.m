//
//  FKComposeViewController.m
//  QQZone
//
//  Created by kun on 15/2/4.
//  Copyright (c) 2015年 kun. All rights reserved.
//

#import "FKComposeViewController.h"

@implementation FKComposeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"写说说";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(close)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Combut" style:UIBarButtonItemStyleDone target:nil action:nil];
    
}

- (void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
