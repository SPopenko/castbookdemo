//
//  ResumeViewController.m
//  CastBookDemo
//
//  Created by Anton Poluboiarynov on 11/15/12.
//  Copyright (c) 2012 softserve. All rights reserved.
//

#import "ResumeViewController.h"

@interface ResumeViewController ()

@end

@implementation ResumeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *pdfPath = [NSString stringWithFormat:@"%@/resume.pdf",[[NSBundle mainBundle] resourcePath]];
    NSURL *pdfUrl = [NSURL fileURLWithPath:pdfPath];
	[self.webView loadRequest:[NSURLRequest requestWithURL:pdfUrl]];
}

- (void)dealloc {
    [_webView release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setWebView:nil];
    [super viewDidUnload];
}
@end
