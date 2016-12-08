//
//  OEHomeContoller.swift
//  OE5Min
//
//  Created by gaof on 2016/12/8.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit

let cellName = "OEHomeCollectionCell"

class OEHomeContoller: UIViewController {
    
    var collectionView:UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize.init(width: kScreenHeight*0.5, height: kScreenHeight*0.5)
        let collectionView = UICollectionView(frame: CGRect.init(), collectionViewLayout: layout)
        collectionView.setCollectionViewLayout(layout, animated: true)
        collectionView.register(UINib.init(nibName: cellName, bundle: nil), forCellWithReuseIdentifier: cellName)
        collectionView.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        self.view.addSubview(collectionView)
        
        self.collectionView.snp.makeConstraints { (make) in
            make.height.equalTo(kScreenHeight*0.5)
            make.width.equalTo(kScreenWidth)
            make.center.equalTo(self.view)
        }
        
        
        
    }


}
extension OEHomeContoller: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellName, for: indexPath)
        
        return cell;
    }
}

