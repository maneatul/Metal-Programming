//
//  TreeView.swift
//  Shaders 101
//
//  Created by Atul Mane on 16/05/25.
//

import SwiftUI

struct TreeView: View {
    var body: some View {
        Image("tree")
            .resizable()
            .frame(height: 300)
            .scaledToFit()
    }
}

#Preview {
    TreeView()
}
