import SwiftUI

struct OnBoardingContentView: View {
    @State private var onboardinDone = false
    var data = OnboardingDataModel.data
    
    var body: some View {
        Group {
            if !onboardinDone {
                OnboardingViewPure(data: data, doneFunction: {
                    /// Update your state here
                    self.onboardinDone = true
                    print("done onboarding")
                })
            } else {
                TakePicturePage()
            }
        }
    }
}

struct OnBoardingContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
