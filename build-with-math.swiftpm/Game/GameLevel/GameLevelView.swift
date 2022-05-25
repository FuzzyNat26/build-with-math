//
//  GameLevelView.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import SwiftUI

struct GameLevelView: View {
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some View {
        ZStack {
            Color.bottomDirtColor
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(spacing: 20) {
                    Section(header:
                                Text("Addition")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                    ) {
                        CardView(
                            cardDetails: monasDetails,
                            cardDestination: AnyView(
                                StructureView(
                                    levelType: 0,
                                    structureDetails: monasDetails
                                )
                            )
                        )
                        CardView(
                            cardDetails: puputanDetails,
                            cardDestination: AnyView(
                                StructureView(
                                    levelType: 0,
                                    structureDetails: puputanDetails
                                )
                            )
                        )
                    }
                    Section(header:
                                Text("Subtraction")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                    ) {
                        CardView(
                            cardDetails: mtqDetails,
                            cardDestination: AnyView(
                                StructureView(
                                    levelType: 1,
                                    structureDetails: mtqDetails
                                )
                            )
                        )
                        CardView(
                            cardDetails: pahlawanDetails,
                            cardDestination: AnyView(
                                StructureView(
                                    levelType: 1,
                                    structureDetails: pahlawanDetails
                                )
                            )
                        )
                    }
                    Section(header:
                                Text("Multiplication")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                    ) {
                        CardView(
                            cardDetails: jogjaDetails,
                            cardDestination: AnyView(
                                StructureView(
                                    levelType: 2,
                                    structureDetails: jogjaDetails
                                )
                            )
                        )
                        CardView(
                            cardDetails: mandalaDetails,
                            cardDestination: AnyView(
                                StructureView(
                                    levelType: 2,
                                    structureDetails: mandalaDetails
                                )
                            )
                        )
                    }
                    Section(header:
                                Text("Division")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal)
                        .foregroundColor(.white)
                    ) {
                        CardView(
                            cardDetails: khatulistiwaDetails,
                            cardDestination: AnyView(
                                StructureView(
                                    levelType: 3,
                                    structureDetails: khatulistiwaDetails
                                )
                            )
                        )
                        CardView(
                            cardDetails: gadangDetails,
                            cardDestination: AnyView(
                                StructureView(
                                    levelType: 3,
                                    structureDetails: gadangDetails
                                )
                            )
                        )
                    }
                    
                    Spacer()
                }
            }
            .navigationTitle("Level")
        }
    }
}
