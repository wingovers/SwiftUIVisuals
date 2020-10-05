
import SwiftUI

struct UnobservedObjectDemo: View {
    @StateObject var mock = UnobservedVM()
    var body: some View {
        IrksomeNavView().environmentObject(mock)
    }
}

struct IrksomeNavView: View {
    @EnvironmentObject var mock: UnobservedVM

    @ViewBuilder
    var body: some View {
        VStack {
            if mock.screenState == .thanksGreen {
                ThanksGreen(text: mock.thanksGreenText)
                    .transition(.slide)
            } else {
                HomeRed(text: mock.homeRedText)
                    .transition(.slide)
            }
            buttons
        }.animation(.easeInOut)
        .font(.system(.title))
    }

    var buttons: some View {
        HStack {
            Button("Trigger Say Thanks Mock Network Call") {
                withAnimation { mock.makeMockNetworkCall() }
            }.buttonStyle(BorderlessButtonStyle())
            .padding()
            .background(Capsule().foregroundColor(.green))

            Button("Reset") {
                withAnimation { mock.restoreOriginalScreenState() }
            }.buttonStyle(BorderlessButtonStyle())
            .padding()
            .background(Capsule().foregroundColor(.red))
        }
    }
}

struct HomeRed: View {
    let text: String
    var body: some View {
        Color(.systemRed)
            .overlay(Text(text), alignment: .center)
    }
}

struct ThanksGreen: View {
    let text: String
    var body: some View {
        Color(.systemGreen)
            .overlay(Text(text), alignment: .center)
    }
}
