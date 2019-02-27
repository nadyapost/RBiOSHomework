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


    func commonInit(product: RSProduct) {
// Set boarder colour for the cell.
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
//Initialize the tap gesture with an action called doubleTapped.
        tap = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
        tap.numberOfTapsRequired = 2
        self.addGestureRecognizer(tap)
        
        
        let imageUrl: URL = URL(string: product.imageUrl)!
        
        // Start background thread so that image loading does not make app unresponsive.
        DispatchQueue.global(qos: .userInitiated).async {
            let imageData: NSData = NSData(contentsOf: imageUrl)!
            // When from background thread, UI needs to be updated on main queue.
            DispatchQueue.main.async {
                let image = UIImage(data: imageData as Data)
                self.artworksImageView.image = image
            }
        }
        
        //        cell.heartImage.image = UIImage(named: "icon-heart")
        self.heartImage.image = product.isFavorite ? UIImage(named: "icon-heart-filled") : UIImage(named: "icon-heart")
    }
    @objc func handleTap(_ sender: UIGestureRecognizer) {

        if tap.state == .ended && heartImage.image == UIImage(named:"icon-heart") {
            self.heartImage.image = UIImage(named:"icon-heart-filled")
        } else {
            self.heartImage.image = UIImage(named:"icon-heart")

        }
    }
    
}

    


