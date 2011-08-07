//
//  FileExchangeViewController.h
//  FileExchange
//
//  Created by Venj Chu on 11/08/07.
//  Copyright 2011年 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FileExchangeViewController : UIViewController {
    UILabel *statusMessage;
}

@property (nonatomic, retain) IBOutlet UILabel *statusMessage;

@end
