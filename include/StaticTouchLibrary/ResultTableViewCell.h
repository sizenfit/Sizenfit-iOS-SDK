//
//  ResultTableViewCell.h
//  Manyavar
//
//  Created by Applanding Solutions on 18/10/18.
//  Copyright © 2018 Applanding Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ResultTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lbl_size;
@property (weak, nonatomic) IBOutlet UILabel *lbl_chest;
@property (weak, nonatomic) IBOutlet UILabel *lbl_hip;
@property (weak, nonatomic) IBOutlet UILabel *lbl_waist;
@property (weak, nonatomic) IBOutlet UIButton *btn_matchSize;
@property (weak, nonatomic) IBOutlet UIView *view_bestmatch;

@end

NS_ASSUME_NONNULL_END
