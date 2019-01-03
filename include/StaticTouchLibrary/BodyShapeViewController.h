//
//  BodyShapeViewController.h
//  Manyavar
//
//  Created by Applanding Solutions on 18/10/18.
//  Copyright © 2018 Applanding Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BorderButton.h"
#import "MatchResultViewController.h"
#import "SelectBrandViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface BodyShapeViewController : UIViewController
- (IBAction)goBack:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *txt_trianlge;
@property (weak, nonatomic) IBOutlet UILabel *txt_oval;
@property (weak, nonatomic) IBOutlet UILabel *txt_rectangle;
@property (weak, nonatomic) IBOutlet UILabel *txt_inverted_triangle;
@property (weak, nonatomic) IBOutlet UIButton *buttonCalculate;
- (IBAction)goFavoriteBrand:(id)sender;
- (IBAction)calculateSize:(id)sender;
@property (weak, nonatomic) IBOutlet BorderButton *btn_triangle;
@property (weak, nonatomic) IBOutlet BorderButton *btn_oval;
@property (weak, nonatomic) IBOutlet BorderButton *btn_rectangle;
@property (weak, nonatomic) IBOutlet BorderButton *btn_invertedtriangle;
@property (weak, nonatomic) IBOutlet UILabel *lbl_triangle;
@property (weak, nonatomic) IBOutlet UILabel *lbl_oval;
@property (weak, nonatomic) IBOutlet UILabel *lbl_rectangle;
@property (weak, nonatomic) IBOutlet UILabel *lbl_invertedtriangle;
- (IBAction)selectBodyShape:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *btn_leftShape;
@property (weak, nonatomic) IBOutlet UIButton *btn_rightShape;
- (IBAction)navigateToRightShape:(id)sender;
- (IBAction)navigateToLeftShape:(id)sender;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollview_shape;


@end

NS_ASSUME_NONNULL_END
