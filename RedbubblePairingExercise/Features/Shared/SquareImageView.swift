//
//  Copyright © 2022 Redbubble. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct SquareImageView: View {
    
    var url: String
    
    var body: some View {
        WebImage(url: URL(string: url))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaledToFit()
    }
}

struct SquareImageView_Previews: PreviewProvider {
    static var previews: some View {
        SquareImageView(url: "https://ih0.redbubble.net/image.680923039.6210/flat,1000x,075,f.jpg")
    }
}
