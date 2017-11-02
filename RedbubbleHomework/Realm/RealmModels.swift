//
//  Copyright © 2017 Redbubble. All rights reserved.
//

import Foundation
import RealmSwift

class RSProduct: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var workId: String = ""
    @objc dynamic var productType: String = ""
    @objc dynamic var imageUrl: String = ""

    convenience init(id: String, workId: String, productType: String, url: String) {
        self.init()
        self.id = id
        self.workId = workId
        self.productType = productType
        self.imageUrl = url
    }

    override static func primaryKey() -> String? {
        return "id"
    }
}

class RSWork: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var artistName: String = ""

    convenience init(id: String, title: String, artistName: String, url: String) {
        self.init()
        self.id = id
        self.title = title
        self.imageUrl = url
        self.artistName = artistName
    }

    override static func primaryKey() -> String? {
        return "id"
    }
}

class RSArtist: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var avatarImageUrl: String = ""

    convenience init(name: String, avatarImageUrl: String) {
        self.init()
        self.name = name
        self.avatarImageUrl = avatarImageUrl
    }
}
