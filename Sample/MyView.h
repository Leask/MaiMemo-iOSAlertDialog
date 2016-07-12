//
//  MyView.h
//  Sample
//
//  Created by TJT on 7/12/16.
//  Copyright © 2016 TJT. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ButtonAction) {
    ButtonActionPositive,
    ButtonActionNegative,
    ButtonActionNeutral
};

typedef void (^ClickBlock)(ButtonAction action);
typedef void (^DismissBlock)(CGPoint tapPoint);

@interface MyView : UIView

@property (nonatomic, copy) ClickBlock click;
@property (nonatomic, copy) DismissBlock dismissBlock;

+ (instancetype)myView;

- (void)show;

@end
