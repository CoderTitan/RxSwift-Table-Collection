//
//  BaseViewModel.swift
//  RxSwift-Table-Collection
//
//  Created by iOS_Tian on 2017/9/30.
//  Copyright © 2017年 Quanjun. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

//刷新的状态
enum JunRefreshStatus {
    case none
    case beingHeaderRefresh
    case endHeaderRefresh
    case beingFooterRefresh
    case endFooterRefresh
    case noMoreData
}


protocol JunViewModelType {
    //associatedtype: 关联类型为协议中的某个类型提供了一个占位名（或者说别名），其代表的实际类型在协议被采纳时才会被指定
    associatedtype Input
    associatedtype Output
    
    //我们通过 transform 方法将input携带的数据进行处理，生成了一个Output
    func transform(input: Input) -> Output
}


class BaseViewModel: NSObject {
    // 记录当前的索引值
    var index: Int = 1
    
    
    struct JunInput {
        // 网络请求类型
        let category: JunNetworkTool
        
        init(category: JunNetworkTool) {
            self.category = category
        }
    }
    
    struct JunOutput {
        // tableView的sections数据
        let sections: Driver<[AnchorSection]>
        // 外界通过该属性告诉viewModel加载数据（传入的值是为了标志是否重新加载）
        let requestCommond = PublishSubject<Bool>()
        // 告诉外界的tableView当前的刷新状态
        let refreshStatus = Variable<JunRefreshStatus>(.none)
        
        init(sections: Driver<[AnchorSection]>) {
            self.sections = sections
        }
    }
}

