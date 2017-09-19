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

class AnchorViewModel {
    
    fileprivate lazy var anchorArr = [AnchorModel]()
    
    lazy var heroVariable: Variable<[AnchorModel]> = {
        var variable: Variable<[AnchorModel]> = Variable(self.anchorArr)
        self.getAnchorData {
            variable.value = self.anchorArr
        }
        return variable
    }()


}


extension AnchorViewModel {
    fileprivate func getAnchorData(_ finished: @escaping() -> ()){
        // 1.发送网络请求
        Alamofire.request("http://qf.56.com/home/v4/moreAnchor.ios", method: .get, parameters: ["index": 0]).responseJSON { (response) in
            // 2.获取结果
            guard let result = response.result.value else {
                print(response.result.error!)
                return
            }
            
            //3. 解析数据
            guard let jsonData = result as? [String: Any] else { return }
            guard let message = jsonData["message"] as? [String: Any] else { return }
            guard let anchors = message["anchors"] as? [[String: Any]] else { return }
            
            
            // 4.遍历所有的字典并且转成模型对象
            self.anchorArr += anchors.map({ AnchorModel(dic: $0) })
            finished()
        }
    }
}
