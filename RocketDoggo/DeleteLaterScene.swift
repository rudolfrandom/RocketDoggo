//
//  DeleteLater.swift
//  RocketDoggo
//
//  Created by Martine Onstad on 06/01/2018.
//  Copyright © 2018 Ole Onstad. All rights reserved.
//

import SpriteKit
import GameplayKit

class DeleteLaterScene: SKScene {

    let sprite = SKShapeNode(circleOfRadius: 50)
    let sprite2 = SKShapeNode(circleOfRadius: 50)

    override func didMove(to view: SKView) {

        self.backgroundColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 200 / 255, alpha: 1)
        self.size = view.bounds.size
        
        sprite.fillColor = UIColor.green
        sprite.strokeColor = UIColor.green
        sprite.position = CGPoint(x: 0, y: 0)
        
        self.addChild(sprite)
        
        sprite2.fillColor = UIColor.red
        sprite2.strokeColor = UIColor.red
        sprite2.position = CGPoint(x: 0, y: 0 - 100)
        
        self.addChild(sprite2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches ) {
            let location = touch.location(in: self)
            
            if sprite.contains(location) {
                sprite.position = location
            }
            else if sprite2.contains(location) {
                sprite2.position = location
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches ) {
            let location = touch.location(in: self)
            
            if sprite.contains(location) {
                sprite.position = location
            }
            else if sprite2.contains(location) {
                sprite2.position = location
            }
        }
    }
}
