//
//  RightMenuExampleViewController.m
//  EHDragOutView
//
//  Created by Edward Huynh on 25/04/12.
//  Copyright (c) 2012 Edawrd Huynh. All rights reserved.
//

#import "RightMenuExampleViewController.h"
#import "DragOutMenuView.h"
#import "EHDragOutViewRightToLeftStrategy.h"

@interface RightMenuExampleViewController ()

@end

@implementation RightMenuExampleViewController

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
    
    DragOutMenuView *dragOutMenuView = [[DragOutMenuView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width - dragOutMenuPeakAmount, 0, dragOutMenuViewWidth, dragOutMenuViewHeight)];
    dragOutMenuView.peakAmount = dragOutMenuPeakAmount;
    dragOutMenuView.visibleAmount = dragOutMenuVisibleAmount;
    dragOutMenuView.maxExtendedAmount = dragOutMenuViewWidth;
    dragOutMenuView.dragOutViewStrategy = [[EHDragOutViewRightToLeftStrategy alloc] init];
    dragOutMenuView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;

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
