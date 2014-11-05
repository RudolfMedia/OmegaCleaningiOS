//
//  FriendRefer.m
//  OmegaCleaning
//
//  Created by Dan Rudolf on 11/4/14.
//  Copyright (c) 2014 com.rudolfmedia. All rights reserved.
//

#import "FriendRefer.h"

@interface FriendRefer () <MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *sendButton;
@property (weak, nonatomic) IBOutlet UITextField *referNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *referContactTextField;

@end

@implementation FriendRefer

- (void)viewDidLoad {

    [super viewDidLoad];

    self.sendButton.layer.cornerRadius = 5;
    self.sendButton.layer.masksToBounds = YES;

    UITapGestureRecognizer *screenTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(onHideKeyboard)];

    [self.view addGestureRecognizer:screenTap];

    
}

- (void)onHideKeyboard{

    [self.referContactTextField resignFirstResponder];
    [self.referNameTextField resignFirstResponder];
}

- (IBAction)onDismissPressed:(id)sender {

    [self dismissViewControllerAnimated:YES completion:^{

    }];

}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{

    [self dismissViewControllerAnimated:YES completion:^{

    }];
}

- (IBAction)onSendPressed:(id)sender {

        MFMailComposeViewController *referFriendVC = [[MFMailComposeViewController alloc] init];
        referFriendVC.mailComposeDelegate = self;

        [referFriendVC setToRecipients:@[@"omegaservicesoffice@gmail.com"]];
        [referFriendVC setSubject:@"Client Referral"];
        [referFriendVC setMessageBody:[NSString stringWithFormat:@"Hello, /n We Would like to refer a client for service. %@ can be reached at %@ /n /n Thanks!", self.referNameTextField.text, self.referContactTextField.text] isHTML:NO];
    
        [self presentViewController:referFriendVC animated:YES completion:^{

        }];
    
}


@end
