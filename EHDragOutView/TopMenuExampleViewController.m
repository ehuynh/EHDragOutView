//
//  TopMenuExampleViewController.m
//  EHDragOutView
//
//  Created by Edward Huynh on 25/04/12.
//  Copyright (c) 2012 Edawrd Huynh. All rights reserved.
//

#import "TopMenuExampleViewController.h"
#import "DragOutMenuView.h"
#import "EHDragOutViewTopToBottomStrategy.h"

@interface TopMenuExampleViewController ()

@end

@implementation TopMenuExampleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    CGFloat dragOutMenuViewWidth = self.view.bounds.size.width;
    CGFloat dragOutMenuViewHeight = self.view.bounds.size.height * 0.75;
    CGFloat dragOutMenuPeakAmount = dragOutMenuViewHeight * 0.1;
    CGFloat dragOutMenuVisibleAmount = dragOutMenuViewHeight * 0.7;
    
    DragOutMenuView *dragOutMenuView = [[DragOutMenuView alloc] initWithFrame:CGRectMake(0, dragOutMenuPeakAmount - dragOutMenuViewHeight, dragOutMenuViewWidth, dragOutMenuViewHeight)];
    dragOutMenuView.peakAmount = dragOutMenuPeakAmount;
    dragOutMenuView.visibleAmount = dragOutMenuVisibleAmount;
    dragOutMenuView.maxExtendedAmount = dragOutMenuViewWidth;
    dragOutMenuView.dragOutViewStrategy = [[EHDragOutViewTopToBottomStrategy alloc] init];
    dragOutMenuView.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;

    [self.view addSubview:dragOutMenuView];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
