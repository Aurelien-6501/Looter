import SwiftUI

struct LootDetailView: View {
    let item: LootItem
    @State private var isAppeared = false
    @State private var imageRotation: Double = 0.0
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            ZStack {
                ForEach(0..<3) { i in
                    Circle()
                        .fill(
                            RadialGradient(
                                gradient: Gradient(colors: [item.rarity.color.opacity(0.2), Color.clear]),
                                center: .center,
                                startRadius: CGFloat(i) * 40,
                                endRadius: CGFloat(i) * 100
                            )
                        )
                        .scaleEffect(isAppeared ? 1.4 : 0.5)
                        .opacity(isAppeared ? 0 : 1)
                        .animation(
                            Animation.easeOut(duration: 1.5)
                                .delay(Double(i) * 0.2),
                            value: isAppeared
                        )
                }

                RoundedRectangle(cornerRadius: 20)
                    .fill(item.rarity.color)
                    .frame(width: 120, height: 120)
                    .shadow(color: item.rarity.color.opacity(0.4), radius: 15, x: 0, y: 5)
                    .rotationEffect(.degrees(imageRotation))
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            imageRotation += 90
                        }
                    }

                Text(item.type.emoji)
                    .font(.system(size: 50))
                    .foregroundColor(.white)
            }
            .rotation3DEffect(.degrees(isAppeared ? 360 : 0), axis: (x: 1, y: 1, z: 0))
            .animation(.spring().delay(0.4), value: isAppeared)
            .onAppear {
                isAppeared = true
            }

            Text(item.name)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(item.rarity.color)
                .scaleEffect(isAppeared ? 1.1 : 1.0)
                .opacity(isAppeared ? 1.0 : 0.8)
                .animation(
                    Animation.easeInOut(duration: 4),
                    value: isAppeared
                )
                .onAppear {
                    isAppeared = true
                }

            Spacer(minLength: 125)

            if item.rarity == .unique {
                Text("Item Unique 🏆")
                    .padding(.horizontal, 100)
                    .padding(.vertical, 10)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .font(.headline)
            }

            Form {
                Section(header: Text("INFORMATIONS")) {
                    HStack(spacing: 12) {
                        if let coverName = item.game.coverName, let uiImage = UIImage(named: coverName) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 58, height: 58)
                                .cornerRadius(4)
                        } else {
                            ZStack {
                                RoundedRectangle(cornerRadius: 4)
                                    .fill(Color.gray.opacity(0.4))
                                    .frame(width: 58, height: 58)

                                Image(systemName: "rectangle.slash")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(.black.opacity(0.4))
                            }
                        }

                        VStack(alignment: .leading) {
                            Text(item.game.name)
                                .font(.body)
                                .fontWeight(.medium)

                            Text("In-game : \(item.name)")
                                .font(.body)
                                .foregroundColor(.secondary)
                        }
                    }

                    if let attackStrength = item.attackStrength {
                        Text("Puissance (ATQ) : \(attackStrength)")
                            .font(.body)
                            .foregroundColor(.primary)
                    }

                    Text("Possédé(s) : \(item.quantity)")
                        .font(.body)
                        .foregroundColor(.primary)

                    Text("Rareté : \(item.rarity.rawValue.capitalized)")
                        .font(.body)
                        .foregroundColor(item.rarity.color)
                }
            }
            .background(Color(UIColor.systemGray6))
        }
    }
}

struct LootDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LootDetailView(item: LootItem(quantity: 2, name: "Épée du Désespoir", type: .dagger, rarity: .rare, attackStrength: 80, game: availableGames[0]))
    }
}
