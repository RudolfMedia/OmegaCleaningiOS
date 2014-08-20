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
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *checkMArk;

@end

@implementation AccountMain


- (void)viewDidLoad
{

    [super viewDidLoad];
    [self.activityIndicator setHidden:YES];


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

- (IBAction)onLoginPressed:(id)sender{

    [self onHideKeyboard];

    [self.activityIndicator startAnimating];
    [self.loginButton setHidden:YES];
    [self.activityIndicator setHidden:NO];

    [PFUser logInWithUsernameInBackground:self.emailTextField.text
                             password:self.passwordTextField.text
                                block:^(PFUser *user, NSError *error) {

                                    if (user) {

                                        [self.activityIndicator stopAnimating];
                                        [self.loginButton setHidden:NO];
                                        [self.activityIndicator setHidden:YES];
                                        PFInstallation *installation = [PFInstallation currentInstallation];
                                        installation[@"user"] = [PFUser currentUser];
                                        installation[@"username"] = [PFUser currentUser].username;
                                        [installation saveInBackground];

                                        [self performSegueWithIdentifier:@"ShowList" sender:self];
                                        
                                    }
                                    else{
                                        NSString *errorMessage = [NSString stringWithFormat:@"Error: %@", [error userInfo][@"error"]];

                                        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Oops! \xF0\x9F\x99\x88"
                                                                                        message:errorMessage
                                                                                       delegate:self cancelButtonTitle:@"OK"
                                                                              otherButtonTitles:nil];
                                        [self.activityIndicator stopAnimating];
                                        [self.activityIndicator setHidden:YES];
                                        [self.loginButton setHidden:NO];


                                        [alert show];
                                    }

                                }];

}


- (void)onHideKeyboard{

    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];

}




@end
