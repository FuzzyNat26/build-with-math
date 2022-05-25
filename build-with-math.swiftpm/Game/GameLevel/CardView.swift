//
//  CardView.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import SwiftUI

struct CardView: View {
    @AppStorage var cardFinished: Bool
    @State var showDetailView: Bool = false
    
    var cardDetails: StructureInformation
    var cardDestination: AnyView
    
    init(
        cardDetails: StructureInformation,
        cardDestination: AnyView
    ) {
        self.cardDetails = cardDetails
        self.cardDestination = cardDestination
        
        self._cardFinished = AppStorage(wrappedValue: false, "\(cardDetails.structureInitial)_status")
    }
    
    var body: some View {
        ZStack(alignment: .trailing) {
            NavigationLink {
                cardDestination
            } label: {
                HStack {
                    HStack {
                        ZStack {
                            Circle()
                                .fill(cardFinished ? Color.completeBuildingColor : Color.lockBuildingColor)
                            Image("\(cardDetails.structureInitial)-miniature")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding(6)
                        }
                        .frame(width: 65, height: 65)
                        
                        VStack(alignment: .leading, spacing: 5) {
                            Text("\(cardDetails.structureName)")
                                .font(.headline)
                                .multilineTextAlignment(.leading)
                            Text("\(cardDetails.structureLocation)")
                                .font(.subheadline)
                                .multilineTextAlignment(.leading)
                        }
                        .padding(.leading, 5)
                        .foregroundColor(.white)
                        Spacer()
                    }
                }
                .padding(12)
                .background(cardFinished ? Color.topDirtColor : Color.questionBlockColor)
                .cornerRadius(40)
                .shadow(color: Color.gray.opacity(0.1), radius: 5, x: 0, y: 2)
            }
            
            if(cardFinished) {
                Button {
                    self.showDetailView.toggle()
                } label: {
                    Image(systemName: "info.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.rotateIconColor)
                        .padding(.trailing, 12)
                        .frame(width: 50)
                }
            }
        }
        .padding(.horizontal)
        
        .sheet(
            isPresented: $showDetailView) {
                StructureDetailView(structureDetails: cardDetails)
            }
            .shadow(color: .black.opacity(0.2), radius: 4, x: 0, y: 5)
            .buttonStyle(.plain)
    }
}
