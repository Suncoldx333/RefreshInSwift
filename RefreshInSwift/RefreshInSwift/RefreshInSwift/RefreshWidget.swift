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
            //get之后添加到subview，由于类型为RefreshView?，需判空，map可在对齐进行操作前判空
            newValue.map { (header) -> Void in
                self.insertSubview(header, at: 0)
            }
        }
    }
    
    var refreshFooter : RefreshView? {
        get{
            return objc_getAssociatedObject(self, &refreshKey.footer) as? RefreshView
        }
        set{
            objc_setAssociatedObject(self, &refreshKey.footer, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            newValue.map { (footer) -> Void in
                self.insertSubview(footer, at: 0)
            }
        }
    }
    
    
    func addIndicatorToHeader(color : UIColor,
                              height : CGFloat,
                              action : @escaping noParametersBlock) {
         refreshHeader = HeaderUseIndicator.init(color: color, height: height, action: action)
        refreshHeader?.backgroundColor = hexColor(colorCode: 0x00c18b).withAlphaComponent(0.1)
        
    }
    
    func beginRefrshInWidget() {
        refreshHeader?.beginRefreshing()
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
