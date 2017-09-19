//
//  RxCollectionViewController.swift
//  RxSwift-Table-Collection
//
//  Created by iOS_Tian on 2017/9/15.
//  Copyright © 2017年 iOS_Tian. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


fileprivate let kCollecCellID: String = "collecCell"

class RxCollectionViewController: UIViewController {

    @IBOutlet weak var collectionVIew: UICollectionView!
    
    fileprivate lazy var bag = DisposeBag()
    fileprivate lazy var anchorVM = AnchorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CollectionViewController"
        
        //1.加载collectionViewCell
        collectionVIew.register(UINib(nibName: "RxCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kCollecCellID)
        
        //2.给collectionView绑定数据
        anchorVM.heroVariable.asDriver().drive(collectionVIew.rx.items(cellIdentifier: kCollecCellID, cellType: RxCollectionViewCell.self)) { (_, anchor, cell) in
            cell.anchorModel = anchor
        }.addDisposableTo(bag)
        
        // 3.监听collectionView的点击
        collectionVIew.rx.modelSelected(AnchorModel.self).subscribe(onNext: { (model) in
            print(model.name)
        }).addDisposableTo(bag)
    }

}
