//
//  AppDelegate.m
//  OmegaCleaning
//
//  Created by Dan Rudolf on 7/27/14.
//  Copyright (c) 2014 com.rudolfmedia. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [[UINavigationBar appearanceWhenContainedIn:[UITabBarController class], nil] setBarTintColor:[UIColor colorWithRed:0.0 green:0.5568 blue:0.7490 alpha:1.0]];
    [[UINavigationBar appearanceWhenContainedIn:[UITabBarController class], nil] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearanceWhenContainedIn:[UITabBarController class], nil]setBackgroundImage:[UIImage imageNamed:@"navbar"] forBarMetrics:UIBarMetricsDefault];
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:0.0 green:0.5568 blue:0.7490 alpha:1.0]];

    [Parse setApplicationId:@"d7ERHwPLPOpiKL04t4XsJ79hD1exMPJJwoQKMLFi"
                  clientKey:@"40tP4wf2lD24BLHJSn1RQM2noweA8eN3Kx1vxLEy"];


    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
