//
//  ViewExtender.swift
//  DemandDriver
//
//  Created by Siva on 08/02/18.
//  Copyright © 2018 Siva. All rights reserved.
//

import Foundation
import UIKit



@IBDesignable
class ViewExtender : UIView {
    
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var backgroundcolor: UIColor = UIColor.white {
        didSet {
            layer.backgroundColor = backgroundcolor.cgColor
        }
    }
    
    
    @IBInspectable var cornorRadius: CGFloat = 1.0 {
        didSet {
            layer.cornerRadius = cornorRadius
//            let rectShape = CAShapeLayer()
//            rectShape.bounds = view.frame
//            rectShape.position = view.center
//            rectShape.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.bottomLeft , .bottomRight , .topLeft], cornerRadii: CGSize(width: 20, height: 20)).cgPath
            
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    
    //MARK: Initializers
    override init(frame : CGRect) {
        super.init(frame : frame)
        setup()
        configure()
    }
    
    convenience init() {
        self.init(frame:CGRect.zero)
        setup()
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        configure()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
        configure()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
        configure()
    }
    
    func setup() {
        layer.backgroundColor = UIColor.white.cgColor
        layer.cornerRadius = 1.0
    }
    
    func configure() {
        layer.backgroundColor = backgroundcolor.cgColor
        layer.cornerRadius = cornorRadius
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}
