//
//  ViewController.swift
//  Magnets
//
//  Created by Matt Beaney on 13/11/2016.
//  Copyright © 2016 Matt Beaney. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var square2GoesLeft: Bool = false
    var square2GoesUp: Bool = false
    
    var mainMagnet: Magnet!
    var magnets: [Magnet] = []

    
    @IBAction func test(_ sender: Any) {
        for magnet in magnets {
            UIView.animate(withDuration: 1.0, animations: {
                magnet.frame.origin.x = 30.0
                magnet.frame.origin.y = 30.0
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mainMagnet = Magnet()
        mainMagnet.sizeWithParent(parent: self.view)
        mainMagnet.backgroundColor = UIColor.red
        mainMagnet.movement = 30.0
        
        for _ in (0..<150)
        {
            let magnet = Magnet()
            magnet.sizeWithParent(parent: self.view)
            self.magnets.append(magnet)
            self.animate(magnet: magnet)
            magnet.alpha = 0.5
        }
        
        animateMain()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func animateMain() {
        UIView.animate(withDuration: 0.0, animations: {
            if self.mainMagnet.frame.origin.x >= self.view.frame.width - self.mainMagnet.frame.width {
                self.mainMagnet.moveLeft = true
            } else if self.mainMagnet.frame.origin.x <= 0.0 {
                self.mainMagnet.moveLeft = false
            }
            
            if self.mainMagnet.frame.origin.y >= self.view.frame.height - self.mainMagnet.frame.height {
                self.mainMagnet.moveUp = true
            } else if self.mainMagnet.frame.origin.y <= 0.0 {
                self.mainMagnet.moveUp = false
            }
            
            if self.mainMagnet.moveLeft {
                self.mainMagnet.frame.origin.x -= self.mainMagnet.movement
            } else {
                self.mainMagnet.frame.origin.x += self.mainMagnet.movement
            }
            
            if self.mainMagnet.moveUp {
                self.mainMagnet.frame.origin.y -= self.mainMagnet.movement
            } else {
                self.mainMagnet.frame.origin.y += self.mainMagnet.movement
            }
            
        }, completion: { (value: Bool) in
            on.main {
                self.animateMain()
            }
        })
    }
    
    func animate(magnet: Magnet) {
        UIView.animate(withDuration: 0.05, animations: {
            
            let rightEdge = self.view.frame.width
            let leftEdge: CGFloat = 0.0
            let bottomEdge = self.view.frame.height
            let topEdge: CGFloat = 0.0
            
//            magnet.frame.size.width *= 2.0
//            magnet.frame.size.height *= 2.0
            
            //if false {
            for magnetInList in self.magnets {
                if magnet != magnetInList {
                    if magnet.frame.intersects(magnetInList.frame) {
                        //magnet.frame.origin.x += 15.0
                        //magnet.frame.origin.y += 15.0
                    }
                }
            }
            
            if magnet.frame.origin.x >= rightEdge {
                magnet.frame.origin.x -= 40.0
            }
            
            if magnet.frame.origin.x <= leftEdge {
                magnet.frame.origin.x += 40.0
            }
            
            if magnet.frame.origin.y >= bottomEdge {
                magnet.frame.origin.y -= 40.0
            }
            
            if magnet.frame.origin.y <= topEdge {
                magnet.frame.origin.y += 40.0
            }
            
            if magnet.frame.origin.x < self.mainMagnet.frame.origin.x {
                magnet.frame.origin.x -= magnet.movement / 4.0
                magnet.frame.origin.x += magnet.movement
            } else if magnet.frame.origin.x > self.mainMagnet.frame.origin.x {
                magnet.frame.origin.x += magnet.movement / 4.0
                magnet.frame.origin.x -= magnet.movement
            }
            
            if magnet.frame.origin.y < self.mainMagnet.frame.origin.y {
                magnet.frame.origin.y -= magnet.movement / 4.0
                magnet.frame.origin.y += magnet.movement
            } else if magnet.frame.origin.y > self.mainMagnet.frame.origin.y {
                magnet.frame.origin.y += magnet.movement / 4.0
                magnet.frame.origin.y -= magnet.movement
            }
            
            //}
            
        }, completion: { (value: Bool) in
            on.main {
                if magnet.frame.origin.x != self.mainMagnet.frame.origin.x || magnet.frame.origin.y != self.mainMagnet.frame.origin.y {
                    self.animate(magnet: magnet)
                } else {
                    magnet.backgroundColor = UIColor.yellow
                }
            }
        })
    }
}

