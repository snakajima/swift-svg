//
//  SVG.swift
//  swift-svg
//
//  Created by SATOSHI NAKAJIMA on 6/16/21.
//

import SwiftUI

struct SVG: View {
    var body: some View {
        Path { path in
            path.addRect(CGRect(x: 0, y: 0, width: 50, height: 100))
        }
    }
}

struct SVG_Previews: PreviewProvider {
    static var previews: some View {
        SVG()
    }
}
