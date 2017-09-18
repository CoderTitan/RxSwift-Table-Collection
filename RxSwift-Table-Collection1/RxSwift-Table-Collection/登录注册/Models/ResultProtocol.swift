//
//  ResultProtocol.swift
//  RxSwift-Table-Collection
//
//  Created by iOS_Tian on 2017/9/16.
//  Copyright © 2017年 Quanjun. All rights reserved.
//
//用于判断和处理字体的文字颜色和状态

import UIKit
import RxSwift
import RxCocoa

enum Result {
    case success(message: String)
    case failure(message: String)
}

extension Result {
    //字体颜色
    var textColor: UIColor {
        switch self {
        case .success:
            return UIColor.black
        default:
            return UIColor.red
        }
    }
    
    //描述字体
    var description: String {
        switch self {
        case let .success(message):
            return message
        case let .failure(message):
            return message
        }
    }
    
    //返回是否成功
    var isValid : Bool {
        switch self {
        case .success:
            return true
        default:
            return false
        }
    }
}


// MARK: 创建UILabel的监听者,改变字体和颜色
extension Reactive where Base: UILabel {
    var validationResult: UIBindingObserver<Base, Result> {
        return UIBindingObserver(UIElement: base, binding: { (label, result) in
            label.textColor = result.textColor
            label.text = result.description
        })
    }
}


// MARK: 创建UITextField的监听者,是否可编辑
extension Reactive where Base: UITextField {
    var enableResult: UIBindingObserver<Base, Result> {
        return UIBindingObserver(UIElement: base, binding: { (textField, result) in
            textField.isEnabled = result.isValid
        })
    }
}


//MARK: 创建UIButton的监听者,是否可编辑下的背景颜色
extension Reactive where Base: UIButton {
    var backColorResult: UIBindingObserver<Base, Bool> {
        return UIBindingObserver(UIElement: base, binding: { (button, result) in
            button.setTitleColor(UIColor.white, for: .normal)
            button.backgroundColor = result ? UIColor.red : UIColor.lightGray
        })
    }
}
