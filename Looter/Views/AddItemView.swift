import SwiftUI

struct AddItemView: View {
    @Binding var loot: [LootItem]
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var rarity: Rarity = .common
    @State private var type: ItemType = .unknown
    @State private var quantity: Int = 1
    @State private var hasAttackStrength: Bool = false
    @State private var attackStrength: Int = 0
    @State private var selectedGame: Game = Game.emptyGame

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Nom de l'objet", text: $name)
                    
                    Picker("Rareté", selection: $rarity) {
                        ForEach(Rarity.allCases) { rarity in
                            Text(rarity.rawValue.capitalized).tag(rarity)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section {
                    Picker("Jeu", selection: $selectedGame) {
                        Text("Non Spécifié").tag(Game.emptyGame)
                        ForEach(availableGames) { game in
                            Text(game.name).tag(game)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    
                    Stepper("Quantité : \(quantity)", value: $quantity, in: 1...99)
                }
                     
                Section {
                    HStack {
                        Text("Type")
                        Spacer()
                        Text(type.emoji)
                    }
                    
                    Picker("Type", selection: $type) {
                        ForEach(ItemType.allCases) { itemType in
                            Text(itemType.emoji).tag(itemType)
                        }
                    }
                    .pickerStyle(PalettePickerStyle())
                }
                
                Section {
                    Toggle("Item d'attaque ?", isOn: $hasAttackStrength)
                    
                    if hasAttackStrength {
                        Stepper("Force d'attaque : \(attackStrength)", value: $attackStrength, in: 0...100)
                    }
                }
                
                Button("Ajouter l'objet") {
                    if !name.isEmpty {
                        let newItem = LootItem(
                            quantity: quantity,
                            name: name,
                            type: type,
                            rarity: rarity,
                            attackStrength: hasAttackStrength ? attackStrength : nil,
                            game: selectedGame
                        )
                        loot.append(newItem)
                        dismiss()
                    }
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .foregroundColor(.blue)
            }
            .navigationTitle("Ajouter un loot")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Annuler") {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView(loot: .constant([]))
    }
}
