//
//  Copyright © 2017 Redbubble. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    let realm = try! Realm()
    var products: Results<RSProduct>!
    

    //var favorites: Results<Favorite>!



    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var imageTap: UITapGestureRecognizer!
    
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
    
    func loadData() {

        products = realm.objects(RSProduct.self)
        //favorites = realm.objects(Favorite.self)
        collectionView.reloadData()
    }

 
// Set Datasource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        let product = products[indexPath.item]
        
        cell.commonInit(product: product)
       
        return cell
    }
 


}

