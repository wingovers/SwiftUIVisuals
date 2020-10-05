//
//  ContentView.swift
//  SwiftUIVisuals
//
//  Created by Ryan Ferrell on 10/4/20.
//

import SwiftUI

struct MainScreen: View {
    @State var navigation: Views? = todaysWorkingItem()

    var body: some View {
        NavigationView {
            List(selection: $navigation, content: {
                ForEach(Views.allCases) { view in
                    NavigationLink(
                        destination: view.destinationView,
                        isActive: makeBinding(view: view),
                        label: {
                            Text(view.rawValue)
                        }).tag(view)
                }
            }).listStyle(SidebarListStyle())
            .frame(width: 200)
        }
    }

    private func makeBinding(view: Views) -> Binding<Bool> {
        Binding<Bool> { () -> Bool in
            navigation == view
        } set: { _ in }

    }
}
