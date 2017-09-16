//
//  RxTableViewCell.swift
//  RxSwift-Table-Collection
//
//  Created by iOS_Tian on 2017/9/15.
//  Copyright © 2017年 iOS_Tian. All rights reserved.
//

import UIKit

class RxTableViewCell: UITableViewCell {

    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
    var heroModel: HeroModel?{
        didSet{
            guard let model = heroModel  else { return }
            
            headerImage.image = UIImage(named: model.icon)
            titleLabel.text = model.name
            detailLabel.text = model.intro
        }
    }
    
}
