//
//  BottomMenuExampleViewController.m
//  EHDragOutView
//
//  Created by Edward Huynh on 29/04/12.
//  Copyright (c) 2012 Edawrd Huynh. All rights reserved.
//

#import "BottomMenuExampleViewController.h"
#import "DragOutMenuView.h"
#import "EHDragOutViewBottomToTopStrategy.h"

@interface BottomMenuExampleViewController ()

@end

@implementation BottomMenuExampleViewController

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
    
    DragOutMenuView *dragOutMenuView = [[DragOutMenuView alloc] initWithFrame:CGRectMake(0, self.view.bounds.size.height - dragOutMenuPeakAmount, dragOutMenuViewWidth, dragOutMenuViewHeight)];
    dragOutMenuView.peakAmount = dragOutMenuPeakAmount;
    dragOutMenuView.visibleAmount = dragOutMenuVisibleAmount;
    dragOutMenuView.maxExtendedAmount = dragOutMenuViewWidth;
    dragOutMenuView.dragOutViewStrategy = [[EHDragOutViewBottomToTopStrategy alloc] init];
    dragOutMenuView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleWidth;
    
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
