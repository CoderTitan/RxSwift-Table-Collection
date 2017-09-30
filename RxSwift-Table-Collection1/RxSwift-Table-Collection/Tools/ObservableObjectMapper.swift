//
//  ObservableObjectMapper.swift
//  RxSwiftMoyaDemo
//
//  Created by iOS_Tian on 2017/9/29.
//  Copyright © 2017年 iOS_Tian. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

/*
extension Observable {
    //1. 单个对象的处理
    public func mapObject<T: Mappable>(type: T.Type) -> Observable<T> {
        return self.map({ response in
            
            //1-1. 如果response是一个字典,就用ObjectMapper映射这个字典
            guard let dict = response as? [String: Any] else {
                //1-2. 如果不是字典就抛出一个错误
                throw NetworkRequestState.jsonError
            }
            
            //2. 返回模型数组
            return Mapper<T>().map(JSON: dict)!
        })
    }
    
    //2. 对象数组的处理
    public func mapObjectArray<T: Mappable>(type: T.Type) -> Observable<[T]> {
        return self.map({ response in
            
            //2-0. 先判断返回类型是不是一个对象
            guard let array = response as? [String: Any] else {
                throw NetworkRequestState.jsonError
            }
            
            //2-1. 判断返回类型是不是一个对象
            guard let anchors = array["message"] as? [String: Any] else {
                throw NetworkRequestState.jsonError
            }
            
            //2-1. 如果response是一个字典数组,就用ObjectMapper映射这个数组
            guard let dictArr = anchors["anchors"] as? [[String: Any]] else {
                //2-2. 如果不是字典就抛出一个错误
                throw NetworkRequestState.jsonError
            }
            
            //3. 返回模型数组
            return Mapper<T>().mapArray(JSONArray: dictArr)
        })
    }
}



//请求错误显示信息
enum NetworkRequestState: String {
    case jsonError = "解析错误"
    case OtherError
}

extension NetworkRequestState : Error {}
*/

