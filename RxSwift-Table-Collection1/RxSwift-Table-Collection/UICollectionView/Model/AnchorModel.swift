//
//  AnchorModel.swift
//  GYJTV
//
//  Created by 田全军 on 2017/7/20.
//  Copyright © 2017年 Quanjun. All rights reserved.
//

import UIKit

class AnchorModel: NSObject {

    var roomid : Int = 0
    var name : String = ""
    var pic51 : String = ""
    var pic74 : String = ""
    var live : Int = 0 
    var push : Int = 0 
    var focus : Int = 0 
    
    var isEvenIndex : Bool = false

    
    init(dic : [String : Any]) {
        super.init()
        
        name = dic["name"] as? String ?? ""
        pic51 = dic["pic51"] as? String ?? ""
        pic74 = dic["pic74"] as? String ?? ""
        focus = dic["focus"] as? Int ?? 0

    }
}
