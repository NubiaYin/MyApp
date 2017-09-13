//
//  MAFontColorManager.swift
//  MyApp
//
//  Created by 尹健 on 2017/9/8.
//  Copyright © 2017年 nubia. All rights reserved.
//

import Foundation
import UIKit

fileprivate var fontDict:[String:UIFont] = [String:UIFont]()
fileprivate var colorDict:[String:UIColor] = [String:UIColor]()

public func MAFont(size:Int) -> UIFont {
    var font:UIFont? = fontDict["\(size)"]
    if font != nil {
        return font!
    }
    
    font = UIFont.systemFont(ofSize: CGFloat(size))
    fontDict["\(size)"] = font
    return font!
}

public func MAColor(hex:String, alpha:CGFloat) -> UIColor {
    let key = String(format: "%s,%.2f", hex, alpha)
    
    var color:UIColor? = colorDict[key]
    if color != nil {
        return color!
    }
    
    let colorHex = Int(hex)
    let r = CGFloat((colorHex! >> 4 )) / 256.0
    let g = CGFloat(((colorHex! << 2) >> 4 )) / 256.0
    let b = CGFloat(((colorHex! << 4) >> 4 )) / 256.0

    color = UIColor.init(red:r, green: g, blue: b, alpha: alpha)
    colorDict[key] = color
    
    return color!
}
