//
//  StructureComponentView.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import SwiftUI

struct StructureComponentView: View {
    @Binding var partCount: Int
    var structureName: String
    
    var scale: CGFloat
    
    init(partCount: Binding<Int>, structureName: String) {
        self._partCount = partCount
        self.structureName = structureName
        
        let device = UIScreen.main.traitCollection.userInterfaceIdiom
        
        if (device == .pad) {
            let width = UIScreen.main.bounds.size.width
            let height = UIScreen.main.bounds.size.height
            
            // IF POTRAIT
            self.scale = CGFloat(width < height ? width / 530: height / 730)
        } else {
            self.scale = 1
        }
    }
    
    var body: some View {
        VStack(spacing: 0) {
            StructureImageView(imageName: structureName, imageIndex: 4, partCount: partCount)
            StructureImageView(imageName: structureName, imageIndex: 3,  partCount: partCount)
            StructureImageView(imageName: structureName, imageIndex: 2,  partCount: partCount)
            StructureImageView(imageName: structureName, imageIndex: 1,  partCount: partCount)
            StructureImageView(imageName: structureName, imageIndex: 0,  partCount: partCount)
        }
        .scaleEffect(CGFloat(scale), anchor: .bottom)
        .shadow(color: .gray.opacity(0.6), radius: 5, x: 0, y: 5)
    }
}
