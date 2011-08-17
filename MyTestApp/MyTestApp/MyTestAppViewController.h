//
//  MyTestAppViewController.h
//  MyTestApp
//
//  Created by Venj Chu on 11/08/17.
//  Copyright 2011年 Home. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MySillyAdd.h"

@interface MyTestAppViewController : UIViewController {
    UITextField *numberA;
    UITextField *numberB;
    UILabel *resultLabel;
    MySillyAdd *mySillyAdd;
}


@property (nonatomic, retain) IBOutlet UITextField *numberA;
@property (nonatomic, retain) IBOutlet UITextField *numberB;
@property (nonatomic, retain) IBOutlet UILabel *resultLabel;
@property (nonatomic, retain) MySillyAdd *mySillyAdd;

- (IBAction)calc:(id)sender;

@end
