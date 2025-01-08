import SwiftUI

@main
struct LooterApp: App {
    @AppStorage("isOnboardingDone") var isOnboardingDone: Bool = false

    var body: some Scene {
        WindowGroup {
        if isOnboardingDone {
            ContentView()
        } else {
            OnboardingView()
        }
        }
    }
}
