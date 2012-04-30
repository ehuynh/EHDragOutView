//
//  EHDragOutView.m
//  EHDragOutView
//
//  Created by Edward Huynh on 23/04/12.
//  Copyright (c) 2012 Edward Huynh

//  Permission is hereby granted, free of charge, to any person obtaining a copy 
//  of this software and associated documentation files (the "Software"), to deal 
//  in the Software without restriction, including without limitation the rights 
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell 
//  copies of the Software, and to permit persons to whom the Software is 
//  furnished to do so, subject to the following conditions:

//  The above copyright notice and this permission notice shall be included in 
//  all copies or substantial portions of the Software.

//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE 
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN 
//  THE SOFTWARE.
//

#import "EHDragOutView.h"
#import <QuartzCore/QuartzCore.h>

@interface EHDragOutView ()

@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;

@end

@implementation EHDragOutView

@synthesize panGestureRecognizer = _panGestureRecognizer;
@synthesize peakAmount = _peakAmount;
@synthesize maxExtendedAmount = _maxExtendedAmount;
@synthesize visibleAmount = _visibleAmount;
@synthesize dragOutViewStrategy = _dragOutViewStrategy;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleDrag:)];
        [self addGestureRecognizer:self.panGestureRecognizer];
    }
    return self;
}

- (void)handleDrag:(UIPanGestureRecognizer *)recognizer
{
    if (recognizer.state == UIGestureRecognizerStateChanged) 
    {
        CGPoint translation = [recognizer translationInView:self.superview];
        CGPoint newCenter = [self.dragOutViewStrategy pointForDragginView:self afterTranslation:translation];

        BOOL isShowingPeakAmount = [self.dragOutViewStrategy isShowingPeakAmountForDraggingView:self atPoint:newCenter inView:self.superview];
        BOOL isMaxExtendedAmountReached = [self.dragOutViewStrategy isMaxExtendedAmountReachedForDraggingView:self atPoint:newCenter inView:self.superview];
        BOOL isEntireViewShown = [self.dragOutViewStrategy isEntireViewShownForDraggingView:self atPoint:newCenter inView:self.superview];
        
        if (isShowingPeakAmount && !isMaxExtendedAmountReached && !isEntireViewShown) {
            self.center = newCenter;
        }

        [recognizer setTranslation:CGPointZero inView:self.superview];
    } 
    else if (recognizer.state == UIGestureRecognizerStateEnded || recognizer.state == UIGestureRecognizerStateCancelled) 
    {
        CGPoint currentVelocityPoint = [recognizer velocityInView:self.superview];
                
        BOOL isShowingMoreThanVisibleAmount = [self.dragOutViewStrategy isShowingMoreThanVisibleAmountForDraggingView:self atPoint:self.center inView:self.superview];
        BOOL shouldShowDraggingViewBasedOnVelocity = [self.dragOutViewStrategy shouldShowDraggingView:self basedOnVelocity:currentVelocityPoint];
        
        CGPoint finalPoint;
        
        if (shouldShowDraggingViewBasedOnVelocity || isShowingMoreThanVisibleAmount) {
            // open dragging view
            finalPoint = [self.dragOutViewStrategy pointForOpenedDraggingView:self inView:self.superview];
        } 
        else {
            // close dragging view
            finalPoint = [self.dragOutViewStrategy pointForClosedDraggingView:self inView:self.superview];
        }
        
        [self slideToNewCenter:finalPoint];
    }
}

- (void)slideToNewCenter:(CGPoint)newCenter
{
    [UIView animateWithDuration:0.5f animations:^{
        self.center = newCenter;        
    }];
}

@end
