//
//  MyView.m
//  Sample
//
//  Created by TJT on 7/12/16.
//  Copyright © 2016 TJT. All rights reserved.
//

#import "MyView.h"
#import "OverlayView.h"

@interface MyView ()

@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTopSpacing;

@end

@implementation MyView

+ (instancetype)myView {
    MyView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:self options:nil] firstObject];
    view.frame = [UIScreen mainScreen].bounds;
    view.clipsToBounds = YES;
    [view configureOverlay];
    [view configureContentView];

    return view;
}

- (void)configureOverlay {
    OverlayView *overlay = [[OverlayView alloc] initWithFrame:self.bounds];
    overlay.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.35];
    overlay.tapBlock = ^(CGPoint point) {
        if (self.dismissBlock) {
            self.dismissBlock(point);
        }
        [self dismiss];
    };
    [self addSubview:overlay];
    [self sendSubviewToBack:overlay];
}

- (void)configureButton {
    self.button.layer.cornerRadius = 4;
    [self.button addTarget:self action:@selector(testClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)configureContentView {
    [self configureButton];
    self.contentView.layer.cornerRadius = 4;
    self.contentView.clipsToBounds = YES;
}

- (void)show {
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if (!window) {
        NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication] windows] reverseObjectEnumerator];
        for (UIWindow *w in frontToBackWindows) {
            if (w.windowLevel == UIWindowLevelNormal) {
                window = w;
                break;
            }
        }
    }
    [window addSubview:self];
    self.center = window.center;
    [self fadeIn];
}

- (void)fadeIn {
    self.alpha = 0;
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1;
    }];
}

- (void)dismiss {
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)testClick {
    if (self.click) {
        self.click(ButtonActionPositive);
    }
    [self animateTitle];
}

- (void)animateTitle {
    BOOL removing = NO;
    if (self.titleTopSpacing.constant > 0) {
        self.titleTopSpacing.constant = -self.titleLabel.frame.size.height;
        removing = YES;
    } else {
        self.titleTopSpacing.constant = 21;
    }
    [UIView animateWithDuration:0.5 animations:^{
        [self layoutIfNeeded];
        self.titleLabel.alpha = removing ? 0 : 1;
    }];
}

@end
