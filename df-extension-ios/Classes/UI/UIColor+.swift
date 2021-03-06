//
//  UIColor+.swift
//

import UIKit

public extension UIColor {
    
    private convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    /**
     hex로 UIColor 만들기
     
     - parameter hex: Int
     */
    convenience init(hex: Int) {
        self.init(red:(hex >> 16) & 0xff, green:(hex >> 8) & 0xff, blue:hex & 0xff)
    }
    
    /**
     hex로 UIColor 만들기
     
     - parameter hex: String
     */
    convenience init(hexString: String) {
        let scanner = Scanner(string: hexString)
        scanner.scanLocation = 0
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
    
    /**
     red값
     
     - returns: CGFloat
     */
    var red: CGFloat { return CIColor(color: self).red }
    
    /**
     green값
     
     - returns: CGFloat
     */
    var green: CGFloat { return CIColor(color: self).green }
    
    /**
     blue값
     
     - returns: CGFloat
     */
    var blue: CGFloat { return CIColor(color: self).blue }
    
    /**
     alpha값
     
     - returns: CGFloat
     */
    var alpha: CGFloat { return CIColor(color: self).alpha }
    
    /**
     hex값
     
     - returns: CGFloat
     */
    var toHexString: String {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        
        return String(
            format: "%02X%02X%02X",
            Int(r * 0xff),
            Int(g * 0xff),
            Int(b * 0xff)
        )
    }
}
