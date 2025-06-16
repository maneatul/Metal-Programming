//
//  PizzaView.swift
//  Shaders 101
//
//  Created by Atul Mane on 09/06/25.
//

import SwiftUI

struct PizzaView: View {
    var body: some View {
        Image("pizza")
            .resizable()
            .frame(height: 300)
            .scaledToFit()
    }
}

#Preview {
    PizzaView()
}
