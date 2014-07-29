//
//  RequestQuoteVC.m
//  OmegaCleaning
//
//  Created by Dan Rudolf on 7/29/14.
//  Copyright (c) 2014 com.rudolfmedia. All rights reserved.
//

#import "RequestQuoteVC.h"

@interface RequestQuoteVC ()
@property (weak, nonatomic) IBOutlet UITextField *requestQuoteNameField;
@property (weak, nonatomic) IBOutlet UITextField *requestQuoteAddressField;
@property (weak, nonatomic) IBOutlet UITextField *requestQuotePhoneField;
@property (weak, nonatomic) IBOutlet UIButton *requestQuoteButton;

@end

@implementation RequestQuoteVC


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.requestQuoteButton.layer.cornerRadius = 5;
    self.requestQuoteButton.layer.masksToBounds = YES;

    UITapGestureRecognizer *screenTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(onHideKeyboard)];

    [self.view addGestureRecognizer:screenTap];
}

- (void)onHideKeyboard{

    [self.requestQuoteNameField resignFirstResponder];
    [self.requestQuoteAddressField resignFirstResponder];
    [self.requestQuotePhoneField resignFirstResponder];
}



@end
