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
import RxDataSources


fileprivate let kCollecCellID: String = "collecCell"

class RxCollectionViewController: UIViewController {

    @IBOutlet weak var collectionVIew: UICollectionView!
    
    fileprivate lazy var bag = DisposeBag()
    fileprivate lazy var anchorVM = AnchorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "CollectionViewController"
        
        //0.加载collectionViewCell
        collectionVIew.register(UINib(nibName: "RxCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: kCollecCellID)
        
        //1.设置代理
        //1-1. 绑定cell
        let dataSource = RxCollectionViewSectionedReloadDataSource<AnchorSection>()
        dataSource.configureCell = { ds, collectionView, indexPath, item in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollecCellID, for: indexPath) as! RxCollectionViewCell
            cell.anchorModel = item
            return cell
        }
        
        //2. 初始化请求
        let vmInput = AnchorViewModel.JunInput(category: .getNewList)
        let vmOutput = anchorVM.transform(input: vmInput)
        
        //3. 添加刷新
        collectionVIew.mj_header = MJRefreshNormalHeader(refreshingBlock: {
            vmOutput.requestCommond.onNext(true)
        })
        collectionVIew.mj_header.beginRefreshing()
        
        collectionVIew.mj_footer = MJRefreshAutoNormalFooter(refreshingBlock: {
            vmOutput.requestCommond.onNext(false)
        })
        
        //4. 给collectionView绑定数据
        vmOutput.sections.asDriver().drive(collectionVIew.rx.items(dataSource: dataSource)).addDisposableTo(bag)
        
        //5. 设置刷新状态
        vmOutput.refreshStatus.asObservable().subscribe(onNext: { (status) in
            switch status {
            case .beingHeaderRefresh:
                self.collectionVIew.mj_header.beginRefreshing()
            case .endHeaderRefresh:
                self.collectionVIew.mj_header.endRefreshing()
            case .beingFooterRefresh:
                self.collectionVIew.mj_footer.beginRefreshing()
            case .endFooterRefresh:
                self.collectionVIew.mj_footer.endRefreshing()
            case .noMoreData:
                self.collectionVIew.mj_footer.endRefreshingWithNoMoreData()
            default:
                break
            }
        }).addDisposableTo(bag)
        
        
        
        // 6.监听collectionView的点击
        collectionVIew.rx.modelSelected(AnchorModel.self).subscribe(onNext: { (model) in
            print(model.name)
        }).addDisposableTo(bag)
    }
    
    

}
