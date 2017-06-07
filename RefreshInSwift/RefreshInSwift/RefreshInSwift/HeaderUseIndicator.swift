//
//  HeaderUseIndicator.swift
//  RefreshInSwift
//
//  Created by 11111 on 2017/6/7.
//  Copyright © 2017年 ZheJiang WanHang Mdt InfoTech CO.,Ltd. All rights reserved.
//

import UIKit

class HeaderUseIndicator: RefreshView {
    private let indicatorObject : CustomIndicator
    
    init(color : UIColor,height : CGFloat,action :  noParametersBlock) {
        
        self.indicatorObject = CustomIndicator.init(color: color)
        super.init(height: height, action: action)
        
        self.layer.addSublayer(indicatorObject.arrowLayer)
        self.addSubview(indicatorObject.indicator)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        indicatorObject.arrowLayer.position = CGPoint.init(x: self.bounds.midX, y: self.bounds.midY)
        indicatorObject.indicator.center = CGPoint.init(x: self.bounds.midX, y: self.bounds.midY)
    }
}