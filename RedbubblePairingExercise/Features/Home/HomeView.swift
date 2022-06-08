//
//  Copyright © 2022 Redbubble. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel = HomeViewModel()
    
    let columns = [
        GridItem(.adaptive(minimum: 180))
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                switch viewModel.status {
                case .loading:
                    LoadingView()
                case .idle:
                    homeItems(items: viewModel.items)
                case .error:
                    ErrorView(error: viewModel.errorMessage)
                }
            }
            .navigationTitle("") // hides back button text on next screen
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Image("rb-brand")
                    }
                }
            }
            .onAppear {
                viewModel.getExplore()
            }
        }
    }
    
    func homeItems(items: [HomeItemModel]) -> some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(items, id: \.id) { item in
                if item.type == "WORK" {
                    NavigationLink(destination: WorkView(workId: item.id)) {
                        HomeItemView(item: item)
                    }
                } else {
                    HomeItemView(item: item)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
