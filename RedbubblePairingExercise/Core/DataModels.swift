//
//  Copyright © 2022 Redbubble. All rights reserved.
//

import Foundation
import Alamofire

struct NetworkError: Error {
  let initialError: AFError
  let backendError: RedbubbleServiceError?
}

struct RedbubbleServiceError: Codable, Error {
    var status: String
    var message: String
}

enum ViewStatus {
    case loading
    case error
    case idle
}

struct HomeModel: Codable {
    var home: [HomeItemModel]
}

struct HomeItemModel: Identifiable, Codable {
    let type: String
    let id: String
    let title: String
    let safeForWork: Bool
    let thumbnailUrl: String
    let price: Price?
    let artist: String?
}

struct Artist: Identifiable, Codable {
    let id: String
    let username: String
    let description: String
    let avatarUrl: String
}

struct WorkDetailsModel: Codable {
    var workDetails: WorkModel?
}

struct WorkModel: Identifiable, Codable {
    let id: String
    let title: String
    let artist: Artist
    let safeForWork: Bool
    let imageUrl: String
    let shareUrl: String
    let availableProducts: [ProductModel]
}

struct ProductDetailsModel: Codable {
    var productDetails: ProductDetails?
}

struct ProductDetails: Codable {
    let id: String
    let title: String
    let artist: Artist
    let featureSet: FeatureSet
    let safeForWork: Bool
    let imageUrl: String
    let shareUrl: String
    let availableProducts: [ProductModel]
}

struct FeatureSet: Codable {
    let title: String
    let features: [String]
}

struct Price: Codable {
    let amount: Double?
    let currencyCode: String?
}

struct ProductModel: Identifiable, Codable {
    let id: String
    let price: Price
    let safeForWork: Bool
    let thumbnailUrl: String
    let title: String
}
