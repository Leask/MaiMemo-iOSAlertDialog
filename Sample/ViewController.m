//
//  ViewController.m
//  Sample
//
//  Created by TJT on 7/12/16.
//  Copyright © 2016 TJT. All rights reserved.
//

#import "ViewController.h"
#import "AlertDialog.h"
#import "MyView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *showAlertButton;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;

@end

@implementation ViewController

void (^positiveBlock)(ViewController *);
void (^negativeBlock)(ViewController *);
void (^naturalBlock)(ViewController *);

UIView *title;
UIView *conten;
UIButton *positiveButton;
UIButton *negativeButton;
UIButton *naturalButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.showAlertButton addTarget:self action:@selector(showAlert:) forControlEvents:UIControlEventTouchUpInside];
    self.showAlertButton.layer.cornerRadius = 4;
    self.showAlertButton.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.4];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)didLabelClicked {
    
}

- (void) viewDidAppear:(BOOL)animated {
//    AlertDialog *dialog = [[AlertDialog alloc] initWithViewCountroller: self];
//    dialog.dialogTitle = [[NSAttributedString alloc] initWithString: @"Fuck" attributes:nil];
//    [dialog show];
}

- (void) show {
    
}

- (void) hide {
    
}

- (void) dismiss {
    
}


/**
 *  initiate view via button click
 */
- (void)showAlert:(UIButton *)button {
    MyView *view = [MyView myView];
    view.click = ^(ButtonAction action) {
        NSLog(@"button clicked: %zd", action);
    };

    /**
     *  Avoid retain cycle to define a weak reference of self used in block
     *  bacuase this block does not get executed right after creation
     */
    __weak typeof(self) wself = self;
    view.dismissBlock = ^(CGPoint point) {

        /**
         *  The overlay in MyView will by pass all gesture down while still detecting
         *  tapping location. Location can then be used to determine whether any underlying view
         *  should perform side effect.
         */
        NSLog(@"dismissed by clicking point %@", NSStringFromCGPoint(point));
        if (CGRectContainsPoint(wself.label1.frame, point)) {
            NSLog(@"you hit label 1");
        } else if (CGRectContainsPoint(wself.label2.frame, point)) {
            NSLog(@"you hit label 2");
        } else if (CGRectContainsPoint(wself.showAlertButton.frame, point)) {
            NSLog(@"you hit button");
        } else {
            NSLog(@"you hit nothing");
        }
    };
    [view show];
}

@end
