// https://stackoverflow.com/questions/60192357/inverted-mask-swiftui-with-system-image

import SwiftUI

struct CutoutButtonDemo: View {

    let userImage = Image("glacier")
    let maskPlay = Image(systemName: "play.fill")
    let maskBatman = Image("batmansvg")
    let square: CGFloat = 200
    let scalePlay: CGFloat = 0.5
    let scaleBatman: CGFloat = 3
    var maskImageOffset: CGSize { CGSize(width: square * 0.1, height: 0) }
    let colorLuminanceAlpha = Color(.systemRed)
    let colorDestinationOut = Color(.systemTeal)
    let font = Font.system(size: 30, weight: .medium, design: .rounded)

    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())]

    var body: some View {
        ZStack {
            userImage.blur(radius: 5)
            LazyVGrid(columns: columns) {
                batman
                play
            }
            .font(font)
            .padding()
        }
    }

    var play: some View {
        VStack(spacing: 100) {
            VStack {
                Text("Destination Out")
                Mask(thisShape: Circle(),
                     with: maskPlay,
                     offset: maskImageOffset,
                     maskToShapeRatio: scalePlay)
                    .frame(width: square, height: square)
            }.foregroundColor(colorDestinationOut)
            VStack {
                Text("Luminance To Alpha")
                LuminanceMask(thisShape: Circle(),
                               with: maskPlay,
                               offset: maskImageOffset,
                               maskToShapeRatio: scalePlay)
                    .frame(width: square, height: square)
            }.foregroundColor(colorLuminanceAlpha)
        }
    }

    var batman: some View {
        VStack(spacing: 100) {
            VStack {
                Text("Destination Out")
                Mask(thisShape: Circle(),
                     with: maskBatman,
                     offset: .zero,
                     maskToShapeRatio: scaleBatman)
                    .frame(width: square, height: square)
            }.foregroundColor(colorDestinationOut)
            VStack {
                Text("Luminance To Alpha")
                LuminanceMask(thisShape: Circle(),
                              with: maskBatman,
                              offset: .zero,
                              maskToShapeRatio: scaleBatman)
                    .frame(width: square, height: square)
            }.foregroundColor(colorLuminanceAlpha)
        }
    }
}
