//
//  HeartView.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import SwiftUI

struct HeartView: View {
    @Binding var totalHeart: Int
    
    var body: some View {
        HStack {
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(totalHeart > 0 ? .red : .lightGrayColor)
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(totalHeart > 1 ? .red : .lightGrayColor)
            Image(systemName: "heart.fill")
                .resizable()
                .frame(width: 25, height: 25)
                .foregroundColor(totalHeart > 2 ? .red : .lightGrayColor)
        }
        .shadow(color: .gray.opacity(0.6), radius: 2, x: 0, y: 3)
    }
}
