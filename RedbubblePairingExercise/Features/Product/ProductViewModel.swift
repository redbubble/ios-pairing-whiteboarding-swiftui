//
//  Copyright © 2022 Redbubble. All rights reserved.
//

import Foundation
import Combine

class ProductViewModel: ObservableObject {
    
    @Published var productDetails =  ProductDetailsModel()
    @Published var status: ViewStatus = .idle
    @Published var errorMessage: String = ""

    private var cancellableSet: Set<AnyCancellable> = []
    private var productId: String
    
    var service: RedbubbleServiceProtocol

    init(service: RedbubbleServiceProtocol = RedbubbleService.shared, productId: String) {
        self.service = service
        self.productId = productId
    }
    
    func getProductDetails() {
        status = .loading
        service.fetchProductDetails(productId: productId)
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    self.handleError(with: dataResponse.error!)
                    self.status = .error
                } else {
                    self.productDetails = dataResponse.value!
                    self.status = .idle
                }
            }.store(in: &cancellableSet)
    }
    
    func handleError(with error: NetworkError) {
        self.errorMessage = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
    }
}
