//
//  ViewController.swift
//  RefreshInSwift
//
//  Created by 11111 on 2017/6/7.
//  Copyright © 2017年 ZheJiang WanHang Mdt InfoTech CO.,Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    lazy var refreshTypeChooseTable: UITableView = {
        
        let createTable : UITableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight), style: UITableViewStyle.grouped)
        createTable.backgroundColor = hexColor(colorCode: 0xffffff)
        createTable.delegate = self
        createTable.dataSource = self
        createTable.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellKeys.refreshTypeChoose)
        return createTable
    }()
    
    func initUI() {
        self.view.backgroundColor = hexColor(colorCode: 0xe6e6e6)
        self.view.addSubview(refreshTypeChooseTable)
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
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
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellKeys.refreshTypeChoose)!
        
        if indexPath.row == 0 {
            cell.textLabel?.text = "Indicatior"
            return cell
        }
        
        cell.textLabel?.text = "hello"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let showVC : RefreshShowVC = RefreshShowVC.init()
        
        navigationController?.pushViewController(showVC, animated: true)
        
    }
}
