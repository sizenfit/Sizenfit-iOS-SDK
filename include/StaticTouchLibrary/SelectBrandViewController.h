//
//  SelectBrandViewController.h
//  Manyavar
//
//  Created by Applanding Solutions on 18/10/18.
//  Copyright © 2018 Applanding Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuggestiveTextField.h"
#import "HeightWeightCalculationViewController.h"
#import "SelectBrandSIzeViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface SelectBrandViewController : UIViewController<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIView *bg_textField;
@property (weak, nonatomic) IBOutlet SuggestiveTextField *txt_searchBrand;
- (IBAction)goBack:(id)sender;
- (IBAction)goHeightWeightCalculation:(id)sender;
- (IBAction)goNext:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonNext;

@end

NS_ASSUME_NONNULL_END
