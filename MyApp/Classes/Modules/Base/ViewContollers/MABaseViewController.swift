//
//  MABaseViewController.swift
//  MyApp
//
//  Created by 尹健 on 2017/9/8.
//  Copyright © 2017年 nubia. All rights reserved.
//

import UIKit

class MABaseViewController: UIViewController {

    fileprivate let _contentView:UIView = UIView()
    fileprivate let _navBar:UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension MABaseViewController {
    
    var contentView:UIView {
        return _contentView
    }
    
    var navBar:UIView {
        return _navBar
    }
}
