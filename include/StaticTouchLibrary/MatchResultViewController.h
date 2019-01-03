//
//  MatchResultViewController.h
//  Manyavar
//
//  Created by Applanding Solutions on 18/10/18.
//  Copyright © 2018 Applanding Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleProgressView.h"
#import "ResultViewController.h"
#import "WaitingViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface MatchResultViewController : UIViewController{
    WaitingViewController *waitView;
}
@property (weak, nonatomic) IBOutlet CircleProgressView *progressview;
@property (weak, nonatomic) IBOutlet UILabel *lbl_match;
- (IBAction)goBack:(id)sender;

@end

NS_ASSUME_NONNULL_END
