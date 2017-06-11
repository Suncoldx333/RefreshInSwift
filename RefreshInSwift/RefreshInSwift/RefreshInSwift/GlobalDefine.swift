//
//  GlobalDefine.swift
//  RefreshInSwift
//
//  Created by 11111 on 2017/6/7.
//  Copyright © 2017年 ZheJiang WanHang Mdt InfoTech CO.,Ltd. All rights reserved.
//

import UIKit

typealias noParametersBlock = () -> Void

let ScreenWidth : CGFloat = UIScreen.main.bounds.size.width
let ScreenHeight : CGFloat = UIScreen.main.bounds.size.height

let HeaderZoneHeight : CGFloat = 60

public func hexColor(colorCode : Int) -> UIColor {
    let red   = ((colorCode & 0xFF0000) >> 16)
    let green = ((colorCode & 0xFF00) >> 8)
    let blue  = (colorCode & 0xFF)
    
    return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: CGFloat(1))
}

enum IndicatorStyle : NSInteger {
    case system = 1 ,
    custom = 2
}

enum IndicatorLocationStyle : NSInteger{
    case stayUp = 1,
    keepMoving = 2,
    stayDown = 4
}

struct cellKeys {
    static let refreshTypeChoose : String = "refreshTypeChoose"
    static let none : String = "none"
}

struct refreshKey {
    static var header : String = "refreshKeyForHeader"
    static var footer : String = "refreshKeyForFooter"
}

class GlobalDefine: NSObject {

}
