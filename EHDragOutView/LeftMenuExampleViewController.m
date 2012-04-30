//
//  LeftMenuExampleViewController.m
//  EHDragOutView
//
//  Created by Edward Huynh on 25/04/12.
//  Copyright (c) 2012 Edward Huynh. All rights reserved.
//

#import "LeftMenuExampleViewController.h"
#import "DragOutMenuView.h"
#import "EHDragOutViewLeftToRightStrategy.h"

@interface LeftMenuExampleViewController ()

@end

@implementation LeftMenuExampleViewController

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
    
    CGFloat dragOutMenuViewWidth = self.view.bounds.size.width * 0.75;
    CGFloat dragOutMenuViewHeight = self.view.bounds.size.height;
    CGFloat dragOutMenuPeakAmount = dragOutMenuViewWidth * 0.1;
    CGFloat dragOutMenuVisibleAmount = dragOutMenuViewWidth * 0.7;
    
    DragOutMenuView *dragOutMenuView = [[DragOutMenuView alloc] initWithFrame:CGRectMake(-dragOutMenuViewWidth + dragOutMenuPeakAmount, 0, dragOutMenuViewWidth, dragOutMenuViewHeight)];
    dragOutMenuView.peakAmount = dragOutMenuPeakAmount;
    dragOutMenuView.visibleAmount = dragOutMenuVisibleAmount;
    dragOutMenuView.maxExtendedAmount = dragOutMenuViewWidth;
    dragOutMenuView.dragOutViewStrategy = [[EHDragOutViewLeftToRightStrategy alloc] init];
    dragOutMenuView.autoresizingMask = UIViewAutoresizingFlexibleRightMargin;

    
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
