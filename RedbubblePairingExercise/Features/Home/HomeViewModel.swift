//
//  Copyright © 2022 Redbubble. All rights reserved.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var items = [HomeItemModel]()
    @Published var status: ViewStatus = .idle
    @Published var errorMessage: String = ""

    private var cancellableSet: Set<AnyCancellable> = []
    var service: RedbubbleServiceProtocol
    
    init(service: RedbubbleServiceProtocol = RedbubbleService.shared) {
        self.service = service
    }
    
    func getExplore() {
        status = .loading
        service.fetchExplore()
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    self.handleError(with: dataResponse.error!)
                    self.status = .error
                } else {
                    self.items = dataResponse.value!.home
                    self.status = .idle
                }
            }.store(in: &cancellableSet)
    }
    
    func handleError(with error: NetworkError) {
        self.errorMessage = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
    }
}
