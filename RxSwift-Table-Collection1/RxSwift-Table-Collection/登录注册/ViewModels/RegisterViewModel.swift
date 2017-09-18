//
//  RegisterViewModel.swift
//  RxSwift-Table-Collection
//
//  Created by iOS_Tian on 2017/9/16.
//  Copyright © 2017年 Quanjun. All rights reserved.
//

import UIKit
import RxSwift

class RegisterViewModel {
    
    var username = Variable("")
    var password = Variable("")
    var repeatPassword = Variable("")
    
    var usernameObserable: Observable<Result>
    var passwordObserable: Observable<Result>
    var repeatPassObserable: Observable<Result>
    var registerBtnObserable: Observable<Bool>
    
    
    init(){
        //检测账号
        usernameObserable = username.asObservable().map({ (username) -> Result in
            return InputValidator.validateUserName(username)
        })
        
        //检测密码
        passwordObserable = password.asObservable().map({ (password) -> Result in
            return InputValidator.validatePassword(password)
        })
        
        //检测密码和重置密码
        repeatPassObserable = Observable.combineLatest(password.asObservable(), repeatPassword.asObservable(), resultSelector: { (password, repeatPassword) -> Result in
            return InputValidator.validateRepeatPassword(password, repeatPassword)
        })
        
        //检测注册是否成功
        registerBtnObserable = Observable.combineLatest(usernameObserable, passwordObserable, repeatPassObserable, resultSelector: { (username, password, repeatPassword) -> Bool in
            return InputValidator.validateRegisterSUccess(username, password, repeatPassword).isValid
        })
    }
}
