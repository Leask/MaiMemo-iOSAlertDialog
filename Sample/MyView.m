//
//  MyView.m
//  Sample
//
//  Created by TJT on 7/12/16.
//  Copyright © 2016 TJT. All rights reserved.
//

#import "MyView.h"
#define BACKGROUND_DIM 0.3f

typedef void (^Callback)(MyView * __autoreleasing);

@interface MyView ()

@property (weak, nonatomic) IBOutlet UILabel            *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton           *negativeButton;
@property (weak, nonatomic) IBOutlet UIButton           *neturalButton;
@property (weak, nonatomic) IBOutlet UIButton           *positiveButton;
@property (weak, nonatomic) IBOutlet UIView             *contentContainer;
@property (weak, nonatomic) IBOutlet UITextView         *contentTextView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleTopSpacing;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *contentTextBottomSpacing;

@end

@implementation MyView

@synthesize positiveText = _positiveText;
@synthesize negativeText = _negativeText;
@synthesize neturalText = _neturalText;
@synthesize onDismiss = _onDismiss;
@synthesize onCancel = _onCancel;
@synthesize positiveBlock = _positiveBlock;
@synthesize negativeBlock = _negativeBlock;
@synthesize neturalBlock = _neturalBlock;

UIView *parent;
UIView *maskView;
BOOL added = NO;

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
    NSLog(@"inited");
    if (self = [super init]) {
        maskView = [[UIView alloc] initWithFrame: CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
        maskView.backgroundColor = [UIColor colorWithRed:0.f green:0.f blue:0.f alpha: 0.4f];
        
        self = [[[NSBundle mainBundle] loadNibNamed:@"MyView" owner:self options:nil] firstObject];
        self.layer.cornerRadius = 2.0f;
        self.autoresizesSubviews = YES;
        [maskView addSubview:self];
        UIButton *transparentButton = [[UIButton alloc] initWithFrame:maskView.frame];
        transparentButton.backgroundColor = [UIColor clearColor];
        [maskView insertSubview:transparentButton atIndex:0];
        [transparentButton addTarget:self action:@selector(outsideClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_positiveButton addTarget:self action:@selector(positiveClick:) forControlEvents:UIControlEventTouchUpInside];
        [_negativeButton addTarget:self action:@selector(negativeClick:) forControlEvents:UIControlEventTouchUpInside];
        [_neturalButton addTarget:self action:@selector(neturalClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

- (CGFloat) measureWidth {
    return [[UIScreen mainScreen] bounds].size.width * 0.9;
}

- (CGFloat) measureHeight {
    [_titleLabel sizeToFit];
    CGFloat width = [self measureWidth] - 24 * 2;
    CGFloat originHeight = _contentTextView.frame.size.height;
    _contentTextView.frame = CGRectMake(24, 65, width, 100);
    CGFloat containerHeight =_contentTextView.contentSize.height + _contentTextBottomSpacing.constant * 4;
    NSLog(@"%f, %f", _contentTextBottomSpacing.constant, _contentTextView.contentSize.height);
    return MIN([[UIScreen mainScreen] bounds].size.height * 0.85, self.frame.size.height + containerHeight - originHeight);
}

- (void) show {
    maskView.hidden = NO;
    if (!added) {
        [[MyView frontMostWindow] addSubview:maskView];
    }
    self.frame = CGRectMake(0, 0, [self measureWidth], [self measureHeight]);
    self.center = maskView.center;
    maskView.alpha = 0.f;
    [UIView animateWithDuration:0.2 animations:^() {
        maskView.alpha = 1;
    }];
}

- (void) hide {
    [self hideWithAnimate:nil];
}

- (void) hideWithAnimate:(void (^ __nullable) (BOOL finished)) callback  {
    [UIView animateWithDuration:0.3 animations:^() {
        maskView.alpha = 0;
    }completion: callback];
}

- (void) dismiss {
    [self hideWithAnimate:^(BOOL finished) {
        [maskView removeFromSuperview];
        if (_onDismiss != nil) {
            _onDismiss(self);
        }
    }];
}

- (void) setTitleText:(NSString *)titleText {
    _titleLabel.text = titleText;
}

- (void) setContentText:(NSString *)contentText {
    _contentTextView.text = contentText;
}

- (void) setPositiveText:(NSString *)positiveText {
    [_positiveButton setTitle:positiveText forState:UIControlStateNormal];
}

- (void) setNegativeText:(NSString *)negativeText {
    [_negativeButton setTitle:negativeText forState:UIControlStateNormal];
    _negativeButton.hidden = NO;
}

- (void) setNeturalText:(NSString *)neturalText {
    [_neturalButton setTitle:neturalText forState:UIControlStateNormal];
    _neturalButton.hidden = NO;
}

- (IBAction)positiveClick:(id)sender {
    if (_positiveBlock != nil) {
        _positiveBlock(self);
    }
    [self dismiss];
}

- (IBAction)neturalClick:(id)sender {
    if (_neturalBlock != nil) {
        _neturalBlock(self);
    }
    [self dismiss];
}

- (IBAction)negativeClick:(id)sender {
    if (_negativeBlock != nil) {
        _negativeBlock(self);
    }
    [self dismiss];
}

- (IBAction)outsideClick:(id)sender {
    if (_onCancel != nil) {
        _onCancel(self);
    }
    [self dismiss];
}

- (void) dealloc {
    NSLog(@"dealloced, %@", self);
}

@end
