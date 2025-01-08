//
//  OnboardingView.swift
//  Looter
//
//  Created by Aurelien Fillion on 08/01/2025.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentStep = 0
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool = false

    private let pages = [
        ("Gérer ses loots", "Ajoutez facilement vos trouvailles et vos achats à votre collection personnelle.", "🎒"),
        ("Votre Wishlist", "Créez une liste de souhaits pour garder une trace des articles que vous voulez acquérir.", "✨"),
        ("En un coup d'oeil", "Accédez rapidement à vos fonctionnalités clés depuis l'écran d'accueil de votre appareil.", "📱")
    ]

    var body: some View {
        TabView(selection: $currentStep) {
            ForEach(0..<pages.count, id: \.self) { index in
                let page = pages[index]
                OnboardingPageView(
                    title: page.0,
                    description: page.1,
                    symbolName: page.2,
                    currentStep: $currentStep,
                    index: index,
                    totalSteps: pages.count
                )
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
