//
//  ExpandableTextView.swift
//  iosApp
//
//  Created by Muhammad Usman on 15/05/2025.
//  Copyright © 2025 orgName. All rights reserved.
//

import SwiftUI

struct ExpandableTextView: View {
    
    @State var text: String
    @State var isExpanded = false
    
    var body: some View {
        Text(text)
            .onTapGesture {
                isExpanded = !isExpanded
            }
            .lineLimit(isExpanded ? 15 : 3)
    }
}

#Preview {
    ExpandableTextView(text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                       isExpanded: false)
}
