import Foundation

struct OnboardingDataModel {
    var image: String
    var heading: String
    var text: String
}

extension OnboardingDataModel {
    static var data: [OnboardingDataModel] = [
        OnboardingDataModel(image: "ImageTest", heading: "Curate for you", text: "A Smart Experience for you to find a perfect outfit."),
        OnboardingDataModel(image: "ImageTest", heading: "Add to your wardrobe", text: "Take a clear photos of your clothes so that we can curate a perfect inspiration with your personal items."),
        OnboardingDataModel(image: "ImageTest", heading: "Instant reference", text: "Choose the items you're most interested in and we will find perfect reference for you."),
        OnboardingDataModel(image: "ImageTest", heading: "Shop the look", text: "Clicked the price tag button to view and shop exact or similar products."),
    ]
}
