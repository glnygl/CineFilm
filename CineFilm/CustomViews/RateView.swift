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
                .foregroundColor(.white).font(.system(size: 10, weight: .bold, design: .rounded))
            Circle()
                .stroke(lineWidth: 4.0)
                .foregroundColor(Color.appColor.lightGreen)
            Circle()
                  .trim(from: 0.0, to: CGFloat(min(self.progress, 10.0)))
                  .stroke(style: StrokeStyle(lineWidth: 4.0, lineCap: .round, lineJoin: .round))
                  .foregroundColor(Color.appColor
                    .neonGreen)
        }
    }
}

struct RateView_Previews: PreviewProvider {
    static var previews: some View {
        RateView(progress: 0.74)
    }
}
