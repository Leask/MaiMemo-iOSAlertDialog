//
//  ViewController.m
//  Sample
//
//  Created by TJT on 7/12/16.
//  Copyright © 2016 TJT. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

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
    MyView *view = [MyView new];
    [view show];
}

- (void) show {
    
}

- (void) hide {
    
}

- (void) dismiss {
    
}

@end
