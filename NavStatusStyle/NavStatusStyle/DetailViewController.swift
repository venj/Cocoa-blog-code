//
//  DetailViewController.swift
//  NavStatusStyle
//
//  Created by Venj Chu on 14/7/24.
//  Copyright (c) 2014年 ElitechMedia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
                            
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle  {
        return .Default
    }

    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail: AnyObject = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

