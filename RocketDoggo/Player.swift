//
//  Player.swift
//  RocketDoggo
//
//  Created by Ole Onstad on 04.01.2018.
//  Copyright © 2018 Ole Onstad. All rights reserved.
//

import SpriteKit
import GameplayKit

class Player: SKScene, SKPhysicsContactDelegate {
    
    let topHeight = CGFloat(20)
    let topWidth = CGFloat(20)

    let topTexture = SKTexture(imageNamed: "rocketTopBasic")
    
    let top = SKShapeNode(rectOf: CGSize(width: 20, height: 20))
    
    let topPosition = CGPoint(x: 0, y: 0 - 10)
    let bodyPosition = CGPoint(x: 0, y: 0 - 25)
    
    let bodyTexture = SKTexture(imageNamed: "rocketBodyBasic")
    let body = SKShapeNode(rectOf: CGSize(width: 20, height: 30))
    
    let height = CGFloat(50)
    
    func go() -> Void {
    
        self.top.fillTexture = topTexture
        self.top.fillColor = UIColor.white
        self.top.strokeColor = UIColor.clear
        self.top.position = topPosition
        
        self.body.fillTexture = bodyTexture
        self.body.fillColor = UIColor.white
        self.body.strokeColor = UIColor.clear
        self.body.position = bodyPosition
        
        self.addChild(top)
        top.addChild(body)
    }

    
}

