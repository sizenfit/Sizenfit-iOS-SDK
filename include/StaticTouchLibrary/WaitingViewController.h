//
//  WaitingViewController.h
//  Manyavar
//
//  Created by Applanding Solutions on 26/10/18.
//  Copyright © 2018 Applanding Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DotActivityIndicatorView.h"
NS_ASSUME_NONNULL_BEGIN

@interface WaitingViewController : UIViewController

@property (nonatomic, strong) IBOutlet DotActivityIndicatorView* indicatorView;

- (void)show;
- (void) hide;
@end

NS_ASSUME_NONNULL_END
