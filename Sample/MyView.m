//
//  MyView.m
//  Sample
//
//  Created by TJT on 7/12/16.
//  Copyright © 2016 TJT. All rights reserved.
//

#import "MyView.h"
#define BACKGROUND_DIM 0.3f

@interface MyView ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *negativeButton;
@property (weak, nonatomic) IBOutlet UIButton *neturalButton;
@property (weak, nonatomic) IBOutlet UIButton *positiveButton;
@property (weak, nonatomic) IBOutlet UIView *contentContainer;
@property (weak, nonatomic) IBOutlet UITextView *contentText;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTopSpacing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentTextBottomSpacing;

@end

@implementation MyView

@synthesize click;

UIView *parent;
UIView *maskView;

+ (UIWindow *)frontMostWindow {
    UIWindow *keyWindow = [[UIApplication sharedApplication] keyWindow];
    if (keyWindow != nil) {
        return keyWindow;
    }
    NSEnumerator *frontToBackWindows = [[[UIApplication sharedApplication] windows] reverseObjectEnumerator];
    for (UIWindow *window in frontToBackWindows) {
        if (window.windowLevel == UIWindowLevelNormal) {
            return window;
        }
    }
    return nil;
}

- (instancetype)init {
    maskView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    maskView.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha: 0.4f];
    
    self = [[[NSBundle mainBundle] loadNibNamed:@"MyView" owner:self options:nil] firstObject];
    self.layer.cornerRadius = 2.0f;
    self.autoresizesSubviews = YES;
    [maskView addSubview:self];
    _titleLabel.text = @"Use Google's location service?";
    return self;
}

- (CGFloat) measureWidth {
    return [[UIScreen mainScreen] bounds].size.width * 0.9;
}

- (CGFloat) measureHeight {
    [_titleLabel sizeToFit];
    CGFloat width = [self measureWidth] - 24 * 2;
    CGFloat originContentHeight = _contentText.frame.size.height;
    _contentText.frame = CGRectMake(24, 65, width, 100);
    CGFloat containerHeight = MIN([[UIScreen mainScreen] bounds].size.height * 0.8f, _contentText.contentSize.height + _contentTextBottomSpacing.constant * 4);
    NSLog(@"%f, %f", _contentTextBottomSpacing.constant, _contentText.contentSize.height);
    return self.frame.size.height + containerHeight - originContentHeight;
}

- (void) show {
//    maskView.alpha = 0.f;
    [[MyView frontMostWindow] addSubview:maskView];
    self.frame = CGRectMake(0, 0, [self measureWidth], [self measureHeight]);
    self.center = maskView.center;
}

- (void) hide {
    
}

- (void) dismiss {
    
}

@end
