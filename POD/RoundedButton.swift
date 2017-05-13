import UIKit

@IBDesignable
class RoundedButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 0.0
    @IBInspectable var shadowOpacity: CGFloat = 0
    @IBInspectable var shadowOffsetHeight: CGFloat = 0
    @IBInspectable var shadowOffsetWidth: CGFloat = 0
    @IBInspectable var shadowColor: UIColor = UIColor.black
    @IBInspectable var shadowRadius: CGFloat = 1
    private var customBackgroundColor = UIColor.white
    
    
    override var backgroundColor: UIColor?{
        didSet {
            customBackgroundColor = backgroundColor!
            super.backgroundColor = UIColor.clear
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0
    
    @IBInspectable var borderColor: UIColor = UIColor.clear
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func draw(_ rect: CGRect) {
        let ref: CGContext? = UIGraphicsGetCurrentContext()
        
        /* We can only draw inside our view, so we need to inset the actual 'rounded content' */
        var contentRect: CGRect = rect.insetBy(dx: CGFloat(shadowRadius), dy: CGFloat(shadowRadius))
        /* Create the rounded path and fill it */
        var roundedPath = UIBezierPath(roundedRect: contentRect, cornerRadius: cornerRadius)
        ref?.setFillColor((customBackgroundColor.cgColor))
        ref?.setShadow(offset: CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight), blur: shadowRadius, color: shadowColor.cgColor)
        roundedPath.fill()
        
        /**
         Draw border
         */
        ref?.setStrokeColor(borderColor.cgColor)
        ref?.setLineWidth(self.borderWidth)
        roundedPath.stroke()
        /* Draw a subtle white line at the top of the view */
        //        roundedPath.addClip()
        //        ref?.setStrokeColor(UIColor(white: CGFloat(1.0), alpha: CGFloat(0.6)).cgColor)
        //        ref?.setBlendMode(CGBlendMode.overlay)
        //        ref?.move(to: CGPoint(x: CGFloat(contentRect.minX), y: CGFloat(contentRect.minY + 0.5)))
        //        ref?.addLine(to: CGPoint(x: CGFloat(contentRect.maxX), y: CGFloat(contentRect.minY + 0.5)))
        //        ref?.strokePath()
        
        // whatever else you need drawn
    }
    
}
