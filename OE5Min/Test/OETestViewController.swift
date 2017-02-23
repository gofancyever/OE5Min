//
//  OETestViewController.swift
//  OE5Min
//
//  Created by gaof on 2017/2/23.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class OETestViewController: UIViewController {

    var dataSource:[String] = ["a"]
    let tableView = UITableView(frame: CGRect.zero, style: .plain)
    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableView)
        tableView.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        tableView.snp.makeConstraints { (make) in
            make.left.right.top.equalTo(self.view)
            make.height.equalTo(300)
        }
        
        
        let button = UIButton()
        view.addSubview(button)
        button.setTitle("添加", for: .normal)
        button.addTarget(self, action: #selector(buttonAddClick(sender:)), for: .touchUpInside)
        
        let button2 = UIButton()
        view.addSubview(button2)
        button2.setTitle("删除", for: .normal)
        button2.addTarget(self, action: #selector(buttonDelClick(sender:)), for: .touchUpInside)
        
        button.snp.makeConstraints { (make) in
            make.left.bottom.equalTo(self.view)
            make.width.equalTo(self.view.frame.width/2)
            make.height.equalTo(44)
        }
        button2.snp.makeConstraints { (make) in
            make.right.bottom.equalTo(self.view)
            make.width.equalTo(self.view.frame.width/2)
            make.height.equalTo(44)
        }
        //=========================================================================================
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        

        
    }

    func buttonAddClick(sender:UIButton) {
        self.dataSource.append("a")
        let index = IndexPath(row: self.dataSource.count-1, section: 0)
        self.tableView.insertRows(at: [index], with: .automatic)
        
        self.tableView.reloadData()
    }
    func buttonDelClick(sender:UIButton) {
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    


}
extension OETestViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "\(indexPath)"
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
}
