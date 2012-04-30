##EHDragOutView

`EHDragOutView` is a UIView that supports dragging to open and close the view by sliding horitzontally or vertically across its superview

## Requirements

* iOS 5
* ARC

## Getting Started

Copy the 10 files in the Library folder
* `EHDragOutView.h`
* `EHDragOutView.m`
* `EHDragOutViewLeftToRightStrategy.h`
* `EHDragOutViewLeftToRightStrategy.m`
* `EHDragOutViewRightToLeftStrategy.h`
* `EHDragOutViewRightToLeftStrategy.m`
* `EHDragOutViewTopToBottomStrategy.h`
* `EHDragOutViewTopToBottomStrategy.m`
* `EHDragOutViewBottomToTopStrategy.h`
* `EHDragOutViewBottomToTopStrategy.m`

##Basic Usage

1.  Subclass `EHDragOutView`.
2.  Set:
    * `peakAmount`: Amount the view "peaks" out in points when closed.
    * `visibleAmount`: Visible amount in points when the view is opened.
    * `maxExtendedAmount`: Amount in points that the view can be dragged out, before it snaps back to the `visibleAmount`.
3. Set the strategy to either:
    * LTR
    * RTL
    * TTB
    * BTT