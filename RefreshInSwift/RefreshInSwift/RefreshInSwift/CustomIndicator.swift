//
//  CustomIndicator.swift
//  RefreshInSwift
//
//  Created by 11111 on 2017/6/7.
//  Copyright © 2017年 ZheJiang WanHang Mdt InfoTech CO.,Ltd. All rights reserved.
//

import UIKit

class CustomIndicator: NSObject {
    
    private let arrowColor : UIColor
    
    lazy var arrowLayer: CAShapeLayer = {
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 8))
        path.addLine(to: CGPoint(x: 0, y: -8))
        path.move(to: CGPoint(x: 0, y: 8))
        path.addLine(to: CGPoint(x: 5.66, y: 2.34))
        path.move(to: CGPoint(x: 0, y: 8))
        path.addLine(to: CGPoint(x: -5.66, y: 2.34))
        
        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.strokeColor = self.arrowColor.cgColor
        layer.lineWidth = 2
        layer.lineCap = kCALineCapRound
        return layer
        
    }()
    
    let indicator = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    init(color : UIColor) {
        self.arrowColor = color
        indicator.color = color
    }
    
}
