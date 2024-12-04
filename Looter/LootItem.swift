import SwiftUI


struct LootItem: Identifiable {
    let id = UUID()
    var quantity: Int = 1
    let name: String
    let type: ItemType
    let rarity: Rarity
    var attackStrength: Int?
    let game: Game
}

enum ItemType: String, CaseIterable, Identifiable {
    case magic = "Magic"
    case fire = "Fire"
    case ice = "Ice"
    case wind = "Wind"
    case poison = "Poison"
    case thunder = "Thunder"
    case dagger = "Dagger"
    case shield = "Shield"
    case bow = "Bow"
    case ring = "Ring"
    case unknown = "Unknown"
    
    var id: String { self.rawValue }
    
    var emoji: String {
        switch self {
        case .magic: return "⭐️"
        case .fire: return "🔥"
        case .ice: return "❄️"
        case .wind: return "💨"
        case .poison: return "☠️"
        case .thunder: return "⚡️"
        case .dagger: return "🗡️"
        case .shield: return "🛡️"
        case .bow: return "🏹"
        case .ring: return "💍"
        case .unknown: return "🎲"
        }
    }
}

enum Rarity: String, CaseIterable, Identifiable {
    case common = "Common"
    case uncommon = "Uncommon"
    case rare = "Rare"
    case epic = "Epic"
    case legendary = "Legendary"
    case unique = "Unique"
    
    var id: String { self.rawValue }
    
    var color: Color {
        switch self {
        case .common: return .gray
        case .uncommon: return .green
        case .rare: return .blue
        case .epic: return .purple
        case .legendary: return .orange
        case .unique: return .red
        }
    }
}


