//
//  Copyright © 2022 Redbubble. All rights reserved.
//

import Foundation
import Combine

class WorkViewModel: ObservableObject {
    
    @Published var workDetails =  WorkDetailsModel()
    @Published var status: ViewStatus = .idle
    @Published var errorMessage: String = ""

    private var cancellableSet: Set<AnyCancellable> = []
    private var workId: String
    
    var service: RedbubbleServiceProtocol

    init(service: RedbubbleServiceProtocol = RedbubbleService.shared, workId: String) {
        self.service = service
        self.workId = workId
    }
    
    func getWorkDetails() {
        status = .loading
        service.fetchWorkDetails(workId: workId)
            .sink { (dataResponse) in
                if dataResponse.error != nil {
                    self.handleError(with: dataResponse.error!)
                    self.status = .error
                } else {
                    self.workDetails = dataResponse.value!
                    self.status = .idle
                }
            }.store(in: &cancellableSet)
    }
    
    func handleError(with error: NetworkError) {
        self.errorMessage = error.backendError == nil ? error.initialError.localizedDescription : error.backendError!.message
    }
}
