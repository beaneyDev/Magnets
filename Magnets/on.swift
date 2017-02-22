//
//  on.swift
//  PSLive
//
//  Created by Joe Flood on 15/08/2016.
//  Copyright © 2016 PageSuite. All rights reserved.
//

import Foundation

class on {
    static let STANDARD_ANIMATION_TIME = Float(0.3)
    
    typealias Work = () -> ()
    
    /// Run sth. on the main thread - avoid dispatch overhead if already tehre
    static func main(_ task: @escaping Work) {
        if Thread.isMainThread {
            task()
        } else {
            DispatchQueue.main.async(execute: task)
        }
    }
    
    /// Run sth. on a background thread
    static func bg(_ task: @escaping Work) {
        DispatchQueue.global(qos: .default).async(execute: task)
    }
}
