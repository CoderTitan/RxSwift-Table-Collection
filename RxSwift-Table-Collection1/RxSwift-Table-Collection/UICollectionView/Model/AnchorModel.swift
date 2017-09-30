//
//  AnchorModel.swift
//  GYJTV
//
//  Created by 田全军 on 2017/7/20.
//  Copyright © 2017年 Quanjun. All rights reserved.
//

import UIKit
import ObjectMapper
import RxDataSources

class AnchorModel: Mappable {

    var name = ""
    var pic51 = ""
    var pic74 = ""
    var live = 0
    var push = 0
    var focus = 0
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        name  <- map["name"]
        pic51 <- map["pic51"]
        pic74 <- map["pic74"]
        live  <- map["live"]
        push  <- map["push"]
        focus <- map["focus"]
    }
}


//MARK: SectionModel
struct AnchorSection {
    var items: [Item]
    
}

extension AnchorSection: SectionModelType {
    typealias Item = AnchorModel
    init(original: AnchorSection, items: [AnchorSection.Item]) {
        self = original
        self.items = items
    }
}
