//
//  DeleteLater.swift
//  RocketDoggo
//
//  Created by Martine Onstad on 06/01/2018.
//  Copyright © 2018 Ole Onstad. All rights reserved.
//
import SpriteKit
import GameplayKit

class DeleteLater: SKScene {
    
    let sprite = SKShapeNode(circleOfRadius: 50)

    override func didMove(to view: SKView) {
        self.backgroundColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 200 / 255, alpha: 1)
        self.size = view.bounds.size
        
        sprite.fillColor = UIColor.green
        sprite.strokeColor = UIColor.green
        sprite.glowWidth = 5
        sprite.position = CGPoint(x: 0, y: 0)
        
        self.addChild(sprite)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches ) {
            let location = touch.location(in: self)
            
            if sprite.contains(location) {
                sprite.position = location
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches ) {
            let location = touch.location(in: self)
            
            if sprite.contains(location) {
                sprite.position = location
            }
        }
    }

}
