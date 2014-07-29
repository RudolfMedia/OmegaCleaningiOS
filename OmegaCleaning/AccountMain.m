//
//  AccountMain.m
//  OmegaCleaning
//
//  Created by Dan Rudolf on 7/29/14.
//  Copyright (c) 2014 com.rudolfmedia. All rights reserved.
//

#import "AccountMain.h"

@interface AccountMain () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *createAccountButton;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation AccountMain


- (void)viewDidLoad
{

    [super viewDidLoad];

    self.createAccountButton.layer.cornerRadius = 5;
    self.createAccountButton.layer.masksToBounds = YES;

    self.loginButton.layer.cornerRadius = 5;
    self.loginButton.layer.masksToBounds = YES;

    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;

    UITapGestureRecognizer *screenTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(onHideKeyboard)];

    [self.view addGestureRecognizer:screenTap];
}

- (void)onHideKeyboard{

    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}
@end
