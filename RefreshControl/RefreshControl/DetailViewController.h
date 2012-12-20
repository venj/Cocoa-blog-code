//
//  DetailViewController.h
//  RefreshControl
//
//  Created by venj on 12-12-20.
//  Copyright (c) 2012年 venj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
