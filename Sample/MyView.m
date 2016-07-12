//
//  MyView.m
//  Sample
//
//  Created by TJT on 7/12/16.
//  Copyright © 2016 TJT. All rights reserved.
//

#import "MyView.h"

@implementation MyView

+ (instancetype)myView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:self options:nil] firstObject];
}

@end
