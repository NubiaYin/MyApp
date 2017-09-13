//
//  MANavigationBar.swift
//  MyApp
//
//  Created by 尹健 on 2017/9/8.
//  Copyright © 2017年 nubia. All rights reserved.
//

import UIKit
import SnapKit
import PromiseKit

class MANavigationBar: UIView {
    
    fileprivate let titleLabel:UILabel = {
        var label:UILabel = UILabel()
        label.textColor = UIColor.black;
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    fileprivate var leftButton:UIButton? = nil
    fileprivate var rightButton:UIButton? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func drawView() {
        self.backgroundColor = UIColor.white
    }
    
    func setTitle(text:String?) {
        titleLabel.text = text
    }
    
    func setLeft(button:UIButton?) {
        if let aButton = self.leftButton {
            aButton.removeFromSuperview()
            aButton.snp.removeConstraints()
        }
        
        guard let aButton = button else {
            return
        }
        
        aButton.snp.removeConstraints()
        aButton.snp.makeConstraints { maker in
            maker.width.equalTo(56.0)
            maker.height.equalTo(44.0)
            maker.left.equalTo(self)
            maker.top.equalTo(self).offset(20)
        }
    
        leftButton = aButton
        self.addSubview(aButton)
    }
    
    func setRight(button:UIButton?) {
        if let aButton = self.rightButton {
            aButton.removeFromSuperview()
            aButton.snp.removeConstraints()
        }
        
        guard let aButton = button else {
            return
        }
        
        aButton.snp.removeConstraints()
        aButton.snp.makeConstraints { maker in
            maker.width.equalTo(56.0)
            maker.height.equalTo(44.0)
            maker.right.equalTo(self)
            maker.top.equalTo(self).offset(20)
        }
        
        rightButton = aButton
        self.addSubview(aButton)

    }
}
