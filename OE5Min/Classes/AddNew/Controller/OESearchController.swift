//
//  OESearchController.swift
//  OE5Min
//
//  Created by gaof on 2017/2/13.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class OESearchController: OEBaseViewController {

    @IBOutlet weak var table_Classified: UITableView!
    
    @IBOutlet weak var collv_Classified: UICollectionView!
    
    @IBOutlet weak var height_header: NSLayoutConstraint!

    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupConfig()
        setupTableView()

    }
    
    func setupConfig() {

        self.collv_Classified.showsVerticalScrollIndicator = false
        self.collv_Classified.showsVerticalScrollIndicator = false
        
        self.collv_Classified.register(UINib(nibName: "\(OEClassifiedCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(OEClassifiedCell.self)")
        self.table_Classified.keyboardDismissMode = .onDrag
        self.table_Classified.register(UINib(nibName: "\(OETableClassifiedCell.self)", bundle: nil), forCellReuseIdentifier: "\(OETableClassifiedCell.self)")
    }
    func setupTableView() {
        self.collv_Classified.delegate = self
        /** tableView  **/
        let tableViewModels = [
            ClassifiedModel(name:"a",isSelected:true),
            ClassifiedModel(name:"b",isSelected:false),
            ClassifiedModel(name:"c",isSelected:true)   ,
            ]
        
        
        let items = Observable.just(
            tableViewModels
            )

        let addModelCommand = PublishSubject<CollectionViewEditingCommand>()
        let delModelCommand = PublishSubject<CollectionViewEditingCommand>()
        items
            .bindTo(table_Classified.rx.items(cellIdentifier:  "\(OETableClassifiedCell.self)", cellType: OETableClassifiedCell.self)){ (row, element, cell) in
                cell.model = element
                
                cell.rxBtnClassified.filter({ (type) -> Bool in
                    return type == .add
                }).subscribe({ (_) in
                    addModelCommand.onNext(.addModel(model: element))
                }).disposed(by: self.disposeBag)
                
                cell.rxBtnClassified.filter({ (type) -> Bool in
                    return type == .close
                }).subscribe({ (_) in
                    delModelCommand.onNext(.deleteModel(model: element))
                }).disposed(by: self.disposeBag)

                
            }
            .disposed(by: disposeBag)

        
        
        /** collectionView  **/
        let collectionViewModels = tableViewModels.filter { (model) -> Bool in
            return model.isSelected
        }
        
        let initialLoadCommand = Observable.just(CollectionViewEditingCommand.setModels(models: collectionViewModels))
            .observeOn(MainScheduler.instance)

        let initialState = CollectionViewEditingCommandsViewModel(models: [])
        let viewModel =  Observable.of(initialLoadCommand,addModelCommand,delModelCommand)
            .merge()
            .scan(initialState) { $0.executeCommand($1) }
            .shareReplay(1)
        viewModel.map({
            $0.models
        }).bindTo(collv_Classified.rx.items(cellIdentifier: "\(OEClassifiedCell.self)", cellType: OEClassifiedCell.self)){  (row, element, cell) in
            cell.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            cell.name.text = element.name
        }.disposed(by: disposeBag)
        

    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let height = self.collv_Classified.collectionViewLayout.collectionViewContentSize.height
        self.height_header.constant = height+120
        print(height)
    }

    @IBAction func btn_closeClick(_ sender: UIButton) {
        print("====")
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btn_trueClick(_ sender: UIButton) {
        
    }
    
  
}

extension OESearchController:UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
        }, completion: nil)
    }
}

