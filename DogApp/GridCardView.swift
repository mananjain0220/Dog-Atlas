//
//  GridCardView.swift
//  DogApp
//
//  Created by manan jain on 25/02/25.
//

import SwiftUI

struct GridCardView: View {
    let values: [(String,String)]
    
    var body: some View {
        VStack {
            GroupBox{
                ForEach(values, id: \.0) { key, value in
                    GridRow {
                        Text(key)
                            .font(.title2)
                            .bold()
                            .frame(maxWidth: .infinity, alignment: .center)
                        Divider()
                        Text(value)
                            .multilineTextAlignment(.leading)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                }
            }.padding()
        }.frame(width: 200)
    }
}

#Preview {
    GridCardView(values: [("Origin", "Germany")])
}
