//
//  InvoiceDetailVC.m
//  OmegaCleaning
//
//  Created by Dan Rudolf on 7/29/14.
//  Copyright (c) 2014 com.rudolfmedia. All rights reserved.
//

#import "InvoiceDetailVC.h"

@interface InvoiceDetailVC ()
@property (weak, nonatomic) IBOutlet UILabel *invoiceNumber;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UITextView *detials;

@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeightconstraint;

@property (weak, nonatomic) IBOutlet UILabel *totalCost;

@end

@implementation InvoiceDetailVC


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController.navigationBar.topItem setTitle:@""];

    self.invoiceNumber.text = [self.detailDictionary objectForKey:@"InvoiceNumber"];
    self.date.text = [self.detailDictionary objectForKey:@"Date"];
    self.address.text = [self.detailDictionary objectForKey:@"Address"];
    NSString *details = [(NSString *)[self.detailDictionary valueForKey:@"Details"] stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];

    self.detials.text = details;
    self.totalCost.text = [self.detailDictionary objectForKey:@"TotalCost"];

}

- (void) viewDidAppear:(BOOL)animated{
    CGSize size = self.containerView.frame.size;
    self.textViewHeightconstraint.constant = size.height;

}


@end
