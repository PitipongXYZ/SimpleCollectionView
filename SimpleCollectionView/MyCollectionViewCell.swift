	//
//  MyCollectionViewCell.swift
//  SimpleCollectionView
//
//  Created by Manao on 4/25/16.
//  Copyright © 2016 Pitipong. All rights reserved.
//

import UIKit
    
class MyCollectionViewCell: UICollectionViewCell {
        
    @IBOutlet weak var imgCover: UIImageView!
    
    
//    override func prepareForReuse() {
//    
//        self.hidden = true
//    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.hidden = false
    }
    
}