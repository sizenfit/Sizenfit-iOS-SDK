//
//  StyleCollectionViewCell.h
//  Manyavar
//
//  Created by Applanding Solutions on 30/10/18.
//  Copyright © 2018 Applanding Solutions. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BorderButton.h"
NS_ASSUME_NONNULL_BEGIN

@interface StyleCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet BorderButton *btn_style;

@end

NS_ASSUME_NONNULL_END
