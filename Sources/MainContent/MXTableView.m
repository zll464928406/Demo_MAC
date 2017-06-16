//
//  MXTableView.m
//  Moxtra_Native
//
//  Created by 张令林 on 2017/6/16.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXTableView.h"
#import "MXTableCell.h"
#import "Masonry.h"

@interface MXTableView ()<NSTableViewDataSource,NSTableViewDelegate>

@property (nonatomic, strong) NSScrollView *scrollView;
@property (nonatomic, strong) NSTableView *tableView;

@end

@implementation MXTableView

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
}

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setUpUI];
    }
    return self;
}

#pragma mark - Public Methods
- (void)reload
{
    [self.tableView reloadData];
}

#pragma mark - Private Methods
- (void)setUpUI
{
    self.tableView  = [[NSTableView alloc] init];
    [self.tableView setAutosaveName:@"downloadTableView"];
    [self.tableView setAutoresizesSubviews:YES];
    //[_myTableView setBackgroundColor:[NSColor whiteColor]];
    //[_myTableView setGridColor:[NSColor clearColor]];
    [self.tableView setGridStyleMask: NSTableViewSolidHorizontalGridLineMask];
    [self.tableView setAutosaveTableColumns:YES];
    //[_downloadTable setAllowsEmptySelection:NO];
    [self.tableView setAllowsColumnSelection:NO];
    [self.tableView setAllowsColumnResizing:NO];
    [self.tableView setAllowsColumnReordering:NO];
    [self.tableView setSelectionHighlightStyle:1];
    [self.tableView setRowSizeStyle:NSTableViewRowSizeStyleMedium];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.scrollView = [[NSScrollView alloc] init];
    [self.scrollView setAutoresizesSubviews:YES];
    self.scrollView.hasVerticalScroller = YES;
    [self.scrollView setDocumentView:self.tableView];
    [self addSubview:self.scrollView];
    
    //#define keyColumnPrefix @"YouColumn"
    //[self addColumn:keyColumnPrefix"1" withTitle:@"column1"];
    //[self addColumn:keyColumnPrefix"2" withTitle:@"lan search"];
    
    NSTableColumn *column=[[NSTableColumn alloc] initWithIdentifier:@"lanSearchColumn"];
    
    [[column headerCell] setStringValue:@"Lan search"];
    [[column headerCell] setAlignment:NSTextAlignmentCenter];
    [column setWidth:self.frame.size.width];  //必须固定值
    
    [column setMinWidth:self.frame.size.width];
    [column setEditable:NO];
    [column setResizingMask:NSTableColumnAutoresizingMask | NSTableColumnUserResizingMask];
    [self.tableView addTableColumn:column];
    
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (void)addColumn:(NSString*)newid withTitle:(NSString*)title
{
    NSInteger columnNum = [newid intValue];
    NSTableColumn *column=[[NSTableColumn alloc] initWithIdentifier:newid];
    [[column headerCell] setStringValue:title];
    [[column headerCell] setAlignment:NSTextAlignmentCenter];
    [[column headerCell] setBackgroundColor:[NSColor clearColor]];
    
    if(columnNum == 1)
    {
        [column setWidth:self.frame.size.width];  //必须固定值
    }
    //    }else if(columnNum == 2) {
    //        [column setWidth:150];
    //    }else if(columnNum == 3) {
    //        [column setWidth:130];
    //    }
    [column setMinWidth:self.frame.size.width];
    [column setEditable:NO];
    [column setResizingMask:NSTableColumnAutoresizingMask | NSTableColumnUserResizingMask];
    [self.tableView addTableColumn:column]; 
}

#pragma mark - NSTableViewDataSource
- (NSInteger)numberOfRowsInTableView:(NSTableView *)aTableView
{
    return self.dataArray.count;
}

#pragma mark - NSTableViewDelegate
- (CGFloat)tableView:(NSTableView *)tableView heightOfRow:(NSInteger)row
{
    return 75;
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    //NSLog(@"clomun : %d,row : %ld",[[tableColumn identifier] intValue],row);
    //NSTableCellView * cell = [tableView makeViewWithIdentifier:[tableColumn identifier] owner:self];
    MXTableCell *cell = [tableView makeViewWithIdentifier:[tableColumn identifier] owner:self];
    cell.layer.backgroundColor = [[NSColor brownColor] CGColor];
    
    //lanSearchColumn
    if([[tableColumn identifier] isEqualToString:@"lanSearchColumn"])
    {
        if (!cell)
        {
            cell = [[MXTableCell alloc]initWithFrame:NSMakeRect(0, 0, self.tableView.frame.size.width, 75)];
            cell.stringValue = self.dataArray[row];
            [cell updateContents];
        }
    }
    return cell;
}

- (BOOL)tableView:(NSTableView *)tableView shouldSelectRow:(NSInteger)row
{
    NSLog(@"I'm allow you to select:%ld",row);
    return YES;
}

@end
