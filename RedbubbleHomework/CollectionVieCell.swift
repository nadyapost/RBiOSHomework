//
//  CollectionViewCell.swift
//  RedbubbleHomework
//
//  Created by Nadya Postriganova on 20/2/19.
//  Copyright © 2019 Redbubble. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    var tap: UITapGestureRecognizer!
    

    @IBOutlet weak var artworksImageView: UIImageView!
    
    @IBOutlet weak var heartImage: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    
    }

    private func commonInit () {
        // Set boarder colour for the cell.
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        //Initialize the tap gesture with an action called doubleTapped.
        tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.numberOfTapsRequired = 2
        self.addGestureRecognizer(tap)
    }
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        
        if tap.state == .ended && self.heartImage.image == UIImage(named:"icon-heart") {
            self.heartImage.image = UIImage(named:"icon-heart-filled")
        } else {
            self.heartImage.image = UIImage(named:"icon-heart")
        }
    }
}

    


