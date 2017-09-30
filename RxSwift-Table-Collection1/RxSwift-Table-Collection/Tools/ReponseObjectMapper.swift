//
//  ReponseObjectMapper.swift
//  RxSwift-Table-Collection
//
//  Created by iOS_Tian on 2017/9/29.
//  Copyright © 2017年 Quanjun. All rights reserved.
//

import Foundation
import RxSwift
import Moya
import ObjectMapper

// MARK: - Json -> Model
extension Response {
    // 1. 将Json解析为单个Model
    public func mapObject<T: BaseMappable>(_ type: T.Type) throws -> T {
        //1-1. 如果mapJSON()是一个字典,就用ObjectMapper映射这个字典
        guard let object = Mapper<T>().map(JSONObject: try mapJSON()) else {
            throw MoyaError.jsonMapping(self)
        }
        
        //1-2. 返回映射的model
        return object
    }
    
    
    // 2. 将Json解析为多个Model，返回数组，对于不同的json格式需要对该方法进行修改
    public func mapObjectArray<T: BaseMappable>(_ type: T.Type) throws -> [T] {
        //2-0. 先判断返回类型是不是一个字典
        guard let array = try mapJSON() as? [String: Any] else {
            throw MoyaError.jsonMapping(self)
        }
        
        //2-1. 判断返回类型是不是一个对象
        guard let anchors = array["message"] as? [String: Any] else {
            throw MoyaError.jsonMapping(self)
        }
        
        //2-1. 如果response是一个字典数组,就用ObjectMapper映射这个数组
        guard let dictArr = anchors["anchors"] as? [[String: Any]] else {
            //2-2. 如果不是字典就抛出一个错误
            throw MoyaError.jsonMapping(self)
        }
        
        //2-3. 返回model数组
        return Mapper<T>().mapArray(JSONArray: dictArr)
    }
}


// MARK: - Json -> Observable<Model>
extension ObservableType where E == Response {
    // 1. 将Json解析为Observable<Model>(单个model)
    public func mapObject<T: BaseMappable>(_ type: T.Type) -> Observable<T> {
        return flatMap({ (response) -> Observable<T> in
            return Observable.just(try response.mapObject(T.self))
        })
    }
    
    //2.将Json解析为Observable<[Model]>(数组)
    public func mapObjectArray<T: BaseMappable>(_ type: T.Type) -> Observable<[T]> {
        return flatMap({ (response) -> Observable<[T]> in
            return Observable.just(try response.mapObjectArray(T.self))
        })
    }
}
