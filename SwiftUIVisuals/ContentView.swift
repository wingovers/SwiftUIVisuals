//
//  ContentView.swift
//  SwiftUIVisuals
//
//  Created by Ryan Ferrell on 10/4/20.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(
                    destination: ImageInvertedMask(),
                    label: {
                        Text("Image Inverted Mask")
                    })
            }
        }
    }
}

