//
//  MXTableCell.m
//  Moxtra_Native
//
//  Created by 张令林 on 2017/6/16.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import "MXTableCell.h"
#import "Masonry.h"

@interface MXTableCell ()<NSTableViewDataSource,NSTableViewDelegate>

@property (nonatomic, strong) NSTextField *label;

@end

@implementation MXTableCell

- (void)drawRect:(NSRect)dirtyRect
{
    [super drawRect:dirtyRect];
    
}

- (instancetype)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.label = [[NSTextField alloc] init];
        [self.label setFont:[NSFont systemFontOfSize:15.0f]];
        [self.label setBackgroundColor:[NSColor clearColor]];
        [self.label setAlignment:NSTextAlignmentLeft];
        [self.label setAutoresizesSubviews:YES];
        [self.label setEditable:NO];
        [self.label setSelectable:NO];
        [self.label setBezeled:NO];
        [self addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

- (void)updateContents
{
    self.label.stringValue = self.stringValue;
}

@end
