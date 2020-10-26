//
//  RoundedShape.swift
//  swiftui-fitness-dashboard
//
//  Created by Huy D. on 10/26/20.
//

import SwiftUI

struct RoundedShape: Shape {
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: [.topLeft,.topRight],
            cornerRadii: CGSize(width: 5, height: 5)
        )
        return Path(path.cgPath)
    }
    
}
