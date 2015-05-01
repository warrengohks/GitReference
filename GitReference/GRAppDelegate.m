//
//  GRAppDelegate.m
//  GitReference
//
//  Created by Joshua Howland on 5/12/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "GRAppDelegate.h"
#import "GRViewController.h"

@implementation GRAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //Creating View Controller
    GRViewController *viewController = [GRViewController new];
    
    UINavigationController *navigationController = [[UINavigationController alloc]initWithRootViewController:viewController];
    
    self.window.rootViewController = navigationController;
    
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
