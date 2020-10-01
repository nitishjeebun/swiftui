//
//  BubbleArrow.swift
//  swiftui-scroll-reader
//
//  Created by Huy D. on 9/30/20.
//

import SwiftUI

struct BubbleArrow: Shape {
    
    var isMyMessage: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: isMyMessage ?
                                    [.topLeft, .bottomLeft, .bottomRight] :
                                    [.topRight, .bottomLeft, .bottomRight],
                                cornerRadii: CGSize(width: 10, height: 10))
        return Path(path.cgPath)
    }
    
}
