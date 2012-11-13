//
//  TSItemPolaroid.m
//  Bronto Backup Mobile App
//
//  Created by Tristan Seifert on 4/8/11.
//  Copyright 2011 24/7 Server. All rights reserved.
//

#import "TSItemPolaroid.h"
#define ARC4RANDOM_MAX      0x100000000

/**
 @brief This is a semi-simple class to draw a sort of polaroid lookalike with configurable parameters.
		It is currently used to represent computers, but I presume it'd be ideal for almost anything.
		Remove the define for kEnablePolaroidRotation in the header file to disable rotation.
 */

@implementation TSItemPolaroid
@synthesize computerName;
@synthesize bookmarkFlagType;
@synthesize delegate;

-(void)commonInit
{
    CGSize size = self.frame.size;
    //size.width -= 10.0;
    CGFloat curlFactor = 15.0f;
    CGFloat shadowDepth = 5.0f;
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.0f, 0.0f)];
    [path addLineToPoint:CGPointMake(size.width, 0.0f)];
    [path addLineToPoint:CGPointMake(size.width, size.height + shadowDepth)];
    [path addCurveToPoint:CGPointMake(0.0f, size.height + shadowDepth)
            controlPoint1:CGPointMake(size.width - curlFactor, size.height + shadowDepth - curlFactor)
            controlPoint2:CGPointMake(curlFactor, size.height + shadowDepth - curlFactor)];
    self.layer.shadowPath = path.CGPath;
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 0.7f;
    self.layer.shadowOffset = CGSizeMake(00.0f, 10.0f);
    self.layer.shadowRadius = 5.0f;
    self.layer.masksToBounds = NO;
	
    [self setOpaque:YES];
    [self setBackgroundColor:[UIColor whiteColor]];
    
    CGRect rectangle;
    rectangle.origin = [self center];
    rectangle.size = CGSizeMake(40, 58);
    rectangle.origin.y = -18;
    rectangle.origin.x -= 25;
    
    SSLineView *insetLine = [[SSLineView alloc] initWithFrame:CGRectMake(0, 216, self.frame.size.width, 2)];
    insetLine.showInset = YES;
    insetLine.lineColor = [UIColor lightGrayColor];
    [self addSubview:insetLine];
	[insetLine release];
    
    computerNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 225, self.frame.size.width, 35)];
    [computerNameLabel setText:computerName];
    [computerNameLabel setFont:[UIFont fontWithName:@"Marker Felt" size:23]];
    [computerNameLabel setTextAlignment:UITextAlignmentCenter];
    [self addSubview:computerNameLabel];
    
    computerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 215)];
    computerImage.image = [UIImage imageNamed:@"com.apple.mac.png"];
    computerImage.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:computerImage];
	
	bookmarkFlag = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.size.width - 42, -3, 38, 52)];
	[bookmarkFlag setImage:[UIImage imageNamed:@"bookmark_blue.png"]];
	bookmarkFlag.clipsToBounds = NO;
	[self addSubview:bookmarkFlag];
	
	UIButton *toggleBookmarkFlagButton = [[UIButton alloc] initWithFrame:bookmarkFlag.frame];
	[toggleBookmarkFlagButton setAlpha:0.1];
	[toggleBookmarkFlagButton addTarget:self action:@selector(toggleThroughBookmarkFlags:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:toggleBookmarkFlagButton];
	[toggleBookmarkFlagButton release];
	
	UIImageView *pushPin = [[UIImageView alloc] initWithFrame:rectangle];
    pushPin.image = [UIImage imageNamed:@"pushpin.png"];
    pushPin.clipsToBounds = NO;
    self.clipsToBounds = NO;
    [self addSubview:pushPin];
	[pushPin release];
	
    size = self.frame.size;
#ifdef kEnablePolaroidRotation
	double randomNumber = (30 * (double)rand() / (double)RAND_MAX - 30) / 10;
	NSLog(@"random: %f", randomNumber);
	self.transform = CGAffineTransformMakeRotation([self degreesToRadians:randomNumber]);
#endif
}

-(id) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self)
    {
        [self commonInit];
    }
    
    return self;
}

- (id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self commonInit];
    }
    
    return self;
}

- (double)degreesToRadians:(double)degrees {
	return degrees / 57.2958;
}

- (void) toggleThroughBookmarkFlags:(id) sender {
	if(bookmarkFlagType == kTypeBookmarkNone) 
		return;
	
	if(bookmarkFlagType == kTypeBookmarkBlue) 
		[self setBookmarkFlagType:kTypeBookmarkGreen];
	else if(bookmarkFlagType == kTypeBookmarkGreen) 
		[self setBookmarkFlagType:kTypeBookmarkRed];
	else if(bookmarkFlagType == kTypeBookmarkRed) 
		[self setBookmarkFlagType:kTypeBookmarkYellow];
	else if(bookmarkFlagType == kTypeBookmarkYellow) 
		[self setBookmarkFlagType:kTypeBookmarkBlue];
}

- (void) setComputerName:(NSString *) str {
    computerName = str;
    [computerNameLabel setText:computerName];
    [self setNeedsDisplayInRect:computerNameLabel.frame];
}

- (void) setComputerImage:(UIImage *) image {
    [computerImage setImage:image];
    [self setNeedsDisplayInRect:computerImage.frame];
}


- (void) setBookmarkFlagType:(int) type {
	bookmarkFlagType = type;
	
	if(type == kTypeBookmarkNone) {
		[UIView beginAnimations:@"presentWithSuperview" context:nil];
		[UIView setAnimationDuration:0.33];
		[bookmarkFlag setAlpha:0.0];
		[self setNeedsDisplayInRect:bookmarkFlag.frame];
		[UIView commitAnimations];
		return;
	} else {
		//[bookmarkFlag setHidden:NO];
		[UIView beginAnimations:@"presentWithSuperview" context:nil];
		[UIView setAnimationDuration:0.33];
		[bookmarkFlag setAlpha:1.0];
		[UIView commitAnimations];
	}
	
	if(type == kTypeBookmarkBlue) 
		[bookmarkFlag setImage:[UIImage imageNamed:@"bookmark_blue.png"]];
	else if(type == kTypeBookmarkGreen) 
		[bookmarkFlag setImage:[UIImage imageNamed:@"bookmark_green.png"]];
	else if(type == kTypeBookmarkRed) 
		[bookmarkFlag setImage:[UIImage imageNamed:@"bookmark_red.png"]];
	else if(type == kTypeBookmarkYellow) 
		[bookmarkFlag setImage:[UIImage imageNamed:@"bookmark_yellow.png"]];
	
	// redraw
	[self setNeedsDisplayInRect:bookmarkFlag.frame];
	[bookmarkFlag setNeedsDisplay];
	
	[delegate saveBookmarks];
}

@end

// Special Thanks to Sam Soffes for their SSLineView.
  
@implementation SSLineView

@synthesize lineColor = _lineColor;
@synthesize insetColor = _insetColor;
@synthesize showInset = _showInset;

#pragma mark NSObject

- (void)dealloc {
	self.lineColor = nil;
	self.insetColor = nil;
	[super dealloc];
}


#pragma mark UIView

- (id)initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		self.backgroundColor = [UIColor clearColor];
		self.opaque = NO;
		self.autoresizingMask = UIViewAutoresizingFlexibleWidth;
		
		self.lineColor = [UIColor grayColor];
		self.insetColor = [UIColor colorWithWhite:1.0f alpha:0.5f];
		
		_showInset = YES;
	}
	return self;
}


- (void)drawRect:(CGRect)rect {	
	CGContextRef context = UIGraphicsGetCurrentContext();
	CGContextClipToRect(context, rect);
	CGContextSetLineWidth(context, 2.0f);
	
	// Inset
	if (self.showInset && self.insetColor) {
		CGContextSetStrokeColorWithColor(context, _insetColor.CGColor);
		CGContextMoveToPoint(context, 0.0f, 1.0f);
		CGContextAddLineToPoint(context, rect.size.width, 1.0f);
		CGContextStrokePath(context);
	}
	
	// Top border
	CGContextSetStrokeColorWithColor(context, _lineColor.CGColor);
	CGContextMoveToPoint(context, 0.0f, 0.0f);
	CGContextAddLineToPoint(context, rect.size.width, 0.0f);
	CGContextStrokePath(context);
}


- (void)willMoveToSuperview:(UIView *)newSuperview {
	if (newSuperview) {
		[self addObserver:self forKeyPath:@"lineColor" options:NSKeyValueObservingOptionNew context:nil];
		[self addObserver:self forKeyPath:@"insetColor" options:NSKeyValueObservingOptionNew context:nil];
		[self addObserver:self forKeyPath:@"showInset" options:NSKeyValueObservingOptionNew context:nil];		
	} else {
		[self removeObserver:self forKeyPath:@"lineColor"];
		[self removeObserver:self forKeyPath:@"insetColor"];
		[self removeObserver:self forKeyPath:@"showInset"];
	}
}


#pragma mark NSKeyValueObserving

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	// Redraw if colors changed
	if ([keyPath isEqualToString:@"lineColor"] || [keyPath isEqualToString:@"insetColor"] || [keyPath isEqualToString:@"showInset"]) {
		[self setNeedsDisplay];
		return;
	}
	
	[super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

@end
