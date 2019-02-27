//
//  Copyright © 2017 Redbubble. All rights reserved.
//

import Foundation
import RealmSwift

class RedbubbleRealm {

    init() {
        let defaultPath = Realm.Configuration.defaultConfiguration.fileURL?.path ?? ""
        let alreadyExists = FileManager.default.fileExists(atPath: defaultPath)
// call setupRealm() here when using for first time.
        //setupRealm()
        if !alreadyExists {
            setupRealm()

        }
    }

    // Seeds the default realm database with some products, works and artists
    private func setupRealm() {
        
        let works: [RSWork] = [
            RSWork(id: "26527195", title: "Secret Garden", artistName: "Kristel Ann Raymundo", url: "https://ih0.redbubble.net/image.374633749.7195/flat,800x800,075,t.u4.jpg"),
            RSWork(id: "17712012", title: "Slothstronaut", artistName: "vigilanteartist", url: "https://ih0.redbubble.net/image.274633500.2012/flat,800x800,075,t.u9.jpg"),
            RSWork(id: "13962575", title: "Woof", artistName: "Sorbetto", url: "https://ih0.redbubble.net/image.45321048.2575/flat,800x800,075,t.u3.jpg"),
            RSWork(id: "21553035", title: "Cartoon Animals Cute Bear With Flowers", artistName: "peacockcards", url: "https://ih0.redbubble.net/image.208063452.3035/raf,750x1000,075,t,fafafa:ca443f4786.u2.jpg"),
            RSWork(id: "22358511", title: "Beware UFO", artistName: "yulia-rb", url: "https://ih1.redbubble.net/image.286243635.8511/raf,750x1000,075,t,101010:01c5ca27c6.u3.jpg"),
            RSWork(id: "11500293", title: "Barnabus", artistName: "Eric Fan", url: "https://ih0.redbubble.net/image.216726011.0293/raf,750x1000,075,t,e5d6c5:f62bbf65ee.u1.jpg"),
            RSWork(id: "16576752", title: "Pixel Hot Dog", artistName: "skywaker", url: "https://ih1.redbubble.net/image.101848749.6752/flat,1000x1000,075,f.u2.jpg"),
            RSWork(id: "21001600", title: "Tessellating Diatoms for skirts, duvets, notebooks, graphic tees etc", artistName: "Immy Smith (aka Cartoon Neuron)", url: "https://ih1.redbubble.net/image.248901769.1600/flat,800x800,075,t.u12.jpg"),
            RSWork(id: "24412850", title: "Over the Clouds", artistName: "Emma Hampton", url: "https://ih1.redbubble.net/image.300455186.2850/raf,750x1000,075,t,fafafa:ca443f4786.u2.jpg"),
            RSWork(id: "24970808", title: "Rad Shark", artistName: "vincenttrinidad", url: "https://ih0.redbubble.net/image.319280607.0808/raf,750x1000,075,t,101010:01c5ca27c6.u2.jpg"),
            RSWork(id: "21559379", title: "Bravocado!", artistName: "KayeBear", url: "https://ih0.redbubble.net/image.208228528.9379/flat,800x800,075,t.u6.jpg"),
            RSWork(id: "27338346", title: "CAT vs. PIZZA", artistName: "obinsun", url: "https://ih0.redbubble.net/image.403856775.8346/flat,750x1000,075,t.u1.jpg"),
            RSWork(id: "12120953", title: "Skate/Space", artistName: "Reno Nogaj", url: "https://ih1.redbubble.net/image.85551901.0953/flat,750x1000,070,f.2u1.jpg"),
            RSWork(id: "15981894", title: "Watercolor floral background with cute bird /2", artistName: "Gribanessa", url: "https://ih1.redbubble.net/image.134460970.1894/flat,800x800,075,t.u2.jpg"),
            RSWork(id: "9864862", title: "Birth of Stars", artistName: "filiskun", url: "https://ih1.redbubble.net/image.286486427.4862/flat,750x1000,075,t.u2.jpg"),
            ]

        let products: [RSProduct] = [
            RSProduct(id: "clock-17712012", workId: "17712012", productType: "Clock", url: "https://ih0.redbubble.net/image.274633496.2012/clkf,black,black,x600-pad,600x600,ffffff.u9.jpg"),
            RSProduct(id: "pillow-13962575", workId: "13962575", productType: "Throw Pillow", url: "https://ih1.redbubble.net/image.45321048.2575/tp,880x800,ffffff,t-pad,880x800,ffffff.6u3.jpg"),
            RSProduct(id: "pouch-21001600", workId: "21001600", productType: "Studio Pouch", url: "https://ih0.redbubble.net/image.210728433.1600/pouch,small,1080x-pad,1400x1000,f8f8f8.u12.jpg"),
            RSProduct(id: "sticker-24412850", workId: "24412850", productType: "Sticker", url: "https://ih0.redbubble.net/image.300455234.2850/sticker,600x500-bg,ffffff-pad,600x600,ffffff.u2.jpg"),
            RSProduct(id: "skin-22358511", workId: "22358511", productType: "Laptop Skin", url: "https://ih1.redbubble.net/image.232771634.8511/pd,x600,macbook_air_13-bg,ffffff.u3.jpg"),
            RSProduct(id: "tote-26527195", workId: "26527195", productType: "Tote Bag", url: "https://ih0.redbubble.net/image.374633749.7195/tb,1200x1200,small.2u4.jpg"),
            RSProduct(id: "blend-16576752", workId: "16576752", productType: "Tri-blend T-Shirt", url: "https://ih1.redbubble.net/image.101848745.6752/ra,triblend_tee,x2150,black_triblend,front-c,367,133,750,1000-bg,f8f8f8.lite-1u2.jpg"),
            RSProduct(id: "lwsweatshirt-9864862", workId: "9864862", productType: "Lightweight Sweatshirt", url: "https://ih0.redbubble.net/image.286486427.4862/lrs,x1900,heather_grey_lightweight_raglan_sweatshirt,front,man-c,310,130,750,1000-bg,f8f8f8.lite-1u2.jpg"),
            RSProduct(id: "iphone-11500293", workId: "11500293", productType: "iPhone Case", url: "https://ih0.redbubble.net/image.34715828.0293/mwo,1000x,iphone_7_snap-pad,750x1000,f8f8f8.lite-1u1.jpg"),
            RSProduct(id: "w-relaxed-21553035", workId: "21553035", productType: "Women's Relaxed Fit T-Shirt", url: "https://ih0.redbubble.net/image.208063452.3035/ra,relaxed_fit,x2000,fafafa:ca443f4786,front-c,295,163,750,1000-bg,f8f8f8.lite-1u2.jpg"),
            RSProduct(id: "sleeve-21559379", workId: "21559379", productType: "Laptop Sleeve", url: "https://ih1.redbubble.net/image.208228528.9379/ls,13inch,x999-bg,f8f8f8.2u6.jpg"),
            RSProduct(id: "lwhoodie-27338346", workId: "27338346", productType: "Lightweight Hoodie", url: "https://ih0.redbubble.net/image.403856775.8346/lh,x2200,grey_lightweight_hoodie,front,man-c,365,152,750,1000-bg,f8f8f8.lite-3u1.jpg"),
            RSProduct(id: "hoddie-12120953", workId: "12120953", productType: "Hoodie (Pullover)", url: "https://ih1.redbubble.net/image.85551901.0953/ra,unisex_hoodie_mens,x2100,oatmeal_heather,front-c,330,176,750,1000-bg,f8f8f8.lite-1u1.jpg"),
            RSProduct(id: "travelmug-15981894", workId: "15981894", productType: "Travel Mug", url: "https://ih1.redbubble.net/image.90141263.1894/mug,travel,x400,center-bg,ffffff.2u2.jpg"),
            RSProduct(id: "classic-t-24970808", workId: "24970808", productType: "Classic T-Shirt", url: "https://ih0.redbubble.net/image.319280607.0808/ra,classic_tee,x2100,101010:01c5ca27c6,front-c,355,131,750,1000-bg,f8f8f8.lite-1u2.jpg"),
            RSProduct(id: "mug-13153712", workId: "13153712", productType: "Mug", url: "https://ih0.redbubble.net/image.34811102.3712/mug,standard,x400,right-bg,ffffff.jpg"),
            RSProduct(id: "w-fitted-26447407", workId: "26447407", productType: "Women's Fitted T-Shirts", url: "https://ih0.redbubble.net/image.371703575.7407/ra,womens_tshirt,x1900,f89f2b:1617e563f0,front-c,265,125,750,1000-bg,f8f8f8.lite-1u3.jpg"),
            ]

        let artists: [RSArtist] = [
            RSArtist(name: "vigilanteartist", avatarImageUrl: "https://ih1.redbubble.net/avatar.437156.100x100.jpg"),
            RSArtist(name: "Immy Smith (aka Cartoon Neuron)", avatarImageUrl: "https://ih0.redbubble.net/avatar.1120605.100x100.jpg"),
            RSArtist(name: "Sorbetto", avatarImageUrl: "https://ih0.redbubble.net/avatar.530299.100x100.jpg"),
            RSArtist(name: "obinsun", avatarImageUrl: "https://ih1.redbubble.net/avatar.774445.100x100.jpg"),
            RSArtist(name: "vincenttrinidad", avatarImageUrl: "https://ih1.redbubble.net/avatar.559184.100x100.jpg"),
            RSArtist(name: "Emma Hampton", avatarImageUrl: "https://ih0.redbubble.net/avatar.974165.100x100.jpg"),
            RSArtist(name: "peacockcards", avatarImageUrl: "https://ih1.redbubble.net/avatar.822832.100x100.jpg"),
            RSArtist(name: "skywaker", avatarImageUrl: "https://ih0.redbubble.net/avatar.953346.100x100.jpg"),
            RSArtist(name: "filiskun", avatarImageUrl: "https://ih1.redbubble.net/avatar.1063275.100x100.jpg"),
            RSArtist(name: "Eric Fan", avatarImageUrl: "https://ih1.redbubble.net/avatar.297233.100x100.jpg"),
            RSArtist(name: "Kristel Ann Raymundo", avatarImageUrl: "https://ih0.redbubble.net/avatar.1148318.100x100.jpg"),
            RSArtist(name: "KayeBear", avatarImageUrl: "https://ih1.redbubble.net/avatar.969324.100x100.jpg"),
            RSArtist(name: "Reno Nogaj", avatarImageUrl: "https://ih0.redbubble.net/avatar.751570.100x100.jpg"),
            RSArtist(name: "yulia-rb", avatarImageUrl: "https://ih1.redbubble.net/avatar.510078.100x100.jpg")
            ]

        let realm = try! Realm()
        try! realm.write {

            for work in works {
                realm.add(work)
            }

            for product in products {
                print("realm \(product.id) - \(product.isFavorite)")
                realm.add(product)
            }

            for artist in artists {
                realm.add(artist)
            }
            
        }
        
    }
}
