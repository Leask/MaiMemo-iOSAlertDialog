//
//  OverlayView.m
//  momo_ios
//
//  Created by leon on 6/16/16.
//  Copyright © 2016 MaiMemo Inc. All rights reserved.
//

#import "OverlayView.h"

@interface OverlayView ()

@end

@implementation OverlayView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {

    UIView *hitView = [super hitTest:point withEvent:event];
    if (hitView == self) {
        if (self.tapBlock) {
            self.tapBlock(point);
        }
    }
    return nil;
}

- (void)tapped:(UIGestureRecognizer *)tap {
    if (self.tapBlock) {
        self.tapBlock([tap locationInView:tap.view]);
    }
}

@end
