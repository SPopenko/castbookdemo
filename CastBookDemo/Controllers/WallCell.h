//
//  WallCell.h
//  CastBookDemo
//
//  Created by Sergey Popenko on 11/13/12.
//  Copyright (c) 2012 softserve. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TSItemPolaroid.h"

@interface WallCell : UITableViewCell
@property (retain, nonatomic) IBOutlet TSItemPolaroid *palaroidView;

@end
