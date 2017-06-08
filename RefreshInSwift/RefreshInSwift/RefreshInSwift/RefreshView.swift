//
//  RefreshView.swift
//  RefreshInSwift
//
//  Created by 11111 on 2017/6/7.
//  Copyright © 2017年 ZheJiang WanHang Mdt InfoTech CO.,Ltd. All rights reserved.
//

import UIKit

public class RefreshView: UIView {

    var height : CGFloat!
    var isFooter : Bool!
    var action : noParametersBlock!
    
    var isRefreshing = false {
        didSet{
            updateState(isNowRefreshing: isRefreshing)
        }
    }
    var process : CGFloat = 0 {
        didSet{
            updateProcess(process: process)
        }
    }
    private var panEvent : UIPanGestureRecognizer?
    private var scrollView : UIScrollView?{
        return superview as? UIScrollView
    }
    
    init(height : CGFloat,isFooter : Bool = false,action : @escaping noParametersBlock) {
        
        self.height = height
        self.isFooter = isFooter
        self.action = action
        
        super.init(frame: CGRect.zero)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateState(isNowRefreshing : Bool) {
        
    }
    
    func updateProcess(process : CGFloat) {
        
    }
    
    public override func willMove(toSuperview newSuperview: UIView?) {
        scrollView?.removeObserver(self, forKeyPath: #keyPath(UIScrollView.contentOffset))
        panEvent?.removeObserver(self, forKeyPath: #keyPath(UIPanGestureRecognizer.state))
    }
    
    public override func didMoveToSuperview() {
        scrollView?.addObserver(self, forKeyPath: #keyPath(UIScrollView.contentOffset), context: nil)
        panEvent = scrollView?.panGestureRecognizer
        panEvent?.addObserver(self, forKeyPath: #keyPath(UIPanGestureRecognizer.state), options: NSKeyValueObservingOptions.new, context: nil)
        
        if isFooter {
            
        }else{
            frame = CGRect.init(x: 0, y: -height, width: ScreenWidth, height: height)
        }
        
    }
    
    public override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        if scrollView != nil {
            let observeScrollView : UIScrollView! = scrollView!
            
            if keyPath == #keyPath(UIScrollView.contentOffset) {
                scrollViewDidScroll(scroll: observeScrollView)
            }
            
            if keyPath == #keyPath(UIPanGestureRecognizer.state) {
                let curState : NSNumber = change?[NSKeyValueChangeKey.newKey] as! NSNumber
                if curState.intValue == UIGestureRecognizerState.ended.rawValue {
                    scrollViewEndDragging(scroll: observeScrollView)
                }
                
            }
            
            if keyPath == #keyPath(UIScrollView.contentSize) {
                frame = CGRect.init(x: 0, y: observeScrollView.contentSize.height, width: ScreenWidth, height: height)
            }
        }
    }
    
    func beginRefreshing() {
        
        if scrollView != nil {
            
            let scrollViewInUse = scrollView!
            
            isRefreshing = true
            process = 1
            
            UIView.animate(withDuration: 0.3, animations: { 
                if self.isFooter {
                    
                    scrollViewInUse.contentInset.bottom += self.height
                    
                }else{
                    
                    scrollViewInUse.contentOffset.y = -self.height - scrollViewInUse.contentInset.top
                    scrollViewInUse.contentInset.top += self.height
                }
            }, completion: { (true) in
                self.action()
            })
        }
    }
    
}

extension RefreshView{
    
    func scrollViewDidScroll(scroll : UIScrollView) {
        
        let valueZero : CGFloat = CGFloat.init(0)
        let valueOne : CGFloat = CGFloat.init(1)
        
        if isRefreshing {
            return
        }
        
        if isFooter {
            
        }else{
            process = min(valueOne, max(valueZero , -(scroll.contentOffset.y + scroll.contentInset.top) / height))
        }
        
    }
    
    func scrollViewEndDragging(scroll : UIScrollView) {
        
        if isRefreshing || process < 1 {
            return
        }
        
        beginRefreshing()
        
    }
}
