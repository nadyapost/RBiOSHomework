//
//  Copyright © 2017 Redbubble. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let realm = try! Realm()
    var products: Results<RSProduct>!


    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        loadData()
        
// Set Delegates.
        collectionView.dataSource = self
        collectionView.delegate = self
        
// Set Layout for the cell.
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets.init(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: ((self.collectionView.frame.size.width - 20)/2), height: (self.collectionView.frame.size.height/4))
    }
    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//
//    }
    
    func loadData() {

        products = realm.objects(RSProduct.self)
        
        collectionView.reloadData()
    }
    
// Set Datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
      
        let product = products[indexPath.item].imageUrl
        
        let imageUrl: URL = URL(string: product)!
        
        
// Start background thread so that image loading does not make app unresponsive.
        DispatchQueue.global(qos: .userInitiated).async {

            let imageData: NSData = NSData(contentsOf: imageUrl)!

// When from background thread, UI needs to be updated on main queue.
            DispatchQueue.main.async {
                let image = UIImage(data: imageData as Data)
                cell.artworksImageView.image = image

            }
        }
        
// Set boarders colour for the cell.
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.5
        
        return cell
    }
    
// Selected cell highlight set.
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.gray.cgColor
        cell?.layer.borderWidth = 2
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        cell?.layer.borderColor = UIColor.lightGray.cgColor
        cell?.layer.borderWidth = 0.5
    }
    
}
