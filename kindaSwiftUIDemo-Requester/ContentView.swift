//
//  ContentView.swift
//  kindaSwiftUIDemo-Requester
//
//  Created by Alex Nagy on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            NavigationLink("Photos View") {
                PhotosView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
