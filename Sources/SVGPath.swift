//
//  SVGPath.swift
//  swift-svg
//
//  Created by SATOSHI NAKAJIMA on 6/22/21.
//

import QuartzCore

public struct SVGPath {
    static let emtyPath = CGPath(rect: .zero, transform: nil)
    let path: CGPath
    let size: CGSize
    var width: CGFloat { size.width }
    var height: CGFloat { size.height }
    init(_ svg: String) {
        let path = SVGParser.parse(svg) ?? Self.emtyPath
        self.init(path)
    }
    
    init(_ path: CGPath) {
        let bounds = path.boundingBoxOfPath
        var xf = CGAffineTransform(translationX: -bounds.minX, y: -bounds.minY)
        self.path = path.copy(using: &xf) ?? Self.emtyPath
        self.size = bounds.size
    }
    
    func morphed(_ morph: @escaping (CGPoint) -> CGPoint) -> SVGPath {
        let path = CGMutablePath()
        typealias ApplyFunction = (CGPathElement) -> ()
        var apply: ApplyFunction = { element in
            let points = element.points
            switch(element.type) {
            case .moveToPoint:
                path.move(to: morph(points[0]))
            case .addLineToPoint:
                path.addLine(to: morph(points[0]))
            case .addQuadCurveToPoint:
                path.addQuadCurve(to: morph(points[1]), control: morph(points[0]))
            case .addCurveToPoint:
                path.addCurve(to: morph(points[2]), control1: morph(points[0]), control2: morph(points[1]))
            case .closeSubpath:
                path.closeSubpath()
            @unknown default:
                break
            }
        }
        
        self.path.apply(info: &apply) { userInfo, elementPointer in
            let apply = userInfo!.assumingMemoryBound(to: ApplyFunction.self).pointee
            apply(elementPointer.pointee)
        }
        return SVGPath(path)
    }
}
