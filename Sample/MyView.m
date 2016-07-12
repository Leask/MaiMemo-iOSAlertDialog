//
//  MyView.m
//  Sample
//
//  Created by TJT on 7/12/16.
//  Copyright © 2016 TJT. All rights reserved.
//

#import "MyView.h"

@implementation MyView

+ (instancetype)myViewWithFrame:(CGRect)frame {
    MyView *view = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:self options:nil] firstObject];
    view.frame = frame;
    view.layer.borderWidth = 1;
    return view;
}

@end
