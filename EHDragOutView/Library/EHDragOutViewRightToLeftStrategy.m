//
//  EHDragOutViewRightToLeftStrategy.m
//  EHDragOutView
//
//  Created by Edward Huynh on 25/04/12.
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

#import "EHDragOutViewRightToLeftStrategy.h"

@implementation EHDragOutViewRightToLeftStrategy

- (CGPoint)pointForDragginView:(EHDragOutView *)dragginView afterTranslation:(CGPoint)translation
{
    CGPoint point = dragginView.center;
    point.x += translation.x;
    return point;
}

- (BOOL)isShowingPeakAmountForDraggingView:(EHDragOutView *)draggingView atPoint:(CGPoint)point inView:(UIView *)view
{
    return point.x - draggingView.bounds.size.width * 0.5 + draggingView.peakAmount < view.bounds.size.width;
}
- (BOOL)isMaxExtendedAmountReachedForDraggingView:(EHDragOutView *)draggingView atPoint:(CGPoint)point inView:(UIView *)view
{
    return point.x - draggingView.bounds.size.width * 0.5 + draggingView.maxExtendedAmount < view.bounds.size.width;
}

- (BOOL)isEntireViewShownForDraggingView:(EHDragOutView *)draggingView atPoint:(CGPoint)point inView:(UIView *)view
{
    return point.x + draggingView.bounds.size.width * 0.5 < view.bounds.size.width;
}

- (BOOL)isShowingMoreThanVisibleAmountForDraggingView:(EHDragOutView *)draggingView atPoint:(CGPoint)point inView:(UIView *)view
{
    return draggingView.center.x - draggingView.bounds.size.width * 0.5 + draggingView.visibleAmount < view.bounds.size.width;
}

- (BOOL)shouldShowDraggingView:(EHDragOutView *)draggingView basedOnVelocity:(CGPoint)velocity
{
    return velocity.x < 100;
}

- (CGPoint)pointForClosedDraggingView:(EHDragOutView *)draggingView inView:(UIView *)view
{
    CGPoint point = draggingView.center;
    point.x = view.bounds.size.width - draggingView.peakAmount + draggingView.bounds.size.width * 0.5;
    return point;
}

- (CGPoint)pointForOpenedDraggingView:(EHDragOutView *)draggingView inView:(UIView *)view
{
    CGPoint point = draggingView.center;
    point.x = view.bounds.size.width - draggingView.visibleAmount + draggingView.bounds.size.width * 0.5;
    
    return point;
}

@end
