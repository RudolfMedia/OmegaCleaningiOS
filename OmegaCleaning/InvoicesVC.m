//
//  InvoicesVC.m
//  OmegaCleaning
//
//  Created by Dan Rudolf on 7/29/14.
//  Copyright (c) 2014 com.rudolfmedia. All rights reserved.
//

#import "InvoicesVC.h"
#import "InvoiceDetailVC.h"

@interface InvoicesVC () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *invoiceTableView;

@property NSMutableArray *invoiceArray;

@end

@implementation InvoicesVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.invoiceArray = [NSMutableArray new];
    [self.navigationItem setHidesBackButton:YES animated:YES];
    [self getInvoiceData];

}

- (void)getInvoiceData{

    PFQuery *invoiceQuery = [PFQuery queryWithClassName:@"Invoice"];
    [invoiceQuery whereKey:@"CustomerID" equalTo:[PFUser currentUser]];
    [invoiceQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        if (!error) {
            for (PFObject *invoice in objects) {

                [self.invoiceArray addObject:invoice];
            }
            NSLog(@"%@", self.invoiceArray);
            [self.invoiceTableView reloadData];
        }

        else{

            NSLog(@"%@",error.description);
        }
    }];

}



#pragma mark - TableView DataSource / Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.invoiceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSDictionary *invoiceDictionary = [self.invoiceArray objectAtIndex:indexPath.row];

    cell.textLabel.text = [NSString stringWithFormat:@"Date: %@", [invoiceDictionary objectForKey:@"Date"]];
    cell.detailTextLabel.text = [NSString stringWithFormat:@"Invoice No. %@",[invoiceDictionary objectForKey:@"InvoiceNumber"]];

    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    return @"My Invoices";
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"DetailSegue"]) {

    InvoiceDetailVC *destinationVC = [segue destinationViewController];
    NSIndexPath *selectedIndex = self.invoiceTableView.indexPathForSelectedRow;
    NSDictionary *invoice = [self.invoiceArray objectAtIndex:selectedIndex.row];
    destinationVC.detailDictionary = invoice;

    }
}

@end
