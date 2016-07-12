//
//  ViewController.h
//  Sample
//
//  Created by TJT on 7/12/16.
//  Copyright © 2016 TJT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


@property (copy, nonatomic) NSAttributedString      *alertTitle;
@property (copy, nonatomic) NSAttributedString      *alertContent;
@property (strong, nonatomic) UIView                *contentView;

- (void) dismiss;

- (void) hide;

- (void) show;

@end

