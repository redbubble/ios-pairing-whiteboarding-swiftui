//
//  Copyright © 2022 Redbubble. All rights reserved.
//

import SwiftUI

struct ErrorView: View {
    var error: String
    
    var body: some View {
        VStack {
            Spacer()
            Text("Oh Snap")
                .font(.title)
            Text(error)
                .font(.body)
            Spacer()
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "Something bad happened")
    }
}
