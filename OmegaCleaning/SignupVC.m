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
@property (weak, nonatomic) IBOutlet UITextField *phoneSignupTextField;
@property (weak, nonatomic) IBOutlet UITextField *companySignupTextField;


@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (weak, nonatomic) IBOutlet UIImageView *checkImageView;

@property NSString *errorString;
@property UIAlertView *alert;

@end

@implementation SignupVC

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.activityIndicator setHidden:YES];
    [self.checkImageView setHidden:YES];

    self.createAccountbutton.layer.cornerRadius = 5;
    self.createAccountbutton.layer.masksToBounds = YES;

    UITapGestureRecognizer *screenTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(onHideKeyboard)];

    [self.view addGestureRecognizer:screenTap];
    self.errorString = [NSString new];
}

- (IBAction)onDismissSignup:(id)sender {

    [self dismissViewControllerAnimated:YES completion:^{

    //dismiss callback

    }];
}



- (IBAction)onSignupPressed:(id)sender {

    [self onHideKeyboard];

    if (self.nameSignupTextfield.text.length == 0) {

        self.errorString = @"Please enter a Username";
        self.alert = [[UIAlertView alloc] initWithTitle:@"Oops! \xF0\x9F\x99\x88"
                                                message:self.errorString
                                               delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
        [self.alert show];
    }
    else if (self.emailSignupTextFeld.text.length < 4){

        self.errorString = @"Please enter a valid Email Address";
        self.alert = [[UIAlertView alloc] initWithTitle:@"Oops! \xF0\x9F\x99\x88"
                                                message:self.errorString
                                               delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
        [self.alert show];
    }

    else if (![self.passwordSignupTextField.text isEqualToString:self.confirmPassSignupTextField.text]){

        self.errorString = @"Your passwords do not match";
        self.alert = [[UIAlertView alloc] initWithTitle:@"Oops! \xF0\x9F\x99\x88"
                                                message:self.errorString
                                               delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
        [self.alert show];
    }

    else if (self.passwordSignupTextField.text.length < 3){

        self.errorString = @"Passwords must be atleast 4 characters long";
        self.alert = [[UIAlertView alloc] initWithTitle:@"Oops! \xF0\x9F\x99\x88"
                                                message:self.errorString
                                               delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
        [self.alert show];
    }

    else if (self.companySignupTextField.text.length < 3){

        self.errorString = @"Please Enter a Company Name";
        self.alert = [[UIAlertView alloc] initWithTitle:@"Oops! \xF0\x9F\x99\x88"
                                                message:self.errorString
                                               delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
        [self.alert show];
    }
    else if (self.phoneSignupTextField.text.length < 9){

        self.errorString = @"Please Enter a Company Name";
        self.alert = [[UIAlertView alloc] initWithTitle:@"Oops! \xF0\x9F\x99\x88"
                                                message:self.errorString
                                               delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
        [self.alert show];
    }


    else{

        [self createNewUser];

    }


}

- (void)createNewUser{

    [self.createAccountbutton setHidden:YES];
    [self.activityIndicator setHidden:NO];
    [self.activityIndicator startAnimating];

    PFUser *newUser = [PFUser user];
    newUser.username = self.emailSignupTextFeld.text.lowercaseString;
    newUser[@"name"] = self.nameSignupTextfield.text.lowercaseString;
    newUser.email = self.emailSignupTextFeld.text.lowercaseString;
    newUser.password = self.passwordSignupTextField.text;

    [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {

        if (!error) {

            [self.checkImageView setHidden:NO];
            [self.activityIndicator setHidden:YES];

            [self performSelector:@selector(dismissSignup) withObject:nil afterDelay:0.5];
        }

        else{

            NSString *errorMessage = [NSString stringWithFormat:@"%@", [error userInfo][@"error"]];

            self.errorString = @"Something went wrong, Please try again";
            self.alert = [[UIAlertView alloc] initWithTitle:@"Oops! \xF0\x9F\x99\x88"
                                                    message:errorMessage
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
            [self.alert show];


        }
    }];
}


- (void)dismissSignup{
    [self dismissViewControllerAnimated:YES completion:^{
    //dismiss callback
    }];
}


- (void)onHideKeyboard{
    [self.nameSignupTextfield resignFirstResponder];
    [self.emailSignupTextFeld resignFirstResponder];
    [self.passwordSignupTextField resignFirstResponder];
    [self.confirmPassSignupTextField resignFirstResponder];
    [self.phoneSignupTextField resignFirstResponder];
    [self.companySignupTextField resignFirstResponder];

}


@end
