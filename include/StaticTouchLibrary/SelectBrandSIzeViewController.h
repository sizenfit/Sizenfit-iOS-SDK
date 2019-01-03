//
//  SelectBrandSIzeViewController.h
//  Manyavar
//
//  Created by Applanding Solutions on 18/10/18.
//  Copyright © 2018 Applanding Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MatchResultViewController.h"
#import "BorderButton.h"
#import "SizeCollectionViewCell.h"
#import "StyleCollectionViewCell.h"
#import "SelectBrandViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface SelectBrandSIzeViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>{
    
    NSMutableArray *array_sizes;
    NSMutableArray *array_style;
}
- (IBAction)goBack:(id)sender;
- (IBAction)navigateToRightSize:(id)sender;
- (IBAction)navigateToLeftSize:(id)sender;
- (IBAction)navigateToRightStyle:(id)sender;
- (IBAction)navigateToLeftStyle:(id)sender;
- (IBAction)goHeightWeightCalculation:(id)sender;
- (IBAction)calculateSize:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn_leftSize;
@property (weak, nonatomic) IBOutlet UIButton *btn_rightSize;
@property (weak, nonatomic) IBOutlet UIButton *btn_leftStyle;
@property (weak, nonatomic) IBOutlet UIButton *btn_rightStyle;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview_size;
@property (weak, nonatomic) IBOutlet UIButton *buttonCalculate;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview_style;
@end

NS_ASSUME_NONNULL_END
