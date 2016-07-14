//
//  ViewController.m
//  Sample
//
//  Created by TJT on 7/12/16.
//  Copyright © 2016 TJT. All rights reserved.
//

#import "ViewController.h"
#import "AlertDialog.h"

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

}

- (void) show {
    
}

- (void) hide {
    
}

- (void) dismiss {
    
}

- (IBAction)button:(id)sender {
    AlertDialog *view = [AlertDialog new];
//    view.titleText = @"Use Google's location service";
    view.contentText = @"To use Google's location service, you muse agree below protocol.To use Google's location service, you muse agree below protocol.To use Google's location service, you muse agree below protocol.To use Google's location service, you muse agree below protocol";
    view.negativeText = @"取消";
    view.positiveBlock = ^(AlertDialog *myView) {
        NSLog(@"OK clicked");
    };
    view.negativeBlock = ^(AlertDialog *myView) {
        NSLog(@"Cancel clicked");
    };
    view.neturalText = @"帮助";
    view.neturalBlock = ^(AlertDialog *myView) {
        NSLog(@"Help Clicked");
    };
    view.onCancel = ^(AlertDialog *myView) {
        NSLog(@"Canceled");
    };
    view.onDismiss = ^(AlertDialog *myView) {
        NSLog(@"dismissed");
    };
    [view show];
}

@end
