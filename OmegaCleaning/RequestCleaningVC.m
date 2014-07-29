//
//  RequestCleaningVC.m
//  OmegaCleaning
//
//  Created by Dan Rudolf on 7/29/14.
//  Copyright (c) 2014 com.rudolfmedia. All rights reserved.
//

#import "RequestCleaningVC.h"

@interface RequestCleaningVC ()

@property (weak, nonatomic) IBOutlet UIButton *requestCleaningButton;
@property (weak, nonatomic) IBOutlet UITextField *requestCleaningNameField;
@property (weak, nonatomic) IBOutlet UITextField *requesCleaningAddressField;
@property (weak, nonatomic) IBOutlet UITextField *requestCleaningPhoneField;

@end

@implementation RequestCleaningVC


- (void)viewDidLoad
{
    [super viewDidLoad];

    self.requestCleaningButton.layer.cornerRadius = 5;
    self.requestCleaningButton.layer.masksToBounds = YES;
    
    UITapGestureRecognizer *screenTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(onHideKeyboard)];

    [self.view addGestureRecognizer:screenTap];
}

- (void)onHideKeyboard{

    [self.requestCleaningNameField resignFirstResponder];
    [self.requesCleaningAddressField resignFirstResponder];
    [self. requestCleaningPhoneField resignFirstResponder];
}



@end
