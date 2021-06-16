//
//  SVG.swift
//  swift-svg
//
//  Created by SATOSHI NAKAJIMA on 6/16/21.
//

import SwiftUI

struct SVG: View {
    static let emtyPath = CGPath(rect: .zero, transform: nil)
    let path: CGPath
    let size: CGSize
    init(_ script: [String:Any]) {
        let path = SwipePath.parse(script["path"]) ?? Self.emtyPath
        let bounds = path.boundingBoxOfPath
        var xf = CGAffineTransform(translationX: -bounds.minX, y: -bounds.minY)
        self.path = path.copy(using: &xf)!
        self.size = bounds.size
    }
    var body: some View {
        VStack {
            Path(path)
                .frame(width: size.width, height: size.height)
        }
    }
}

// Frog by Ed Harrison from the Noun Project
let s_frog:[String:Any] = [
    "path":"M92.7,24.5l-4.5-1.9h-4.2v-0.1c0-2.7-2.2-4.8-4.8-4.8c-1.2,0-2.3,0.5-3.2,1.2c-2.1,0.3-3.7,1.8-4.4,3.7  c-5.3,0.3-10.4,2.1-14.8,5.2l-7.2,5l-15.8,5.1L15.8,55.5c-0.5,0.1-1,0.1-1.5,0.3l-2.8,0.4C7.8,56.7,5,59.8,5,63.5l0,0  c-0.1,2.5,1,4.9,2.8,6.5l10.7,10l23.3-0.1l3.7,0l3.3,2.2c0.2,0.1,0.5,0.1,0.7,0c0.3-0.2,0.3-0.7,0.1-1l-1.4-1.3l0.4,0l5.4,0l2.1,1.8  c0.3,0.2,0.6,0.2,0.8,0c0.4-0.3,0.4-0.9,0-1.1l-2.4-2.3h-5.4l-5.3-2.7h-6.9c1.2-0.3,2.3-1.1,2.8-2.2l0.1-0.1h9.9l5.2,4.3H71l4.1-1.1  l0.9,0.7c0.3,0.2,0.6,0.2,0.8,0c0.4-0.3,0.4-0.9,0-1.1l-1.3-1l-3.7,0.7h-4.2l5.1-2.4l1.4,0.9c0.2,0.1,0.6,0.1,0.8-0.1  c0.3-0.3,0.3-0.7,0-0.9l-1.8-1.5l-6,2.2H64l-1.8-1.2c0.7-0.9,0.7-2.1,0.1-3.1l-2.7-4l0.2-0.2l3.7,2.4h12.8l3.5-0.9l0.8,0.6  c0.2,0.2,0.5,0.2,0.7,0l0,0c0.3-0.2,0.3-0.7,0-1l-1.1-0.9L77,66h-3.7l4.5-2.1l1.2,0.8c0.2,0.1,0.5,0.1,0.7-0.1  c0.2-0.2,0.2-0.6,0-0.8l-1.6-1.3l-5.2,1.9h-2.7l-1.6-1c0.6-0.8,0.6-1.9,0.1-2.7L66.1,57l2.6-3.4l11.7-8.1l6.4-8.1l4.3-3.2l1.4-2.6  l0,0c1.1-0.4,2-1.3,2.3-2.4C95.5,27.2,94.5,25.2,92.7,24.5z M27.4,73.9L27.4,73.9l7.7,1.7L27.4,73.9z"
]
// hare by Ed Harrison from the Noun Project
let s_hare:[String:Any] = [
    "path":"M88.5,32.4l-6.3-1.9l1.3-8.7l-3.6-9.9c-0.4-1.1-1.5-1.7-2.6-1.5c-1,0.1-1.7,0.9-2,1.8c-0.6-0.8-1.6-1.1-2.6-0.8  c-1,0.3-1.7,1.4-1.6,2.4l1,10.8l3.6,6.4l-4.7,6.2h-8.2L42.4,26.7c-9.9-4.4-21.5-2-28.9,6l-2.6,2.9C7.7,39.1,6.6,44,8,48.4l-2.4,1.2  L5,56.2l7.3-0.7l0.7-1.3c0.9,0.4,2,0.7,3,0.8l9.3,0.8l-3.9,9.4l10,5.1l-0.8,5.5L41,78.1l-2.6,6.7l2.3,4.9h8L47.7,87l-3.3-1.5l-1-3.1  l2-3.2l1.6,0.4l-0.2,2.3l3.3,5h6.8v-3.3L52,81.7l0.1-1.1l1.8,0.4l5.1-1.9L56.7,75l-4-0.7l0.5-5.2l15.1-5.8l13.9-14.7h8.5L93,45  l1-0.6l0.9-1.7L88.5,32.4z M29,62.7l2.4-3.4c0.9,1.4,1.3,3.1,1,4.9l0,0.3L29,62.7z M45.5,66.4l-1.7,4.4l-4.9-2.7l1.8-11.5  c2.9,1.6,4.7,4.7,4.7,8L45.5,66.4z"
]

struct SVG_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SVG(s_frog)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            SVG(s_hare)
                .foregroundColor(.red)
        }
    }
}
