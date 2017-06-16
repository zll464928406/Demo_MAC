//
//  MXLoginWindowController.m
//  Moxtra_Native
//
//  Created by sunny on 2017/6/16.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXLoginWindowController.h"
#import "MXMainWindowController.h"

@interface MXLoginWindowController ()

@property (nonatomic, strong) MXMainWindowController *mainWindowController;

@end

@implementation MXLoginWindowController

-(NSString *)windowNibName
{
    return @"MXLoginWindowController";
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    self.window.title = NSLocalizedString(@"Login", nil);
    
    self.mainWindowController = [[MXMainWindowController alloc] init];
}

-(void)dealloc
{
    self.mainWindowController = nil;
}

#pragma mark - User Action
- (IBAction)loginButtonClicked:(id)sender
{
    [self.window close];
    [self.mainWindowController showWindow:nil];
}

@end
