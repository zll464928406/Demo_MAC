//
//  MXTableCell.h
//  Moxtra_Native
//
//  Created by 张令林 on 2017/6/16.
//  Copyright © 2017年 sunny. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MXTableCell : NSTableCellView

@property (nonatomic, strong) NSString *stringValue;

- (void)updateContents;

@end
