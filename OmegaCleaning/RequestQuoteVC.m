//
//  RequestQuoteVC.m
//  OmegaCleaning
//
//  Created by Dan Rudolf on 7/29/14.
//  Copyright (c) 2014 com.rudolfmedia. All rights reserved.
//

#import "RequestQuoteVC.h"

@interface RequestQuoteVC () <MFMailComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *requestQuoteNameField;
@property (weak, nonatomic) IBOutlet UITextField *requestQuoteAddressField;
@property (weak, nonatomic) IBOutlet UITextField *requestQuotePhoneField;
@property (weak, nonatomic) IBOutlet UIButton *requestQuoteButton;

@property UIAlertView *alert;

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

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{

    [controller dismissViewControllerAnimated:YES completion:^{

    }];
}

- (void)onHideKeyboard{

    [self.requestQuoteNameField resignFirstResponder];
    [self.requestQuoteAddressField resignFirstResponder];
    [self.requestQuotePhoneField resignFirstResponder];
}

- (IBAction)onRequestPressed:(id)sender {

    if (self.requestQuoteNameField.text.length == 0) {

        self.alert = [[UIAlertView alloc] initWithTitle:@"Oops! \xF0\x9F\x99\x88"
                                                message:@"Please enter a name"
                                               delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
        [self.alert show];
    }

    else if (self.requestQuoteAddressField.text.length == 0){

        self.alert = [[UIAlertView alloc] initWithTitle:@"Oops! \xF0\x9F\x99\x88"
                                                message:@"Please enter an address"
                                               delegate:self
                                      cancelButtonTitle:@"OK"
                                      otherButtonTitles:nil];
        [self.alert show];

    }

    else if (self.requestQuotePhoneField == 0){

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

    [mailComposer setSubject:@"Quote Request"];
    [mailComposer setToRecipients:@[@"danrudolf@gmail.com"]];
    [mailComposer setMessageBody:[NSString stringWithFormat:@"Hello,\nI would like to request a Quote for a cleaning at %@.\n \nPlease feel free to Contact %@ at %@. \n\n" , self.requestQuoteNameField.text, self.requestQuoteAddressField.text, self.requestQuotePhoneField.text] isHTML:NO];

    [self presentViewController:mailComposer animated:YES
                     completion:^{

                     }];
    }
}


@end
