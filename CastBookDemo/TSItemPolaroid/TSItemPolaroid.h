//
//  TSItemPolaroid.h
//  Bronto Backup Mobile App
//
//  Created by Tristan Seifert on 4/8/11.
//  Copyright 2011 24/7 Server. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

#define kTypeBookmarkNone 1 << 2
#define kTypeBookmarkRed 1 << 3
#define kTypeBookmarkGreen 1 << 4
#define kTypeBookmarkBlue 1 << 5
#define kTypeBookmarkYellow 1 << 6

#define kEnablePolaroidRotation 1

@protocol TSItemPolaroidDelegate
-(void) saveBookmarks;
@end

@interface TSItemPolaroid : UIView {
    NSString *computerName;
    UILabel *computerNameLabel;
    UIImageView *computerImage;
	UIImageView *bookmarkFlag;
	int bookmarkFlagType;
	id<TSItemPolaroidDelegate> delegate;
}

@property (nonatomic, readwrite, retain, setter = setComputerName:) NSString *computerName;
@property (nonatomic, readwrite, setter = setBookmarkFlagType:) int bookmarkFlagType;
@property (nonatomic, readwrite, retain) id delegate;

- (void) setComputerName:(NSString *) str;
- (void) setComputerImage:(UIImage *) image;
- (void) setBookmarkFlagType:(int) type;
- (void) toggleThroughBookmarkFlags:(id) sender;
- (double)degreesToRadians:(double)degrees;

@end

// Special Thanks to Sam Soffes for their SSLineView.

//
//  SSLineView.h
//  SSToolkit
//
//  Created by Sam Soffes on 4/12/10.
//  Copyright 2010-2011 Sam Soffes. All rights reserved.
//

/**
 @brief Don't under estimate this class. It draws lines, but they are awesome.
 
 The recommended height is 2 points if you are using the inset and 1 if you are not.
 
 The inset is drawn under the line if showInset is set to YES.
 */
@interface SSLineView : UIView {
	
@private
	
	UIColor *_lineColor;
	UIColor *_insetColor;
	BOOL _showInset;
}

/**
 @brief The primary color of the line.
 */
@property (nonatomic, retain) UIColor *lineColor;

/**
 @brief The color of the line inset.
 */
@property (nonatomic, retain) UIColor *insetColor;

/**
 @brief A Boolean value that determines whether showing the inset is enabled.
 */
@property (nonatomic, assign) BOOL showInset;

@end