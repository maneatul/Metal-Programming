//
//  MyImage.swift
//  Shaders 101
//
//  Created by Atul Mane on 06/06/25.
//

import SwiftUI

struct MyImage: View {
    
    let dim: CGFloat
    
    init(dim: CGFloat = 300.0) {
        self.dim = dim
    }
    
    var body: some View {
        Image(systemName: "figure.dance")
            .resizable()
            .frame(width: dim, height: dim)
            .scaledToFill()
    }
}

#Preview {
    MyImage()
}
