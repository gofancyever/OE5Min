//
//  OESearchController.swift
//  OE5Min
//
//  Created by gaof on 2017/2/13.
//  Copyright © 2017年 gaof. All rights reserved.
//

import UIKit

class OESearchController: OEBaseViewController {

    @IBOutlet weak var table_Classified: UITableView!
    
    @IBOutlet weak var collv_Classified: UICollectionView!
    
    @IBOutlet weak var height_header: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collv_Classified.delegate = self
        self.collv_Classified.dataSource = self
        self.table_Classified.delegate = self
        self.table_Classified.dataSource = self
        self.table_Classified.register(UINib(nibName: "\(OETableClassifiedCell.self)", bundle: nil), forCellReuseIdentifier: "\(OETableClassifiedCell.self)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let collvHeight = collv_Classified.collectionViewLayout.collectionViewContentSize.height
        height_header.constant = 24+44+collvHeight
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    @IBAction func btn_closeClick(_ sender: UIButton) {
        print("====")
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btn_trueClick(_ sender: UIButton) {
        
    }
  
}
extension OESearchController:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(OEClassifiedCell.self)", for: indexPath) as! OEClassifiedCell
        cell.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {

        cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
        UIView.animate(withDuration: 1, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
            cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
        }, completion: nil)
    }
}
extension OESearchController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(OETableClassifiedCell.self)")  as! OETableClassifiedCell
        return cell
    }
}
