//
//  MyView.m
//  Sample
//
//  Created by TJT on 7/12/16.
//  Copyright © 2016 TJT. All rights reserved.
//

#import "MyView.h"

@interface MyView ()

@property (weak, nonatomic) IBOutlet UIButton *button;

@end

@implementation MyView

+ (instancetype)myViewWithFrame:(CGRect)frame {
    MyView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:self options:nil] firstObject];
    view.frame = frame;
    view.layer.borderWidth = 1;
    [view configureButton];
    return view;
}

- (void)configureButton {
    [self.button addTarget:self action:@selector(testClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)testClick {
    NSLog(@"button clicked");
    if (self.click) {
        self.click(ButtonActionPositive);
    }
}

@end
