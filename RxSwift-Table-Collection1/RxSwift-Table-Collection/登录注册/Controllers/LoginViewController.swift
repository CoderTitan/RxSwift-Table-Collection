//
//  LoginViewController.swift
//  RxSwift-Table-Collection
//
//  Created by iOS_Tian on 2017/9/16.
//  Copyright © 2017年 Quanjun. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!

    fileprivate lazy var bag : DisposeBag = DisposeBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 1.设置导航栏
        setupNavigationBar()
        
        // 2.监听账号密码输入是否正确
        setupInputView()
        
        // 3.设置登录按钮的状态
        setupLoginButton()
    }

}

extension LoginViewController {
    fileprivate func setupNavigationBar() {
        navigationItem.title = "登录"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "退出", style: .plain, target: self, action: #selector(exitItemClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(registerItemClick))
    }
    
    @objc fileprivate func exitItemClick() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc fileprivate func registerItemClick() {
        let registerVc = RegisterViewController()
        navigationController?.pushViewController(registerVc, animated: true)
    }
    
    fileprivate func setupInputView() {
        

        
        
        
    }
    
    fileprivate func setupLoginButton() {
    }
}
