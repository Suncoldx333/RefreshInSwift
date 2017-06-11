//
//  RefreshShowVC.swift
//  RefreshInSwift
//
//  Created by 11111 on 2017/6/7.
//  Copyright © 2017年 ZheJiang WanHang Mdt InfoTech CO.,Ltd. All rights reserved.
//

import UIKit

class RefreshShowVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        refreshRat.beginRefrshInWidget()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    lazy var refreshRat: UITableView = {
        
        let createRat : UITableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight), style: UITableViewStyle.grouped)
        createRat.backgroundColor = hexColor(colorCode: 0xffffff)
        createRat.delegate = self
        createRat.dataSource = self
        createRat.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellKeys.none)
        
        createRat.addIndicatorToHeader(height: HeaderZoneHeight, action: {
            [unowned self] () in
            self.pullEvent()
        })
        
        return createRat
    }()
    
    func initUI() {
    
        self.view.backgroundColor = hexColor(colorCode: 0x00c18b).withAlphaComponent(0.2)
        self.view.addSubview(refreshRat)
        
    }


}

extension RefreshShowVC {
    func pullEvent() {
        
        
    }
}

extension RefreshShowVC:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.00001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellKeys.none)!
        
        cell.textLabel?.text = "nop"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension RefreshShowVC {
    enum Style: Int {
        case indicatorHeader, textHeader, smallGIFHeader, gifTextHeader, bigGIFHeader, superCatHeader, indicatorFooter, textFooter
    }
}
