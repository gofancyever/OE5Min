//
//  OEHomeController.swift
//  OE5Min
//
//  Created by gaof on 2017/2/6.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class OEHomeController: OEBaseTableViewController {
    
    var disposeBag = DisposeBag()
    
    let dataSource = RxTableViewSectionedReloadDataSource<SectionModel<String, Double>>()
    
    //    let tapCellFavoriteTigger:PulishSubject<Int> = PulishSubject<Int>()
    
    lazy var navFrame:CGRect? = {
        return self.navigationController?.navigationBar.frame
    }()
    
    var lastScrollPointY:CGFloat = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSubViews()
        initConstraints()
        self.tableView.delegate = self
        navFrame = self.navigationController?.navigationBar.frame
        
        let items = Observable.just(
            [
                SectionModel(model: "First section", items: [
                    1.0,
                    2.0,
                    3.0,
                    2.0,2.0,2.0,2.0,2.0,2.0,2.0,2.0,
                    ])
            ]
        )
        //MARK:--配置Cell
        dataSource.configureCell = { [unowned self] (_,tv,indexPath,element) in
            let cell = tv.dequeueReusableCell(withIdentifier: "\(OEHomeCell.self)")! as! OEHomeCell
            //MARK:--Cell_Favorite点击事件
            cell.tool_favoShare.rxBtnShare.subscribe({ (_) in
                print("点击了Favorite")
            }).disposed(by: self.disposeBag)

            //MARK:--Cell_Share点击事件
            cell.tool_favoShare.rxBtnShare.subscribe { (button) in
                print("点击了Share")
                }.disposed(by: self.disposeBag)
            return cell
        }
        
        items
            .bindTo(tableView.rx.items(dataSource:dataSource))
            .disposed(by: disposeBag)
        //MARK:--cell点击
        tableView.rx
            .itemSelected
            .map { [unowned self] indexPath in
                return (indexPath, self.dataSource[indexPath])
            }
            .subscribe(onNext: {[unowned self] indexPath, model in
                self.configCellHero(indexPath:indexPath)
                let detailController = OEHomeDetailController()
                detailController.selectedIndexPath = indexPath
                
                let controller = UIStoryboard(name: "HomeStoryBoard", bundle: nil).instantiateViewController(withIdentifier: "HomeDetail")
                
                self.navigationController?.pushViewController(detailController, animated: true)
                
                
            })
            .disposed(by: disposeBag)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    ///配置Hero转场动画必要属性
    func configCellHero(indexPath:IndexPath){
        let cell = self.tableView.cellForRow(at: indexPath) as! OEHomeCell
        cell.heroModifiers = [.fade]
        cell.imgV_cellBg.heroModifiers = [.arc]
        cell.contentView.heroModifiers = [.arc,.useGlobalCoordinateSpace]
        cell.imgV_cellBg.heroID = "image_\(indexPath.row)"
        cell.view_content.heroID = "content_\(indexPath.row)"
        cell.tool_favoShare.heroID = "tool_\(indexPath.row)"
    }
    
    func initSubViews(){
        self.view.addSubview(self.tableView)
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 100
        self.tableView.register(UINib(nibName: "\(OEHomeCell.self)", bundle: nil), forCellReuseIdentifier: "\(OEHomeCell.self)")
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "left", style: .plain, target: self, action: #selector(leftItemClick))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "right", style: .plain, target: self, action: #selector(rightItemClick))
    }
    func initConstraints(){
        self.tableView.snp.makeConstraints { (make) in
            make.bottom.top.left.right.equalTo(self.view)
        }
    }
    
    func leftItemClick(){
        let searchController = OESearchController()
        self.present(searchController, animated: true, completion: nil)
    }
    
    func rightItemClick() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
}


