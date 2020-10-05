
import Foundation

class MockNetworking {
    func returnTrueAfter(seconds: Double, completion: @escaping (Bool) -> Void) {
        let delay = DispatchTime.now() + seconds
        DispatchQueue.main.asyncAfter(deadline: delay) {
            completion(true)
        }
    }
}


class UnobservedVM: ObservableObject {
    enum ViewType {
        case homeRed, thanksGreen
    }

    private let networking = MockNetworking()

    @Published var screenState: ViewType = .homeRed
    @Published var homeRedText = ""
    @Published var thanksGreenText = "🙏🏽"

    func makeMockNetworkCall() {
        networking.returnTrueAfter(seconds: 1) { [weak self] data in
            guard let self = self else { return }
            guard data else { return }
            self.screenState = .thanksGreen
            self.appendRandomNumber()
        }
    }

    func restoreOriginalScreenState() {
        screenState = .homeRed
        thanksGreenText = "🙏🏽"
    }

    private func appendRandomNumber() {
        let random = String("1234567890".randomElement()!)
        homeRedText.append(random)
        thanksGreenText.append(random)
    }
}
