//
//  OnboardingPageView.swift
//  Looter
//
//  Created by Aurelien Fillion on 08/01/2025.
//
//
//  OnboardingPageView.swift
//  Looter
//

import SwiftUI

struct OnboardingPageView: View {
    let title: String
    let description: String
    let symbolName: String
    @Binding var currentStep: Int
    let index: Int
    let totalSteps: Int

    var body: some View {
        VStack {
            Spacer()
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(symbolName)
                .font(.system(size: 100)) // Emoji en grand
                .padding(.vertical, 20)
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
                .padding(.vertical, 20)

            Spacer()

            Button(action: {
                if index < totalSteps - 1 {
                    currentStep += 1
                } else {
                    withAnimation {
                        UserDefaults.standard.set(true, forKey: "isOnboardingDone")
                    }
                }
            }) {
                Text(index < totalSteps - 1 ? "Suivant" : "Commencer")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.horizontal, 40)
            }
            .padding()
            Spacer().frame(height: 20)
        }
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(
            title: "Votre Wishlist",
            description: "Créez une liste de souhaits pour garder une trace des articles que vous voulez acquérir.",
            symbolName: "✨",
            currentStep: .constant(1),
            index: 1,
            totalSteps: 3
        )
    }
}
