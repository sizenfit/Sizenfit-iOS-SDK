//
//  HeightWeightCalculationViewController.h
//  Manyavar
//
//  Created by Applanding Solutions on 17/10/18.
//  Copyright © 2018 Applanding Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BorderdLabel.h"
#import "BorderButton.h"
#import "HHDropDownList.h"
#import "JMMarkSlider.h"
#import "BodyShapeViewController.h"
#import "SelectBrandViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HeightWeightCalculationViewController : UIViewController<HHDropDownListDelegate, HHDropDownListDataSource>
@property (weak, nonatomic) IBOutlet UIButton *buttonNext;

@property (weak, nonatomic) IBOutlet BorderdLabel *lbl_heightValue;
@property (weak, nonatomic) IBOutlet HHDropDownList *lbl_heightMeasureType;
@property (weak, nonatomic) IBOutlet JMMarkSlider *slider_height;
@property (weak, nonatomic) IBOutlet BorderdLabel *lbl_heightMinus;
@property (weak, nonatomic) IBOutlet BorderdLabel *lbl_heightPlus;
- (IBAction)heightValueChanged:(id)sender;
@property (weak, nonatomic) IBOutlet BorderdLabel *lbl_weightValue;
@property (weak, nonatomic) IBOutlet HHDropDownList *lbl_weightMeasureType;
@property (weak, nonatomic) IBOutlet BorderdLabel *lbl_weightMinus;
@property (weak, nonatomic) IBOutlet JMMarkSlider *slider_weight;
@property (weak, nonatomic) IBOutlet BorderdLabel *lbl_weightPlus;
- (IBAction)weightValueChanged:(id)sender;
@property (weak, nonatomic) IBOutlet BorderButton *btn_skinTight;
@property (weak, nonatomic) IBOutlet BorderButton *btn_normal;
@property (weak, nonatomic) IBOutlet BorderButton *btn_bitLoose;
- (IBAction)selectWearStyle:(id)sender;
- (IBAction)goNext:(id)sender;
- (IBAction)goFavoriteBrand:(id)sender;
@end

NS_ASSUME_NONNULL_END
