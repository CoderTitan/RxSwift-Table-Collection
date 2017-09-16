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
        usernameObserable = username.asObservable().map({ (password) -> Result in
            return InputValidator.validateUserName(password)
        })
        
        passwordObserable = password.asObservable().map({ (inputStr) -> Result in
            return InputValidator.validatePassword(inputStr)
        })
        
        repeatPassObserable = Observable.combineLatest(password.asObservable(), repeatPassword.asObservable(), resultSelector: { (password, repeatPassword) -> Result in
            return InputValidator.validateRepeatPassword(password, repeatPassword)
        })
        
        
        registerBtnObserable = Observable.combineLatest(usernameObserable, passwordObserable, repeatPassObserable, resultSelector: { (username, password, repeatPassword) -> Bool in
            return username.isValid && password.isValid && repeatPassword.isValid
        })
    }
}
