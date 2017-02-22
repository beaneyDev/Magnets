//
//  Magnet.swift
//  Magnets
//
//  Created by Matt Beaney on 13/11/2016.
//  Copyright © 2016 Matt Beaney. All rights reserved.
//

import Foundation
import UIKit

class Magnet: UIView {
    var moveLeft: Bool = false
    var moveUp: Bool = false
    var movement: CGFloat = 2.0
    
    func sizeWithParent(parent: UIView) {
        let width: CGFloat = 15.0
        let height: CGFloat = 15.0
        let positionX = CGFloat(Int(arc4random_uniform(UInt32(parent.frame.size.width - width)) + 1))
        let positionY = CGFloat(Int(arc4random_uniform(UInt32(parent.frame.size.height - height)) + 1))
        movement = CGFloat(Int(arc4random_uniform(UInt32(30) + 1) + 1))
        print(movement)
        
        let red = Float(Int(arc4random_uniform(UInt32(255.0))))
        let green = Float(Int(arc4random_uniform(UInt32(255.0))))
        let blue = Float(Int(arc4random_uniform(UInt32(255.0))))
        
        self.backgroundColor = UIColor(colorLiteralRed: red / 255.0, green: green / 255.0, blue: blue / 255.0, alpha: 1.0)
        self.layer.cornerRadius = height / 2.0
        self.clipsToBounds = true
        
        if movement == 0.0 {
            
        }
        
        self.frame = CGRect(x: positionX, y: positionY, width: width, height: height)
        parent.addSubview(self)
    }
}
