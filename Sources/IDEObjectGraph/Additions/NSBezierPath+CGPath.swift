import AppKit

extension NSBezierPath {
  var cgPath: CGPath {
    let path = CGMutablePath()
    var points = [CGPoint](repeating: .zero, count: 3)
    for i in 0..<elementCount {
      let type = element(at: i, associatedPoints: &points)

      switch type {
      case .moveTo: path.move(to: points[0])
      case .lineTo: path.addLine(to: points[0])
      case .curveTo: path.addCurve(to: points[2], control1: points[0], control2: points[1])
      case .closePath: path.closeSubpath()
      case .cubicCurveTo: break
      case .quadraticCurveTo: break
      @unknown default: break
      }
    }
    return path
  }
}
