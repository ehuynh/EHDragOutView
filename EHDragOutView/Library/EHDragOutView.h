//
//  EHDragOutView.h
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

#import <UIKit/UIKit.h>

@protocol EHDragOutViewStrategyProtocol;

@interface EHDragOutView : UIView

@property (nonatomic) CGFloat peakAmount;
@property (nonatomic) CGFloat maxExtendedAmount;
@property (nonatomic) CGFloat visibleAmount;
@property (nonatomic, strong) id<EHDragOutViewStrategyProtocol> dragOutViewStrategy;

@end

@protocol EHDragOutViewStrategyProtocol <NSObject>

@required

- (CGPoint)pointForDragginView:(EHDragOutView *)dragginView afterTranslation:(CGPoint)translation;
- (BOOL)isShowingPeakAmountForDraggingView:(EHDragOutView *)draggingView atPoint:(CGPoint)point inView:(UIView *)view;
- (BOOL)isMaxExtendedAmountReachedForDraggingView:(EHDragOutView *)draggingView atPoint:(CGPoint)point inView:(UIView *)view;
- (BOOL)isEntireViewShownForDraggingView:(EHDragOutView *)draggingView atPoint:(CGPoint)point inView:(UIView *)view;
- (BOOL)isShowingMoreThanVisibleAmountForDraggingView:(EHDragOutView *)draggingView atPoint:(CGPoint)point inView:(UIView *)view;
- (BOOL)shouldShowDraggingView:(EHDragOutView *)draggingView basedOnVelocity:(CGPoint)velocity;
- (CGPoint)pointForClosedDraggingView:(EHDragOutView *)draggingView inView:(UIView *)view;
- (CGPoint)pointForOpenedDraggingView:(EHDragOutView *)draggingView inView:(UIView *)view;
@end
