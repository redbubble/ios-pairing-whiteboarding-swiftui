//
//  Copyright © 2022 Redbubble. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct WorkView: View {
    
    @ObservedObject var viewModel: WorkViewModel
    
    let columns = [
        GridItem(.adaptive(minimum: 180))
    ]
    
    init(workId: String) {
        self.viewModel = WorkViewModel(workId: workId)
    }
    
    var body: some View {
        ZStack {
            switch viewModel.status {
            case .loading:
                LoadingView()
            case .idle:
                if let item = viewModel.workDetails.workDetails {
                    workDetails(item: item)
                } else {
                    EmptyView()
                }
            case .error:
                ErrorView(error: viewModel.errorMessage)
            }
        }
        .onAppear {
            viewModel.getWorkDetails()
        }
    }
    
    func workDetails(item: WorkModel) -> some View {
        ScrollView {
            LazyVStack(alignment: .leading) {
                WebImage(url: URL(string: item.imageUrl))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaledToFit()
                artistView(artist: item.artist)
                Text("Available on")
                    .font(.title2)
                    .padding()
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(item.availableProducts, id: \.id) { product in
                        NavigationLink(destination: ProductView(productId: product.id)) {
                            productItemView(product: product)
                        }
                    }
                }
            }
        }
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func artistView(artist: Artist) -> some View {
        HStack {
            WebImage(url: URL(string: artist.avatarUrl))
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60.0, height: 60.0)
                .scaledToFit()
                .cornerRadius(30.0)
            VStack(alignment: .leading, spacing: 4) {
                Text(artist.username)
                    .font(.title2)
                Text(artist.description)
                    .font(.body)
            }
            Spacer()
            
        }
        .padding()
    }
    
    func productItemView(product: ProductModel) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            RoundedImageView(url: product.thumbnailUrl)
            Text(product.title)
                .font(.title2)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
                .padding(.bottom, 2)
            PriceView(price: product.price)
        }
        .padding()
    }
}

struct WorkView_Previews: PreviewProvider {
    static var previews: some View {
        WorkView(workId: "326210")
    }
}
