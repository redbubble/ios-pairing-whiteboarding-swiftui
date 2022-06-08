//
//  Copyright © 2022 Redbubble. All rights reserved.
//

import SwiftUI

struct PriceView: View {
    
    var price: Price
    
    var body: some View {

        guard let currency = price.currencyCode, let amount = price.amount else {
            return Text("???")
        }
        
        let locale = NSLocale(localeIdentifier: currency)
        let symbol = locale.displayName(forKey: .currencySymbol, value: currency) ?? "$"
        let formatter = NumberFormatter()
        formatter.numberStyle = NumberFormatter.Style.currency
        formatter.currencySymbol = symbol
        let number = NSNumber(value: amount)
        
        return Text(formatter.string(from: number) ?? "")
            .foregroundColor(.gray)
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView(price: Price.mock())
    }
}
