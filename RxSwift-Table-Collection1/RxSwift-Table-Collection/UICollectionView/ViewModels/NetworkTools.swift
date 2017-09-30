//
//  NetworkTools.swift
//  NetworkTools
//
//  Created by 田全军 on 2017/9/30.
//  Copyright © 2017年 Quanjun. All rights reserved.
//

import UIKit
import Moya
import RxSwift


//网络请求
let netTool = RxMoyaProvider<JunNetworkTool>()
let bag = DisposeBag()


//请求枚举类型
enum JunNetworkTool {
    
    case getNewList
    case getHomeList(page: Int)
}

//请求参数
extension JunNetworkTool: TargetType {
    
    //统一基本的url
    var baseURL: URL {
        return (URL(string: "http://qf.56.com/home/v4/moreAnchor.ios"))!
    }
    
    //path字段会追加至baseURL后面
    var path: String {
        return ""
    }
    
    //请求的方式
    var method: Moya.Method {
        return .get
    }
    
    //参数编码方式(这里使用URL的默认方式)
    var parameterEncoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    //用于单元测试
    var sampleData: Data {
        return "getList".data(using: .utf8)!
    }
    
    //将要被执行的任务(请求：request 下载：upload 上传：download)
    var task: Task {
        return .request
    }
    
    //请求参数(会在请求时进行编码)
    var parameters: [String: Any]? {
        switch self {
        case .getHomeList(let index):
            return ["index": index]
        default:
            return ["index": 1]
        }
    }
    
    //是否执行Alamofire验证，默认值为false
    var validate: Bool {
        return false
    }
}


//请求返回状态
enum NetworkRequestState: Int {
    case success = 200
    case error
}

