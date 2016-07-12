//
//  OverlayView.h
//  momo_ios
//
//  Created by leon on 6/16/16.
//  Copyright © 2016 MaiMemo Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^TapBlock)(CGPoint point);

@interface OverlayView : UIView

@property (nonatomic, copy) TapBlock tapBlock;

@end
