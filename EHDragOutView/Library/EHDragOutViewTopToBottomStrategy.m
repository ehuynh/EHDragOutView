//
//  EHDragOutViewTopToBottomStrategy.m
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

#import "EHDragOutViewTopToBottomStrategy.h"

@implementation EHDragOutViewTopToBottomStrategy

- (CGPoint)pointForDragginView:(EHDragOutView *)dragginView afterTranslation:(CGPoint)translation
{
    CGPoint point = dragginView.center;
    point.y += translation.y;
    return point;
}

- (BOOL)isShowingPeakAmountForDraggingView:(EHDragOutView *)draggingView atPoint:(CGPoint)point inView:(UIView *)view
{
    return point.y + draggingView.bounds.size.height * 0.5 > draggingView.peakAmount;
}
- (BOOL)isMaxExtendedAmountReachedForDraggingView:(EHDragOutView *)draggingView atPoint:(CGPoint)point inView:(UIView *)view
{
    return point.y*2 > draggingView.maxExtendedAmount;
}

- (BOOL)isEntireViewShownForDraggingView:(EHDragOutView *)draggingView atPoint:(CGPoint)point inView:(UIView *)view
{
    return point.y - draggingView.bounds.size.height * 0.5 > 0;
}

- (BOOL)isShowingMoreThanVisibleAmountForDraggingView:(EHDragOutView *)draggingView atPoint:(CGPoint)point inView:(UIView *)view
{
    return draggingView.center.y > draggingView.visibleAmount * 0.5;
}

- (BOOL)shouldShowDraggingView:(EHDragOutView *)draggingView basedOnVelocity:(CGPoint)velocity
{
    return velocity.y > 100;
}

- (CGPoint)pointForClosedDraggingView:(EHDragOutView *)draggingView inView:(UIView *)view
{
    CGPoint point = draggingView.center;
    point.y = 25 - draggingView.bounds.size.height * 0.5;
    return point;
}

- (CGPoint)pointForOpenedDraggingView:(EHDragOutView *)draggingView inView:(UIView *)view
{
    CGPoint point = draggingView.center;
    point.y = draggingView.visibleAmount - draggingView.bounds.size.height * 0.5;    
    return point;
}

@end
