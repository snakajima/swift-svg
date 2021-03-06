//
//  SVG.swift
//  swift-svg
//
//  Created by SATOSHI NAKAJIMA on 6/16/21.
//

import SwiftUI

public struct SVG: Shape {
    public func path(in rect: CGRect) -> Path {
        var xf = CGAffineTransform(scaleX: rect.width / svgPath.width,
                                   y: rect.height / svgPath.height)
        return Path(svgPath.path.copy(using:&xf)!)
    }

    public let svgPath: SVGPath
    
    public init(_ svgPath: SVGPath) {
        self.svgPath = svgPath
    }
}


struct SVG_Previews: PreviewProvider {
    // hare by Ed Harrison from the Noun Project
    static let s_hare = "M88.5,32.4l-6.3-1.9l1.3-8.7l-3.6-9.9c-0.4-1.1-1.5-1.7-2.6-1.5c-1,0.1-1.7,0.9-2,1.8c-0.6-0.8-1.6-1.1-2.6-0.8  c-1,0.3-1.7,1.4-1.6,2.4l1,10.8l3.6,6.4l-4.7,6.2h-8.2L42.4,26.7c-9.9-4.4-21.5-2-28.9,6l-2.6,2.9C7.7,39.1,6.6,44,8,48.4l-2.4,1.2  L5,56.2l7.3-0.7l0.7-1.3c0.9,0.4,2,0.7,3,0.8l9.3,0.8l-3.9,9.4l10,5.1l-0.8,5.5L41,78.1l-2.6,6.7l2.3,4.9h8L47.7,87l-3.3-1.5l-1-3.1  l2-3.2l1.6,0.4l-0.2,2.3l3.3,5h6.8v-3.3L52,81.7l0.1-1.1l1.8,0.4l5.1-1.9L56.7,75l-4-0.7l0.5-5.2l15.1-5.8l13.9-14.7h8.5L93,45  l1-0.6l0.9-1.7L88.5,32.4z M29,62.7l2.4-3.4c0.9,1.4,1.3,3.1,1,4.9l0,0.3L29,62.7z M45.5,66.4l-1.7,4.4l-4.9-2.7l1.8-11.5  c2.9,1.6,4.7,4.7,4.7,8L45.5,66.4z"
    static var previews: some View {
        VStack {
            let svgHare = SVGPath(Self.s_hare)
            VStack {
                SVG(svgHare)
                    .foregroundColor(.red)
                    .frame(width: svgHare.width / 2, height: svgHare.height / 2)
                SVG(svgHare)
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.green, Color.yellow]), startPoint: .leading, endPoint: .trailing))
                    .frame(width: svgHare.width, height: svgHare.height)
                SVG(svgHare)
                    .foregroundColor(.yellow)
                    .frame(width: svgHare.width * 2.0, height: svgHare.height * 2.0)
                    .overlay(
                        SVG(svgHare)
                            .stroke(Color.blue, lineWidth: 3.0)
                            .foregroundColor(.gray)
                    )
            }
        }
    }
}
