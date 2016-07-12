//
//  AlertDialog.h
//  Sample
//
//  Created by TJT on 7/12/16.
//  Copyright © 2016 TJT. All rights reserved.
//

#ifndef AlertDialog_h
#define AlertDialog_h

#import <UIKit/UIKit.h>

@interface AlertDialog : NSObject

@property (copy, nonatomic) NSAttributedString      *dialogTitle;
@property (copy, nonatomic) NSAttributedString      *content;

@property (copy, nonatomic) NSAttributedString      *positive;
@property (strong, nonatomic) void                  (^positiveCallback)(AlertDialog *);

@property (copy, nonatomic) NSAttributedString      *negative;
@property (strong, nonatomic) void                  (^negativeCallback)(AlertDialog *);

@property (copy, nonatomic) NSAttributedString      *natural;
@property (strong, nonatomic) void                  (^neturalCallback)(AlertDialog *);

- (instancetype) initWithViewCountroller: UIViewController;

- (void) show;

- (void) hide;

- (void) dismiss;


- (IBAction)positiveClick:(id)sender;
- (IBAction)negativeClick:(id)sender;
- (IBAction)naturalClick:(id)sender;

@end

#endif /* AlertDialog_h */
