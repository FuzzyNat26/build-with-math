//
//  StructureImageView.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import SwiftUI

struct StructureImageView: View {
    var imageName: String
    var imageIndex: Int
    var partCount: Int
    
    var body: some View {
        Image("\(imageName)-\(imageIndex + 1)")
            .opacity(partCount > imageIndex ? 1 : 0)
            .offset(y: partCount > imageIndex ? 10 : 0)
    }
}
