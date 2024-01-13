//
//  RateView.swift
//  CineFilm
//
//  Created by glnygl on 19.08.2023.
//

import SwiftUI

struct RateView: View {
    @State var progress: Double
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 16.0)
                .foregroundColor(Color.appColor.darkGreen)
            Circle()
                .fill(Color.appColor.darkGreen)
            Text(String(format: "%.1f", progress * 10))
                .foregroundColor(.white).font(.system(size: 10, weight: .bold))
            Circle()
                .stroke(lineWidth: 4.0)
                .foregroundColor(Color.appColor.lightGreen)
            Circle()
                  .trim(from: 0.0, to: CGFloat(min(self.progress, 10.0)))
                  .stroke(lineWidth: 4.0)
                  .foregroundColor(Color.appColor
                    .neonGreen)
        }
    }
}
