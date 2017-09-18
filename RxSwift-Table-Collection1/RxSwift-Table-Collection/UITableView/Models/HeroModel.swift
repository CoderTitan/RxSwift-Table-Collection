//
//  HeroModel.swift
//  RxSwift-Table-Collection
//
//  Created by iOS_Tian on 2017/9/15.
//  Copyright © 2017年 iOS_Tian. All rights reserved.
//

import UIKit


class HeroModel: NSObject {

    var name : String = ""
    var icon : String = ""
    var intro : String = ""
    
    init(dict : [String : Any]) {
        super.init()
        
        name = dict["name"] as? String ?? ""
        icon = dict["icon"] as? String ?? ""
        intro = dict["intro"] as? String ?? ""

    }

}
