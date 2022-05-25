import SwiftUI

@main
struct MyApp: App {
    @AppStorage("showIntroduction")
    var firstTimePlaying: Bool = true
    
    var body: some Scene {
        // A BRIEF INFORMATION ABOUT THE PROJECT
        // CAN BE LOCATED ON "Resources > README.md"
        WindowGroup {
            MainView()
                .preferredColorScheme(.dark)
                .fullScreenCover(isPresented: $firstTimePlaying) {
                    IntroductionView()
                }
        }
    }
}
