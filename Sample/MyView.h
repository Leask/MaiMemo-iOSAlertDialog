//
//  MyView.h
//  Sample
//
//  Created by TJT on 7/12/16.
//  Copyright © 2016 TJT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyView : UIView

typedef void (^Callback)(MyView *);

@property (copy, nonatomic) NSString    *titleText;
@property (copy, nonatomic) NSString    *contentText;
@property (weak, nonatomic) UIView      *customView;

@property (copy, nonatomic) Callback    onDismiss;
@property (copy, nonatomic) Callback    onCancel;

@property (copy, nonatomic) NSString    *positiveText;
@property (copy, nonatomic) NSString    *negativeText;
@property (copy, nonatomic) NSString    *neturalText;

@property (copy, nonatomic) Callback    positiveBlock;
@property (copy, nonatomic) Callback    negativeBlock;
@property (copy, nonatomic) Callback    neturalBlock;

+ (UIWindow *)frontMostWindow;

+ (CGFloat) getMinWidth;

- (void) show;

- (void) hide;

- (void) dismiss;
@end
