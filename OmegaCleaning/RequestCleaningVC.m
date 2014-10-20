//
//  RequestCleaningVC.m
//  OmegaCleaning
//
//  Created by Dan Rudolf on 7/29/14.
//  Copyright (c) 2014 com.rudolfmedia. All rights reserved.
//

#import "RequestCleaningVC.h"

@interface RequestCleaningVC () <MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *requestCleaningButton;
@property (weak, nonatomic) IBOutlet UITextField *requestCleaningNameField;
@property (weak, nonatomic) IBOutlet UITextField *requesCleaningAddressField;
@property (weak, nonatomic) IBOutlet UITextField *requestCleaningPhoneField;

@property UIAlertView *alert;

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

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{

    [controller dismissViewControllerAnimated:YES completion:^{

    }];
}

- (IBAction)onRequestCleaning:(id)sender {

    if (self.requestCleaningNameField.text.length ==0) {

        self.alert = [[UIAlertView alloc] initWithTitle:@"Oops! \xF0\x9F\x99\x88"
                                                message:@"Please enter a name"
                                               delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
        [self.alert show];
    }

    else if (self.requesCleaningAddressField.text.length ==0){

        self.alert = [[UIAlertView alloc] initWithTitle:@"Oops! \xF0\x9F\x99\x88"
                                                message:@"Please enter an address"
                                               delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
        [self.alert show];

    }

    else if (self.requestCleaningPhoneField.text.length == 0){

        self.alert = [[UIAlertView alloc] initWithTitle:@"Oops! \xF0\x9F\x99\x88"
                                                message:@"Please enter an contact phone number"
                                               delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
        [self.alert show];
    }

    else{

        MFMailComposeViewController *mailComposer = [[MFMailComposeViewController alloc] init];
        mailComposer.mailComposeDelegate = self;

        [mailComposer setSubject:@"Cleaning Request"];
        [mailComposer setToRecipients:@[@"OmegaServicesOffice@gmail.com"]];
        [mailComposer setMessageBody:[NSString stringWithFormat:@"Hello,\nI would like to request a cleaning at %@.\n \n Please feel free to contact %@ at %@. \n \n Thanks!", self.requesCleaningAddressField.text, self.requestCleaningNameField.text, self.requestCleaningPhoneField.text] isHTML:NO];

        [self presentViewController:mailComposer animated:YES
                         completion:^{
                             
                         }];
    }

}


@end
