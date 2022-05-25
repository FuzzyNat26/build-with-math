//
//  StructureDetailView.swift
//  build-with-math
//
//  Created by Jonathan Lee on 24/04/22.
//

import SwiftUI

struct StructureDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var showRootView: Bool = false
    var structureDetails: StructureInformation
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView {
                Image(structureDetails.structureInitial)
                    .resizable()
                    .scaledToFill()
                   
                VStack(alignment: .leading, spacing: 15) {
                    VStack(alignment: .leading) {
                        Text("**\(structureDetails.structureName)**")
                            .font(.title)
                            .bold()
                        Text("\(structureDetails.structureLocation)")
                            .font(.title3)
                    }
                   
                    Text("\(structureDetails.structureDetails)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    Text("**Sources :** \(structureDetails.structureSources)")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .multilineTextAlignment(.leading)
                    Spacer()
                }
                .padding()
                .navigationBarTitle("")
                .navigationBarHidden(true)
            }
            
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .resizable()
                    .frame(maxWidth: 35, maxHeight: 35)
                    .foregroundColor(Color(UIColor.secondarySystemBackground))
            }
            .padding(20)
        }.ignoresSafeArea(.all, edges: .top)
    }
}
