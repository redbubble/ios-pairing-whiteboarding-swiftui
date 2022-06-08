//
//  MockService.swift
//  RedbubblePairingExerciseTests
//
//  Created by Ross Richard on 25/7/2022.
//

import Foundation
import Combine
import Alamofire

@testable import RedbubblePairingExercise

class MockService: RedbubbleServiceProtocol {
    
    var publishError = false
    let networkError = NetworkError(initialError: AFError.explicitlyCancelled, backendError: nil)
        
    init(publishError: Bool = false) {
        self.publishError = publishError
    }
    
    func loadData(filename: String) -> Data? {
        guard let mockBundle = Bundle(for: MockService.self).path(forResource: "MockData", ofType: "bundle") else {
            return nil
        }

        let url = Bundle(path: mockBundle)!.url(forResource: filename, withExtension: "json")!
        return try! Data(contentsOf: url)
    }
    
    func fetchExplore() -> AnyPublisher<DataResponse<HomeModel, NetworkError>, Never> {

        var result: Result<HomeModel, NetworkError>
        
        if publishError {
            result = Result<HomeModel, NetworkError>.failure(networkError)
        } else {
            let data = loadData(filename: "explore")!
            let homeModel = try! JSONDecoder().decode(HomeModel.self, from: data)
            
            result = Result<HomeModel, NetworkError>.success(homeModel)
        }
        
        let response = DataResponse<HomeModel, NetworkError>(
            request: nil,
            response: nil,
            data: nil,
            metrics: nil,
            serializationDuration: .infinity,
            result: result
        )
                    
        return Just(response).eraseToAnyPublisher()
    }
    
    func fetchWorkDetails(workId: String) -> AnyPublisher<DataResponse<WorkDetailsModel, NetworkError>, Never> {
        
        let response = DataResponse<WorkDetailsModel, NetworkError>(
            request: nil,
            response: nil,
            data: nil,
            metrics: nil,
            serializationDuration: .infinity,
            result: .failure(networkError)
        )
        
        return Just(response).eraseToAnyPublisher()
    }
    
    func fetchProductDetails(productId: String) -> AnyPublisher<DataResponse<ProductDetailsModel, NetworkError>, Never> {
        
        let response = DataResponse<ProductDetailsModel, NetworkError>(
            request: nil,
            response: nil,
            data: nil,
            metrics: nil,
            serializationDuration: .infinity,
            result: .failure(networkError)
        )
        
        return Just(response).eraseToAnyPublisher()
    }
}
