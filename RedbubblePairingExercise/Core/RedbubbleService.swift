//
//  Copyright © 2022 Redbubble. All rights reserved.
//

import Foundation
import Combine
import Alamofire

protocol RedbubbleServiceProtocol {
    func fetchExplore() -> AnyPublisher<DataResponse<HomeModel, NetworkError>, Never>
    func fetchWorkDetails(workId: String) -> AnyPublisher<DataResponse<WorkDetailsModel, NetworkError>, Never>
    func fetchProductDetails(productId: String) -> AnyPublisher<DataResponse<ProductDetailsModel, NetworkError>, Never>
}

class RedbubbleService {
    static let shared: RedbubbleServiceProtocol = RedbubbleService()
    private init() { }
}

extension RedbubbleService: RedbubbleServiceProtocol {
    func fetchExplore() -> AnyPublisher<DataResponse<HomeModel, NetworkError>, Never> {
        let url = URL(string: "https://take-home-test.herokuapp.com/bff/explore.json")!
        
        return AF.request(url, method: .get)
            .validate()
            .publishDecodable(type: HomeModel.self)
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(RedbubbleServiceError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchWorkDetails(workId: String) -> AnyPublisher<DataResponse<WorkDetailsModel, NetworkError>, Never> {
        let url = URL(string: "https://take-home-test.herokuapp.com/bff/workDetails/" + workId + ".json")!
        
        return AF.request(url, method: .get)
            .validate()
            .publishDecodable(type: WorkDetailsModel.self)
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(RedbubbleServiceError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
    func fetchProductDetails(productId: String) -> AnyPublisher<DataResponse<ProductDetailsModel, NetworkError>, Never> {
        let url = URL(string: "https://take-home-test.herokuapp.com/bff/productDetails.json")!
        
        return AF.request(url, method: .get)
            .validate()
            .publishDecodable(type: ProductDetailsModel.self)
            .map { response in
                response.mapError { error in
                    let backendError = response.data.flatMap { try? JSONDecoder().decode(RedbubbleServiceError.self, from: $0)}
                    return NetworkError(initialError: error, backendError: backendError)
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
