//
//  Copyright © 2022 Redbubble. All rights reserved.
//

import SwiftUI

struct ProductView: View {
    
    @ObservedObject var viewModel: ProductViewModel
    
    init(productId: String) {
        self.viewModel = ProductViewModel(productId: productId)
    }
    
    var body: some View {
        ZStack {
            switch viewModel.status {
            case .loading:
                LoadingView()
            case .idle:
                if let item = viewModel.productDetails.productDetails {
                    VStack {
                        Text("TODO")
                            .font(.title)
                            .padding()
                    }
                    .navigationTitle(item.title)
                    .navigationBarTitleDisplayMode(.inline)
                } else {
                    EmptyView()
                }
            case .error:
                ErrorView(error: viewModel.errorMessage)
            }
        }
        .onAppear {
            viewModel.getProductDetails()
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView(productId: "326210_grouse-chips_TR8D9")
    }
}
