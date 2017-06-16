//
//  MXMainWindowController.m
//  Moxtra_Native
//
//  Created by sunny on 2017/6/16.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXMainWindowController.h"
#import "MXTableView.h"
#import "Masonry.h"

@interface MXMainWindowController ()

@property (nonatomic, strong) MXTableView *tableView;

@end

@implementation MXMainWindowController

-(NSString *)windowNibName
{
    return @"MXMainWindowController";
}

- (void)windowDidLoad
{
    [super windowDidLoad];
    self.window.title = NSLocalizedString(@"Main", nil);
    
    self.tableView = [[MXTableView alloc] init];
    [self.window.contentView addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.window.contentView);
    }];
    self.tableView.dataArray = [NSMutableArray arrayWithArray:@[@"ZFHDUWR2EYZN846XPZEJ",@"GVYC6E4E5CBEPDKA111A",@"H16WCF4ZCC5VAU38111A",@"GX3SBN7XS1M4551E111A",@"ZPJJJBCT157F9UVB111A",@"E1YAAD5WRTVC8N6GUHM1",@"ZFHDUWR2EYZN846XPZEJ",@"GVYC6E4E5CBEPDKA111A",@"H16WCF4ZCC5VAU38111A",@"GX3SBN7XS1M4551E111A",@"ZPJJJBCT157F9UVB111A",@"E1YAAD5WRTVC8N6GUHM1"]];
    [self.tableView reload];
}

@end
