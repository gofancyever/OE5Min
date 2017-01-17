//
//  OEImageView.swift
//  OE5Min
//
//  Created by gaof on 2016/12/15.
//  Copyright © 2016年 gaof. All rights reserved.
//

import UIKit

class OEImageCollectionView: UIView {
    var images:[String]?{
        didSet{
            lab_pageNum.text = "1/\(images?.count)"
        }
    }
    
    lazy var lab_pageNum: UILabel = {
        return UILabel()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing      = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = .horizontal
        let collectionView:UICollectionView = UICollectionView(frame: self.frame, collectionViewLayout: layout)
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.register(OEImageCollectionViewCell.self, forCellWithReuseIdentifier: "OEImageCollectionViewCell")
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        self.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { (make) in
            make.top.left.bottom.right.equalTo(self)
        }
        
        self.addSubview(lab_pageNum)
        lab_pageNum.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        lab_pageNum.text = "1/4"
        lab_pageNum.snp.makeConstraints { (make) in
            make.bottom.equalTo(collectionView.snp.bottom).offset(-10)
            make.right.equalTo(collectionView.snp.right).offset(-10)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
extension OEImageCollectionView:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
//        return (images?.count)!
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:OEImageCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "OEImageCollectionViewCell", for: indexPath) as! OEImageCollectionViewCell
        let layout:UICollectionViewFlowLayout =  collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = collectionView.frame.size
        cell.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
//        cell.imageUrl = images?[indexPath.row];
        return cell
    }

    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let index: CGFloat = scrollView.contentOffset.x / scrollView.frame.size.width
        let fracPart = index.truncatingRemainder(dividingBy: 1)
        let item:Int = Int(fracPart >= 0.5 ? ceil(index) : floor(index))
        lab_pageNum.text = "\(item)/4"
    }
}
