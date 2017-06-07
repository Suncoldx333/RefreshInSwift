//
//  RefreshWidget.swift
//  RefreshInSwift
//
//  Created by 11111 on 2017/6/7.
//  Copyright © 2017年 ZheJiang WanHang Mdt InfoTech CO.,Ltd. All rights reserved.
//

import UIKit

extension UIScrollView {
    
    var refreshHeader : RefreshView?{
        get{
            return objc_getAssociatedObject(self, &refreshKey.header) as? RefreshView
        }
        set{
            objc_setAssociatedObject(self, &refreshKey.header, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    var refreshFooter : RefreshView? {
        get{
            return objc_getAssociatedObject(self, &refreshKey.footer) as? RefreshView
        }
        set{
            objc_setAssociatedObject(self, &refreshKey.footer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    
    func addIndicatorToHeader(color : UIColor,
                              height : CGFloat,
                              action : noParametersBlock) {
         refreshHeader = HeaderUseIndicator.init(color: color, height: height, action: action)
    }
}


/// 字体，颜色，文字，高度可在此统一修改
struct CustomSetup {
    
    static let color: UIColor = UIColor.black.withAlphaComponent(0.8)
    static let font: UIFont = UIFont.systemFont(ofSize: 14)
    static let loadingText = "Loading..."
    static let pullingText = "Pull down to refresh"
    static let releaseText = "Release to refresh"
    static let pullingFooterText = "Pull up to load more"
    static let releaseFooterText = "Release to load more"
    static let high: CGFloat = 120
    static let short: CGFloat = 60
}

class RefreshWidget: NSObject {

}
