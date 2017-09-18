//
//  RegisterViewController.swift
//  RxSwift-Table-Collection
//
//  Created by iOS_Tian on 2017/9/16.
//  Copyright © 2017年 Quanjun. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var usernameHintLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordHintLabel: UILabel!
    @IBOutlet weak var passwordRepeatTextField: UITextField!
    @IBOutlet weak var passwordRepeatLabel: UILabel!
    
    @IBOutlet weak var registerBtn: UIButton!
    
    fileprivate lazy var bag : DisposeBag = DisposeBag()
    fileprivate lazy var registerVM = RegisterViewModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "注册"
        
        //1. 账号判断逻辑
        //1-1. 检测账号
        usernameTextField.rx.text
            .orEmpty // 将String? 类型转为String型
            .bindTo(registerVM.username)
            .addDisposableTo(bag)
        
        //1-2. 根据账号监听提示字体的状态
        registerVM.usernameObserable
            .bindTo(usernameHintLabel.rx.validationResult)
            .addDisposableTo(bag)
        
        //1-3. 根据账号监听密码输入框的状态
        registerVM.usernameObserable
            .bindTo(passwordTextField.rx.enableResult)
            .addDisposableTo(bag)
        
        
        
        //2. 密码判断逻辑
        passwordTextField.rx.text.orEmpty.bindTo(registerVM.password).addDisposableTo(bag)
        
        //2-1. 根据密码字符串监听密码提示信息的显示状态
        registerVM.passwordObserable.bindTo(passwordHintLabel.rx.validationResult).addDisposableTo(bag)
        
        //2-2.根据密码字符串监听密码重复密码输入框的状态
        registerVM.passwordObserable.bindTo(passwordRepeatTextField.rx.enableResult).addDisposableTo(bag)
        
        
        
        //3. 重复输入密码逻辑
        passwordRepeatTextField.rx.text.orEmpty.bindTo(registerVM.repeatPassword).addDisposableTo(bag)
        
        //3-1. 根据重复密码字符串监听密码提示信息的显示状态
        registerVM.repeatPassObserable.bindTo(passwordRepeatLabel.rx.validationResult).addDisposableTo(bag)
        
        
        
        //4. 处理按钮点击事件
        //4-1. 按钮的状态(是否可点)
        registerVM.registerBtnObserable.bindTo(registerBtn.rx.isEnabled).addDisposableTo(bag)
        registerVM.registerBtnObserable.bindTo(registerBtn.rx.backColorResult).addDisposableTo(bag)

        //4-2. 监听注册按钮的点击
        registerBtn.rx.tap.subscribe({ (_) in
            self.navigationController?.popViewController(animated: true)
        }).addDisposableTo(bag)
        
    }

}
