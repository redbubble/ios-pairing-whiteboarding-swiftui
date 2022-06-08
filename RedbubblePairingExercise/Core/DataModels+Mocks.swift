//
//  Copyright © 2022 Redbubble. All rights reserved.
//

import Foundation

extension HomeItemModel {
    static func mockWork() -> HomeItemModel {
        return HomeItemModel(
            type: "WORK",
            id: "123",
            title: "pigs love watermelon",
            safeForWork: true,
            thumbnailUrl: "https://ih0.redbubble.net/image.680923039.6210/flat,1000x,075,f.jpg",
            price: nil,
            artist: "natalietyler"
        )
    }
    static func mockProduct() -> HomeItemModel {
        return HomeItemModel(
            type: "PRODUCT",
            id: "39670936_beaut-razoo_6AQD3",
            title: "Sleeveless Top",
            safeForWork: true,
            thumbnailUrl: "https://ih1.redbubble.net/image.850857794.0936/ctkr,x1862,front,black-c,324,409,600,600-bg,f8f8f8.u2.jpg",
            price: Price(amount: 40.0, currencyCode: "AUD"),
            artist: "natalietyler"
        )
    }
}

extension Artist {
    static func mock() -> Artist {
        return Artist(
            id: "1338962",
            username: "natalietyler",
            description: "44 Designs",
            avatarUrl: "https://ih0.redbubble.net/avatar.72134.140x140.jpg"
        )
    }
}

extension ProductModel {
    static func mock() -> ProductModel {
        return ProductModel(
            id: "326210_cactus-bizzo_0S66D",
            price: Price.mock(),
            safeForWork: true,
            thumbnailUrl: "https://ih1.redbubble.net/image.680924446.6210/ssrco,classic_tee,mens,heather_grey,front_alt,square_product,600x600.u2.jpg",
            title: "Classic T-Shirt"
        )
    }
}

extension Price {
    static func mock() -> Price {
        return Price(
            amount: 23.55,
            currencyCode: "AUD"
        )
    }
}
