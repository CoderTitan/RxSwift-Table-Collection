//
//  RxCollectionViewCell.swift
//  RxSwift-Table-Collection
//
//  Created by iOS_Tian on 2017/9/19.
//  Copyright © 2017年 Quanjun. All rights reserved.
//

import UIKit
import Kingfisher

class RxCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var headImage: UIImageView!
    @IBOutlet weak var focusLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var anchorModel: AnchorModel? {
        didSet{
            guard let model = anchorModel else { return }
            nameLabel.text = model.name
            focusLabel.text = "\(model.focus)人关注"
            headImage.kf.setImage(with: URL(string: model.pic51))
        }
    }
}
