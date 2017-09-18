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

    fileprivate lazy var bag : DisposeBag = DisposeBag()
 
    lazy var heroVariable: Variable<[HeroModel]> = {
        return Variable(self.getHeroData())
    }()
    
    var searchText: Observable<String>
    init(searchText: Observable<String>) {
        self.searchText = searchText
        
        self.searchText.subscribe(onNext: { (str: String) in
            let heros = self.getHeroData().filter({ (hero: HeroModel) -> Bool in
                //过滤
                if str.isEmpty { return true }
                //model是否包含搜索字符串
                return hero.name.contains(str)
            })
            self.heroVariable.value = heros
        }).addDisposableTo(bag)
    }
    
    deinit {
        print("----------------------")
    }
    
}

extension HeroViewModel {
    fileprivate func getHeroData(_ type: http, URLString : String, parameters : [String : Any]? = nil) -> [HeroModel]{
        // 1.获取路径
        let path = Bundle.main.path(forResource: "heros.plist", ofType: nil)!
        
        // 2.读取文件内容
        let dictArray = NSArray(contentsOfFile: path) as! [[String : Any]]
        
        // 3.遍历所有的字典并且转成模型对象
        
        return dictArray.map({ HeroModel(dict: $0) })
    }
}
