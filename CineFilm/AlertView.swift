//
//  AlertView.swift
//  CineFilm
//
//  Created by glnygl on 14.08.2023.
//

import SwiftUI

struct AlertView: View {
    
    init() {
        UIView.appearance(whenContainedInInstancesOf: [UIAlertController.self]).tintColor = .orange
    }
    
    @State var title = "Error"
    @State private var showingAlert = true

    var body: some View {
        Button("") {}
        .alert(title, isPresented: $showingAlert) {
            Button("OK", role: .cancel) {}
        }
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView()
    }
}
