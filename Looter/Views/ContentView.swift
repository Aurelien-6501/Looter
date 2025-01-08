import SwiftUI

import SwiftUI

struct ContentView: View {
    @State private var selectedFeature: LooterFeature = .loot

    var body: some View {
        TabView(selection: $selectedFeature) {
            LootView()
                .tabItem {
                    Label("Mes Loots", systemImage: "bag.fill")
                }
                .tag(LooterFeature.loot)

            WishListView()
                .tabItem {
                    Label("Wishlist", systemImage: "star.fill")
                }
                .tag(LooterFeature.wishList)

            ProfileView()
                .tabItem {
                    Label("Profil", systemImage: "person.fill")
                }
                .tag(LooterFeature.profile)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
