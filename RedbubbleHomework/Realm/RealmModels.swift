//
//  Copyright © 2017 Redbubble. All rights reserved.
//

import Foundation
import RealmSwift

class RSProduct: Object {
    dynamic var id: String = ""
    dynamic var workId: String = ""
    dynamic var productType: String = ""
    dynamic var imageUrl: String = ""

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
    dynamic var id: String = ""
    dynamic var title: String = ""
    dynamic var imageUrl: String = ""
    dynamic var artistName: String = ""

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
    dynamic var name: String = ""
    dynamic var avatarImageUrl: String = ""

    convenience init(name: String, avatarImageUrl: String) {
        self.init()
        self.name = name
        self.avatarImageUrl = avatarImageUrl
    }
}
