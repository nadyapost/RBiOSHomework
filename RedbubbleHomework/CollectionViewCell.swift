//
//  CollectionViewCell.swift
//  RedbubbleHomework
//
//  Created by Nadya Postriganova on 20/2/19.
//  Copyright © 2019 Redbubble. All rights reserved.
//

import UIKit
import RealmSwift

class CollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    var tap: UITapGestureRecognizer!
    var product: RSProduct!

    
    @IBOutlet weak var artworksImageView: UIImageView!
    
    @IBOutlet weak var heartImage: UIImageView!


    func commonInit(product: RSProduct) {
// Set boarder colour for the cell.
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.product = product
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
        
        self.heartImage.image = product.isFavorite ? UIImage(named: "icon-heart-filled") : UIImage(named: "icon-heart")
    }
    
    @objc func handleTap(_ sender: UIGestureRecognizer) {
        
        
        if tap.state == .ended && product.isFavorite == false {
            self.heartImage.image = UIImage(named:"icon-heart-filled")
            favoriveProduct(true)
        } else {
            self.heartImage.image = UIImage(named:"icon-heart")
            favoriveProduct(false)
        }
        
    }
    
    func favoriveProduct(_ favorite: Bool) {
        let realm = try! Realm()
        try! realm.write {
            product.isFavorite = favorite
        }
    }
    
}

    


