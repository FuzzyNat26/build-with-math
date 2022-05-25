//
//  StructureTransitionExtension.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import SwiftUI

extension AnyTransition {
    static var bottomSlide: AnyTransition {
        AnyTransition.move(edge: .bottom)
    }
}
