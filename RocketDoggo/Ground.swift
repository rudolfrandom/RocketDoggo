//
//  Ground.swift
//  RocketDoggo
//
//  Created by Martine Onstad on 05/01/2018.
//  Copyright © 2018 Ole Onstad. All rights reserved.
//

import SpriteKit
import GameplayKit

class Ground: SKScene, SKPhysicsContactDelegate {
    
    /* Variable for the position of the ground */
    var positionOfGround = CGPoint()
    
    /* Sets image of the ground */
    let textureName = "rocketBodyBasic"
    
    func spawn(heightOfRocketIs rocketHeight: CGFloat, andSizeOfScreenIs screenSize: CGSize) -> Void
    {
        let sizeOfGround = CGSize(width: screenSize.width, height: screenSize.height / 2 - rocketHeight)
        self.positionOfGround = CGPoint(x: 0, y: 0 - sizeOfGround.height / 2 - rocketHeight)
        let ground = SKShapeNode(rectOf: sizeOfGround)
        ground.fillTexture = SKTexture(imageNamed: self.textureName)
        ground.fillColor = UIColor.white
        ground.strokeColor = UIColor.clear
        ground.position = self.positionOfGround
        
        self.addChild(ground)
    }
}
