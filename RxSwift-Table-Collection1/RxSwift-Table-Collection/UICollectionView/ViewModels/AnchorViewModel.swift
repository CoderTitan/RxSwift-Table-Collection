//
//  AnchorViewModel.swift
//  RxSwift-Table-Collection
//
//  Created by iOS_Tian on 2017/9/18.
//  Copyright © 2017年 Quanjun. All rights reserved.
//

import UIKit
import RxSwift
import Alamofire


class AnchorViewModel : BaseViewModel{
    // 存放着解析完成的模型数组
    let anchorArr = Variable<[AnchorModel]>([])

}


extension AnchorViewModel: JunViewModelType {
    typealias Input = JunInput
    typealias Output = JunOutput

    func transform(input: AnchorViewModel.JunInput) -> AnchorViewModel.JunOutput {
        let sectionArr = anchorArr.asDriver().map { (models) -> [AnchorSection] in
            // 当models的值被改变时会调用
            return [AnchorSection(items: models)]
        }.asDriver(onErrorJustReturn: [])
        
        let output = JunOutput(sections: sectionArr)
        
        output.requestCommond.subscribe(onNext: { (isReloadData) in
            self.index = isReloadData ? 1 : self.index + 1
            //开始请求数据
            junNetworkTool.request(JunNetworkTool.getHomeList(page: self.index))
                .mapObjectArray(AnchorModel.self)
                .subscribe({ (event) in
                    switch event {
                    case let .next(modelArr):
                        self.anchorArr.value = isReloadData ? modelArr : (self.anchorArr.value) + modelArr
                        SVProgressHUD.showSuccess(withStatus: "加载成功")
                    case let .error(error):
                        SVProgressHUD.showError(withStatus: error.localizedDescription)
                    case .completed:
                        output.refreshStatus.value = isReloadData ? .endHeaderRefresh : .endFooterRefresh
                    }
            }).addDisposableTo(bag)
        }).addDisposableTo(bag)
        
        return output
    }
}

