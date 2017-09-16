//
//  ViewController.swift
//  RxSwift-Table-Collection
//
//  Created by 田全军 on 2017/9/15.
//  Copyright © 2017年 Quanjun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func loginAction(_ sender: Any) {
        navigationController?.pushViewController(LoginViewController(), animated: true)
    }
    

    @IBAction func tableViewAction(_ sender: Any) {
        navigationController?.pushViewController(RxTableViewController(), animated: true)
    }
    
    @IBAction func collectionViewAction(_ sender: Any) {
        navigationController?.pushViewController(RxCollectionViewController(), animated: true)
    }


}

