//
//  WishListView.swift
//  Looter
//
//  Created by Aurelien Fillion on 08/01/2025.
//

import SwiftUI

struct WishListView: View {
    var body: some View {
        VStack {
            Text("Votre Wishlist")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            Spacer()
        }
    }
}

struct WishListView_Previews: PreviewProvider {
    static var previews: some View {
        WishListView()
    }
}
