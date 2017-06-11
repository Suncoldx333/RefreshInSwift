//
//  CustomIndicator.swift
//  RefreshInSwift
//
//  Created by 11111 on 2017/6/7.
//  Copyright © 2017年 ZheJiang WanHang Mdt InfoTech CO.,Ltd. All rights reserved.
//

import UIKit

class CustomIndicator: NSObject {
    
}

class SystemIndicator: NSObject {
    
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
    
    lazy var customIndicator: CustomIndicatorView = {
        let indi : CustomIndicatorView = CustomIndicatorView.init(frame: CGRect.init(x: 0, y: 0, width: 60, height: 60))
        indi.indicatorInner = 6
        indi.indicatorOutside = 12.5
        return indi
    }()
    
    init(color : UIColor) {
        self.arrowColor = color
        indicator.color = color
    }
    
    func updateState(isRefrshing : Bool) {
        arrowLayer.isHidden = isRefrshing
        
        indicator.isHidden = !isRefrshing
        isRefrshing ? indicator.startAnimating() : indicator.stopAnimating()

        customIndicator.isHidden = isRefrshing
        
    }
    
    func updateProcess(process : CGFloat,isFooter : Bool) {
        
        print("process = \(process)")
        
        if isFooter {
            
        }else{
//            arrowLayer.transform = process == 1 ? CATransform3DMakeRotation(CGFloat.pi, 0, 0, 1) : CATransform3DIdentity
            
            
            
        }
        
    }
    
}

class CustomIndicatorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var indicatorInner : CGFloat = 6 {
        didSet{
            
        }
    }
    
    var indicatorOutside : CGFloat = 12.5 {
        didSet{
            CreateStaLoadWith(inner: indicatorInner, outside: indicatorOutside)
        }
    }
    
    var cell : UIView!
    
    func initUI() {
        
        self.backgroundColor = UIColor.clear
        self.isHidden = true
        
        for index in 0...12 {
            cell = UIView.init()
            cell.layer.cornerRadius = 1.0
            cell.backgroundColor = hexColor(colorCode: 0xb2b2b2)
            cell.tag = index + 1
            self.addSubview(cell)
        }
    }
    
    func CreateStaLoadWith(inner : CGFloat,outside : CGFloat) {
        
        assert(inner < outside, "inner can not longer than outside")
        
        rePlaceAllCellWith(inner: inner, outside: outside)
        
        hideAllCell()
    }
    
    func rePlaceAllCellWith(inner : CGFloat,outside : CGFloat) {
        
        self.frame = CGRect.init(x: 0, y: 0, width: 2 * outside, height: 2 * outside)
        self.center = CGPoint.init(x: ScreenWidth / 2, y: HeaderZoneHeight / 2)
        
        let cellLength : CGFloat = outside - inner
        let centerRadiu : CGFloat = inner + cellLength / 2
        let thirtyCos : CGFloat = centerRadiu * cos(CGFloat.pi / 6)
        let thirtySin : CGFloat = centerRadiu * sin(CGFloat.pi / 6)
        let ViewWidth = self.bounds.size.width
        let ViewHeight = self.bounds.size.height
        
        for teCell in self.subviews {
            switch teCell.tag {
            case 7:
                teCell.frame = CGRect.init(x: ViewWidth/2 - 1, y: ViewHeight - cellLength, width: 2, height: cellLength)
            case 6:
                teCell.frame = CGRect.init(x: ViewWidth/2 - 1 + thirtySin, y: ViewHeight - cellLength - (centerRadiu - thirtyCos), width: 2, height: cellLength)
                teCell.transform = CGAffineTransform.init(rotationAngle: -1 * CGFloat.pi / 6)
            case 5:
                teCell.frame = CGRect.init(x: ViewWidth/2 - 1 + thirtyCos, y: ViewHeight - cellLength - (centerRadiu - thirtySin), width: 2, height: cellLength)
                teCell.transform = CGAffineTransform.init(rotationAngle: -1 * CGFloat.pi / 3)
            case 4:
                teCell.frame = CGRect.init(x: ViewWidth/2 - 1 + centerRadiu, y: ViewHeight - cellLength - centerRadiu, width: 2, height: cellLength)
                teCell.transform = CGAffineTransform.init(rotationAngle: -1 * CGFloat.pi / 2)
            case 3:
                teCell.frame = CGRect.init(x: ViewWidth/2 - 1 + thirtyCos, y: ViewHeight - cellLength - (centerRadiu + thirtySin), width: 2, height: cellLength)
                teCell.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi / 3)
            case 2:
                teCell.frame = CGRect.init(x: ViewWidth/2 - 1 + thirtySin, y: ViewHeight - cellLength - (centerRadiu + thirtyCos), width: 2, height: cellLength)
                teCell.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi / 6)
            case 1:
                teCell.frame = CGRect.init(x: ViewWidth/2 - 1, y: ViewHeight - cellLength - centerRadiu * 2, width: 2, height: cellLength)
            case 12:
                teCell.frame = CGRect.init(x: ViewWidth/2 - 1 - thirtySin, y: ViewHeight - cellLength - (centerRadiu + thirtyCos), width: 2, height: cellLength)
                teCell.transform = CGAffineTransform.init(rotationAngle: -1 * CGFloat.pi / 6)
            case 11:
                teCell.frame = CGRect.init(x: ViewWidth/2 - 1 - thirtyCos, y: ViewHeight - cellLength - (centerRadiu + thirtySin), width: 2, height: cellLength)
                teCell.transform = CGAffineTransform.init(rotationAngle: -1 * CGFloat.pi / 3)
            case 10:
                teCell.frame = CGRect.init(x: ViewWidth/2 - 1 - centerRadiu, y: ViewHeight - cellLength - centerRadiu, width: 2, height: cellLength)
                teCell.transform = CGAffineTransform.init(rotationAngle: -1 * CGFloat.pi / 2)
            case 9:
                teCell.frame = CGRect.init(x: ViewWidth/2 - 1 - thirtyCos, y: ViewHeight - cellLength - (centerRadiu - thirtySin), width: 2, height: cellLength)
                teCell.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi / 3)
            case 8:
                teCell.frame = CGRect.init(x: ViewWidth/2 - 1 - thirtySin, y: ViewHeight - cellLength - (centerRadiu - thirtyCos), width: 2, height: cellLength)
                teCell.transform = CGAffineTransform.init(rotationAngle: CGFloat.pi / 6)
            default:
                print("error")
            }
        }
        
        
    }
    
    func hideAllCell() {
        let _ = self.subviews.map { (sub) -> Void in
            sub.isHidden = true
        }
    }
}
