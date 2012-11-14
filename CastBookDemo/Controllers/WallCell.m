//
//  WallCell.m
//  CastBookDemo
//
//  Created by Sergey Popenko on 11/13/12.
//  Copyright (c) 2012 softserve. All rights reserved.
//

#import "WallCell.h"

@implementation WallCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (event.type == UITouchPhaseBegan && [[event touchesForView:_palaroidView] count] == 1) {
        NSLog(@"Display video");
    }
}

- (void)dealloc {
    [_palaroidView release];
    [super dealloc];
}
@end
