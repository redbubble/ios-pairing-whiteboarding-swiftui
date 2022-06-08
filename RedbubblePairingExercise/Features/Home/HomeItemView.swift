//
//  Copyright © 2022 Redbubble. All rights reserved.
//

import SwiftUI

struct HomeItemView: View {
    
    var item: HomeItemModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RoundedImageView(url: item.thumbnailUrl)
            Text(item.title)
                .font(.title2)
                .foregroundColor(.black)
                .multilineTextAlignment(.leading)
            if (item.type == "WORK") {
                Text(item.artist ?? "")
                    .font(.body)
                    .foregroundColor(.gray)
            } else {
                PriceView(price: item.price!)
            }
        }
        .padding()
    }
}

struct HomeItemView_Previews: PreviewProvider {
    static var previews: some View {
        HomeItemView(item: HomeItemModel.mockWork())
        HomeItemView(item: HomeItemModel.mockProduct())
    }
}
