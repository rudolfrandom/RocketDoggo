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


    private var acceleration: Double = 0.04
    private var topSpeed: CGFloat = 1.0
    private var verticalSpeed: CGFloat = 0.0
    private var verticalPosition: CGFloat = 0.0

    private let topPart = TopPart()
    private let bodyPart = BodyPart()
    private let boosterPart = BoosterPart()

    var top = SKShapeNode(), body = SKShapeNode(), booster = SKShapeNode()
    
    private var timer = Timer()

    /// Spawns the rocket
    func spawn() -> Void
    {
        setupRocket()
    }
    
    /// Connects all the rocket parts
    private func setupRocket() -> Void
    {
        /* Sets up the top part */
        top = SKShapeNode(rectOf: CGSize(width: self.topPart.width, height: self.topPart.height))
        top.fillTexture = SKTexture(imageNamed: self.topPart.textureName)
        top.fillColor = UIColor.white
        top.strokeColor = UIColor.clear
        top.position = CGPoint(x: 0, y: 0 - self.topPart.height / 2)
        
        /* Sets up the body part */
        body = SKShapeNode(rectOf: CGSize(width: self.bodyPart.width, height: self.bodyPart.height))
        body.fillTexture = SKTexture(imageNamed: self.bodyPart.textureName)
        body.fillColor = UIColor.white
        body.strokeColor = UIColor.clear
        body.position = CGPoint(x: 0, y: 0 - self.bodyPart.height / 2 - self.topPart.height / 2)
        
        /* Sets up the booster part */
        booster = SKShapeNode(rectOf: CGSize(width: self.boosterPart.width, height: self.boosterPart.height))
        booster.fillTexture = SKTexture(imageNamed: self.boosterPart.textureName)
        booster.fillColor = UIColor.white
        booster.strokeColor = UIColor.clear
        booster.position = CGPoint(x: 0, y: 0 - bodyPart.height / 2 - boosterPart.height / 2)
     
        /* Adds them to the rocket */
        self.addChild(top)
        top.addChild(body)
        body.addChild(booster)

    }
    
    /// Returns the height of the rocket
    func getHeight() -> CGFloat
    {
        return CGFloat(self.topPart.height + self.bodyPart.height + self.boosterPart.height)
    }
    
    func addAcceleration() -> Void
    {

        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: self.acceleration,
                                     target: self, selector: #selector(self.speedUp), userInfo: nil, repeats: true)

    }
    
    func removeAcceleration() -> Void
    {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: self.acceleration, target: self, selector: #selector(self.speedDown), userInfo: nil, repeats: true)

    }
    
    @objc func speedUp()
    {
        if self.verticalSpeed <= self.topSpeed
        {
            self.verticalSpeed += 0.1
        }
    }
    @objc func speedDown()
    {
        if self.verticalSpeed >= 0 - self.topSpeed
        {
            self.verticalSpeed -= 0.1
        }
    }
    func updateVerticalPosition() -> Void
    {
        self.verticalPosition += self.verticalSpeed / 100
    }
    func updateVerticalPosition() -> CGFloat
    {
        self.verticalPosition += self.verticalSpeed / 100
        return self.verticalPosition
    }

}

class TopPart {
    let height = 20
    let width = 20
    let health: Float = 0.0
    let textureName = "rocketTopBasic"
}

class BodyPart {
    let height = 30
    let width = 20
    let health: Float = 0.0
    let textureName = "rocketBodyBasic"
}

class BoosterPart {
    let height = 10
    let width = 20
    let health: Float = 0.0
    let textureName = "rocketTopBasic"
}

