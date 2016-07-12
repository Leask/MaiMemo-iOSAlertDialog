//
//  AlertDialog.m
//  Sample
//
//  Created by TJT on 7/12/16.
//  Copyright © 2016 TJT. All rights reserved.
//

#import "AlertDialog.h"

const CGFloat MARGIN_LEFT = 24.0f;
const CGFloat MARGIN_RIGHT = 24.0f;
const CGFloat MARGIN_TOP = 16.0f;

@interface AlertDialog ()

@property (strong, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UIView *contentContainer;
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;

@property (weak, nonatomic) IBOutlet UIButton *naturalButton;
@property (weak, nonatomic) IBOutlet UIButton *negativeButton;
@property (weak, nonatomic) IBOutlet UIButton *positiveButton;


@end

@implementation AlertDialog

@synthesize dialogTitle;
@synthesize content;
@synthesize positive;
@synthesize positiveCallback;
@synthesize negative;
@synthesize negativeCallback;
@synthesize natural;
@synthesize neturalCallback;

UIView  *dialogView;
UIView  *contentView;
UIView  *customContent;
UIView  *innerView;

- (instancetype) initWithViewCountroller: (UIViewController *) controller {
    contentView = controller.view;
    
    innerView = [[UIView alloc] initWithFrame:contentView.frame];
    innerView.backgroundColor = [UIColor colorWithRed:0.0f green:0.0f blue:0.0f alpha:0.3f];
    
    dialogView = [[[NSBundle mainBundle] loadNibNamed:@"AlertDialog" owner:self options:nil]firstObject];
    dialogView.layer.cornerRadius = 4.0f;
    dialogView.autoresizesSubviews = YES;
    
    [contentView addSubview:innerView];
    return self;
}

- (void) setDialogTitle:(NSAttributedString *)dialogTitle1 {
    _titleView.attributedText = dialogTitle1;
    
}

- (CGFloat) measureWidth {
    return [[UIScreen mainScreen] bounds].size.width * 0.9;
}

- (CGFloat) measureHeight {
    [_titleView sizeToFit];
    [_naturalButton sizeToFit];
    [_positiveButton sizeToFit];
    [_negativeButton sizeToFit];
    
    CGFloat width = [self measureWidth];
    _contentTextView.frame = CGRectMake(_contentContainer.frame.origin.x, _contentContainer.frame.origin.y, width - 48.f, _contentContainer.frame.size.height);
    
    return 16.f + 29.f + 16.f
    + MIN(_contentTextView.contentSize.height, [[UIScreen mainScreen] bounds].size.height * 0.5)
    + 16.f + 36.f + 8.f;
}

- (void) layout {
    CGSize windowSize = contentView.frame.size;
    CGFloat width = [self measureWidth];
    CGFloat height = [self measureHeight];
    dialogView.frame = CGRectMake(windowSize.width / 2 - width / 2, windowSize.height / 2 - height / 2, width, height);
}

- (void) show {
    [innerView addSubview:dialogView];
    [_positiveButton addTarget:self action:@selector(positiveClick:) forControlEvents:UIControlEventTouchUpInside];
    [self layout];
}

- (void) hide {
    innerView.hidden = YES;
}

- (void) dismiss {
    [innerView removeFromSuperview];
}

- (IBAction)positiveClick:(id)sender {
    if (positiveCallback != nil) {
        positiveCallback(self);
    }
    [self dismiss];
}

- (IBAction)negativeClick:(id)sender {
    if (negativeCallback != nil) {
        negativeCallback(self);
    }
    [self dismiss];
}

- (IBAction)naturalClick:(id)sender {
    if (neturalCallback != nil) {
        neturalCallback(self);
    }
    [self dismiss];
}
@end