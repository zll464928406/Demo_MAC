//
//  AppDelegate.m
//  Moxtra_Native
//
//  Created by sunny on 2017/6/16.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "AppDelegate.h"
#import "MXLoginWindowController.h"

@interface AppDelegate ()

@property(nonatomic, strong) MXLoginWindowController *loginWindowController;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.loginWindowController = [[MXLoginWindowController alloc] init];
    [self.loginWindowController showWindow:nil];
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
