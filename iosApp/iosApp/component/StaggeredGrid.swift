//
//  StaggeredGrid.swift
//  iosApp
//
//  Created by Muhammad Usman on 04/06/2025.
//  Copyright © 2025 orgName. All rights reserved.
//

import Foundation
import SwiftUI

struct StaggeredGridLayout: Layout {
    let columns: Int
    let spacing: CGFloat
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let width = proposal.width ?? 0
        let columnWidth = (width - spacing * CGFloat(columns - 1)) / CGFloat(columns)
        
        var columnHeights = Array(repeating: CGFloat(0), count: columns)
        
        for (index, subview) in subviews.enumerated() {
            let column = index % columns
            let height = subview.sizeThatFits(
                ProposedViewSize(width: columnWidth, height: nil)
            ).height
            
            columnHeights[column] += height + spacing
        }
        
        let maxHeight = columnHeights.max() ?? 0
        return CGSize(width: width, height: maxHeight)
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let width = bounds.width
        let columnWidth = (width - spacing * CGFloat(columns - 1)) / CGFloat(columns)
        
        var columnHeights = Array(repeating: bounds.minY, count: columns)
        
        for (index, subview) in subviews.enumerated() {
            let column = index % columns
            let height = subview.sizeThatFits(
                ProposedViewSize(width: columnWidth, height: nil)
            ).height
            
            let x = bounds.minX + CGFloat(column) * (columnWidth + spacing)
            let y = columnHeights[column]
            
            subview.place(
                at: CGPoint(x: x, y: y),
                anchor: .topLeading,
                proposal: ProposedViewSize(width: columnWidth, height: height)
            )
            
            columnHeights[column] += height + spacing
        }
    }
}
