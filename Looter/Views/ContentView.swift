import SwiftUI

struct ContentView: View {
    @State private var loot: [LootItem] = [
        LootItem(quantity: 2, name: "Épée du Désespoir", type: .dagger, rarity: .legendary, attackStrength: 80, game: availableGames[0]),
        LootItem(quantity: 1, name: "Flamme", type: .fire, rarity: .uncommon, attackStrength: 45, game: availableGames[1]),
        LootItem(quantity: 1, name: "Arc Antique", type: .bow, rarity: .unique, attackStrength: 55, game: availableGames[2]),
        LootItem(quantity: 4, name: "Soin", type: .magic, rarity: .common, attackStrength: nil, game: availableGames[3]),
        LootItem(quantity: 4, name: "Talisman d'arsenal", type: .ring, rarity: .rare, attackStrength: 10, game: availableGames[4]),
        LootItem(quantity: 4, name: "Boost de vitesse", type: .wind, rarity: .common, attackStrength: 5, game: availableGames[0])
    ]
    
    @State private var showAddItemView = false

    var body: some View {
        NavigationStack {
            List(loot) { item in
                NavigationLink(destination: LootDetailView(item: item)) {
                    HStack(alignment: .top) {
                        Circle()
                            .fill(item.rarity.color)
                            .frame(width: 12, height: 12)
                        
                        VStack(alignment: .leading) {
                            HStack {
                                Text(item.name)
                                    .font(.headline)
                                Spacer()
                                Text(item.type.emoji)
                            }
                            Text("Quantité : \(item.quantity)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("📜 Inventaire")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showAddItemView.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .imageScale(.large)
                    }
                }
            }
            .sheet(isPresented: $showAddItemView) {
                AddItemView(loot: $loot)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
