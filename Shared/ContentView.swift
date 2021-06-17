//
//  ContentView.swift
//  Shared
//
//  Created by SATOSHI NAKAJIMA on 6/16/21.
//

import SwiftUI

struct ContentView: View {
    let s_test = "M0,0 l20,20 l-20,20 l20,20 l-20,20 l20,20 l-20,20 l20,20 l-20,20z"
    var body: some View {
        VStack {
            let svgTest = SVGShape(s_test)
            SVG(svgTest)
                .frame(width: svgTest.width, height: svgTest.height)
            SVG(svgTest)
                .morph { point in
                    let ratio = point.y / svgTest.height
                    let dx = svgTest.width * 1 * ratio * ratio
                    print(point, dx)
                    return CGPoint(x: point.x + dx, y: point.y)
                }
                .frame(width: svgTest.width, height: svgTest.height)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
