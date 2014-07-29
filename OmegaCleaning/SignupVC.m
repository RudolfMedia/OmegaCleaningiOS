//
//  SignupVC.m
//  OmegaCleaning
//
//  Created by Dan Rudolf on 7/29/14.
//  Copyright (c) 2014 com.rudolfmedia. All rights reserved.
//

#import "SignupVC.h"

@interface SignupVC ()
@property (weak, nonatomic) IBOutlet UIButton *createAccountbutton;
@property (weak, nonatomic) IBOutlet UITextField *nameSignupTextfield;
@property (weak, nonatomic) IBOutlet UITextField *emailSignupTextFeld;
@property (weak, nonatomic) IBOutlet UITextField *passwordSignupTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassSignupTextField;

@end

@implementation SignupVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.createAccountbutton.layer.cornerRadius = 5;
    self.createAccountbutton.layer.masksToBounds = YES;

    UITapGestureRecognizer *screenTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(onHideKeyboard)];

    [self.view addGestureRecognizer:screenTap];
}

- (IBAction)onDismissSignup:(id)sender {

[self dismissViewControllerAnimated:YES completion:^{

}];
}




- (void)onHideKeyboard{
    [self.nameSignupTextfield resignFirstResponder];
    [self.emailSignupTextFeld resignFirstResponder];
    [self.passwordSignupTextField resignFirstResponder];
    [self.confirmPassSignupTextField resignFirstResponder];
}


@end
