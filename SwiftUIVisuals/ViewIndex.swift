import SwiftUI

func todaysWorkingItem() -> Views {
    .unobservedObject
}

enum Views: String {
    case cutoutButton = "Image Inverted Mask Grid"
    case unobservedObject = "Unobserved Object"

    var destinationView: AnyView {
        switch self {
        case .cutoutButton: return AnyView(CutoutButtonDemo())
        case .unobservedObject: return AnyView(UnobservedObjectDemo())
        }
    }
}

extension Views: CaseIterable, Identifiable {
    var id: String { self.rawValue }
}
