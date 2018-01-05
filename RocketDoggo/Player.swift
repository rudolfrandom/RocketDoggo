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

    let verticalSpeed: Double = 0

    let topPart = TopPart()
    let bodyPart = BodyPart()
    let boosterPart = BoosterPart()

    func spawn() -> Void
    {
        setupRocket()
    }
    
    func setupRocket() -> Void
    {
        
        let top = SKShapeNode(rectOf: CGSize(width: self.topPart.width, height: self.topPart.height))
        top.fillTexture = SKTexture(imageNamed: self.topPart.textureName)
        top.fillColor = self.topPart.fillColor
        top.strokeColor = self.topPart.strokeColor
        top.position = CGPoint(x: 0, y: 0 - self.topPart.height / 2)
        
        let body = SKShapeNode(rectOf: CGSize(width: self.bodyPart.width, height: self.bodyPart.height))
        body.fillTexture = SKTexture(imageNamed: self.bodyPart.textureName)
        body.fillColor = self.bodyPart.fillColor
        body.strokeColor = self.bodyPart.strokeColor
        body.position = CGPoint(x: 0, y: 0 - self.bodyPart.height / 2 - self.topPart.height / 2)
        
        let booster = SKShapeNode(rectOf: CGSize(width: self.boosterPart.width, height: self.boosterPart.height))
        booster.fillTexture = SKTexture(imageNamed: self.boosterPart.textureName)
        booster.fillColor = self.boosterPart.fillColor
        booster.strokeColor = self.boosterPart.strokeColor
        booster.position = CGPoint(x: 0, y: 0 - bodyPart.height / 2 - boosterPart.height / 2)
     
        self.addChild(top)
        top.addChild(body)
        body.addChild(booster)
    
    }
    
    /// Returns the height of the rocket
    func getHeight() -> CGFloat
    {
        return CGFloat(self.topPart.height + self.bodyPart.height + self.boosterPart.height)
    }
}

class TopPart {
    let height = 20
    let width = 20
    let health: Float = 0.0
    let textureName = "rocketTopBasic"
    let fillColor = UIColor.white
    let strokeColor = UIColor.clear
}

class BodyPart {
    let height = 30
    let width = 20
    let textureName = "rocketBodyBasic"
    let fillColor = UIColor.white
    let strokeColor = UIColor.clear
}

class BoosterPart {
    let height = 8
    let width = 20
    let textureName = "rocketTopBasic"
    let fillColor = UIColor.white
    let strokeColor = UIColor.clear
}

