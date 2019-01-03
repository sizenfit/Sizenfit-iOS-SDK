//
//  ResultViewController.h
//  Manyavar
//
//  Created by Applanding Solutions on 18/10/18.
//  Copyright © 2018 Applanding Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeightWeightCalculationViewController.h"
#import "SelectBrandViewController.h"
#import "ResultHeaderView.h"
#import "ResultFooterView.h"
#import "ResultTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface ResultViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *resultArray;
}
- (IBAction)switchValueChanged:(id)sender;
- (IBAction)goBack:(id)sender;
@property (weak, nonatomic) IBOutlet UISwitch *switch_INCM;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
- (IBAction)goOK:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonOk;

@end

NS_ASSUME_NONNULL_END
