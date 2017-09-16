//
//  RxTableViewController.swift
//  RxSwift-Table-Collection
//
//  Created by iOS_Tian on 2017/9/15.
//  Copyright © 2017年 iOS_Tian. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

fileprivate let kTableCell: String = "cell"

class RxTableViewController: UITableViewController {

    fileprivate lazy var bag = DisposeBag()
    fileprivate lazy var heroVM =  HeroViewModel()
    fileprivate lazy var heroArr = [HeroModel]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UITableViewController"
        
        tableView.rowHeight = 50
        tableView.register(UINib(nibName: "RxTableViewCell", bundle: nil), forCellReuseIdentifier: kTableCell)
        
        
        
    
        
        
    }
    
    
    
}
