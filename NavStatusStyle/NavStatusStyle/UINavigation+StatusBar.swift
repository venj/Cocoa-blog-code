//
//  UINavigation+StatusBar.swift
//  NavStatusStyle
//
//  Created by Venj Chu on 14/7/24.
//  Copyright (c) 2014年 ElitechMedia. All rights reserved.
//

import UIKit

extension UINavigationController {
    override public func preferredStatusBarStyle() -> UIStatusBarStyle {
        return self.topViewController.preferredStatusBarStyle();
    }
}
