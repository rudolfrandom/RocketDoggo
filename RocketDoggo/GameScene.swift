//
//  GameScene.swift
//  RocketDoggo
//
//  Created by Ole Onstad on 04.01.2018.
//  Copyright © 2018 Ole Onstad. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = UIColor.blue // delete later
        self.size = view.bounds.size
 
        let player = Player()
        player.spawn()
 
        self.addChild(player)
        let rocketHeight = player.getHeight()
        
        let groundSize = CGSize(width: frame.size.width, height: frame.size.height / 2 - rocketHeight)
        let groundPos = CGPoint(x: 0, y: 0 - groundSize.height / 2 - rocketHeight)
        let ground = SKShapeNode(rectOf: groundSize)
        ground.fillColor = UIColor.white
        ground.position = groundPos
        
        self.addChild(ground)
        
    }
    
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
