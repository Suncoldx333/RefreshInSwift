//
//  RefreshView.swift
//  RefreshInSwift
//
//  Created by 11111 on 2017/6/7.
//  Copyright © 2017年 ZheJiang WanHang Mdt InfoTech CO.,Ltd. All rights reserved.
//

import UIKit

public class RefreshView: UIView {

    var hright : CGFloat!
    var isFooter : Bool!
    var action : noParametersBlock!
    
    init(height : CGFloat,isFooter : Bool = false,action : noParametersBlock) {
        super.init(frame: CGRect.zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
