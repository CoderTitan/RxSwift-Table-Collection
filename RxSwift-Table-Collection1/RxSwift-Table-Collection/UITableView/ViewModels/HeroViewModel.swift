//
//  HeroViewModel.swift
//  RxSwift-Table-Collection
//
//  Created by iOS_Tian on 2017/9/15.
//  Copyright © 2017年 iOS_Tian. All rights reserved.
//

import UIKit
import RxSwift

class HeroViewModel {

    var heroObserable: Variable<[HeroModel]> = {
        let path = Bundle.main.path(forResource: "heros", ofType: "plist")
        let dataArray = NSArray(contentsOfFile: path!) as! [[String: Any]]
        var heros: [HeroModel] = [HeroModel]()
        heros += dataArray.map({ HeroModel(dict: $0) })
        return Variable(heros)
    }()
    
}
