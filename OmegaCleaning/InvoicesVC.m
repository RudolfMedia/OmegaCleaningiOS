//
//  InvoicesVC.m
//  OmegaCleaning
//
//  Created by Dan Rudolf on 7/29/14.
//  Copyright (c) 2014 com.rudolfmedia. All rights reserved.
//

#import "InvoicesVC.h"

@interface InvoicesVC () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *invoiceTableView;

@end

@implementation InvoicesVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setHidesBackButton:YES animated:YES];
}

#pragma mark - TableView DataSource / Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return @"My Invoices";
}

@end
