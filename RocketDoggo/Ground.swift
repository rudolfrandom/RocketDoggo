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
    private var positionOfGround = CGPoint()
    private var sizeOfGround = CGSize()
    
    /* Sets image of the ground */
    private let textureName = "rocketBodyBasic"
    
    private var ground = SKShapeNode()
    
    func spawn(toScene scene: SKScene, heightOfRocketIs rocketHeight: CGFloat, andSizeOfScreenIs screenSize: CGSize) -> Void
    {
        self.sizeOfGround = CGSize(width: screenSize.width, height: screenSize.height / 2 - rocketHeight)
        self.positionOfGround = CGPoint(x: 0, y: 0 - sizeOfGround.height / 2 - rocketHeight)
        self.ground = SKShapeNode(rectOf: sizeOfGround)
        self.ground.fillTexture = SKTexture(imageNamed: self.textureName)
        self.ground.fillColor = UIColor.white
        self.ground.strokeColor = UIColor.clear
        self.ground.position = self.positionOfGround
        
        self.addChild(ground)
        scene.addChild(self)
    }
    
    func move(playerPosition: CGFloat) -> Void
    {
        self.ground.position.y -= playerPosition
    }
}
