// https://stackoverflow.com/questions/60192357/inverted-mask-swiftui-with-system-image

import SwiftUI

struct Mask<S: Shape>: View {
    init(thisShape: S,
         with mask: Image,
         offset: CGSize,
         maskToShapeRatio: CGFloat) {
        self.shape = thisShape
        self.mask = mask
        self.offset = offset
        self.scale = maskToShapeRatio
    }

    let shape: S
    let mask: Image
    let offset: CGSize
    let scale: CGFloat

    var body: some View {
        ZStack(alignment: .center) {
            shape.fill()
            mask
                .resizable()
                .offset(offset)
                .aspectRatio(contentMode: .fit)
                .blendMode(.destinationOut)
                .scaleEffect(scale)
        }.compositingGroup()
    }
}

struct LuminanceMask<S: Shape>: View {
    init(thisShape: S,
         with mask: Image,
         offset: CGSize,
         maskToShapeRatio: CGFloat) {
        self.shape = thisShape
        self.mask = mask
        self.offset = offset
        self.scale = maskToShapeRatio
    }

    let shape: S
    let mask: Image
    let offset: CGSize
    let scale: CGFloat

    let keep = Color.white
    let remove = Color.black

    var body: some View {
        shape
            .mask(maskView)
    }

    var maskView: some View {
        ZStack(alignment: .center) {
            shape
                .foregroundColor(keep)

            mask
                .resizable()
                .offset(offset)
                .aspectRatio(contentMode: .fit)
                .scaleEffect(scale)
                .foregroundColor(remove)

        }.compositingGroup()
        .luminanceToAlpha()

    }
}

