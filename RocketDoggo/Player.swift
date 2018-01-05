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

    var acceleration: Double = 0.4
    var topSpeed: Double = 1.0
    var verticalSpeed: Double = 0.0
    var verticalPosition: Double = 0.0

    private let topPart = TopPart()
    private let bodyPart = BodyPart()
    private let boosterPart = BoosterPart()
    var bla = Timer()
    
    func spawn() -> Void
    {
        setupRocket()
    }
    
    /// Connects all the rocket parts
    func setupRocket() -> Void
    {
        /* Sets up the top part */
        let top = SKShapeNode(rectOf: CGSize(width: self.topPart.width, height: self.topPart.height))
        top.fillTexture = SKTexture(imageNamed: self.topPart.textureName)
        top.fillColor = UIColor.white
        top.strokeColor = UIColor.clear
        top.position = CGPoint(x: 0, y: 0 - self.topPart.height / 2)
        
        /* Sets up the body part */
        let body = SKShapeNode(rectOf: CGSize(width: self.bodyPart.width, height: self.bodyPart.height))
        body.fillTexture = SKTexture(imageNamed: self.bodyPart.textureName)
        body.fillColor = UIColor.white
        body.strokeColor = UIColor.clear
        body.position = CGPoint(x: 0, y: 0 - self.bodyPart.height / 2 - self.topPart.height / 2)
        
        /* Sets up the booster part */
        let booster = SKShapeNode(rectOf: CGSize(width: self.boosterPart.width, height: self.boosterPart.height))
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
        bla.invalidate()
        bla = Timer.scheduledTimer(timeInterval: self.acceleration, target: self, selector: #selector(self.speedUp), userInfo: nil, repeats: true)
    }
    
    func removeAcceleration() -> Void
    {
        bla.invalidate()
        bla = Timer.scheduledTimer(timeInterval: self.acceleration, target: self, selector: #selector(self.speedDown), userInfo: nil, repeats: true)
    }
    
    @objc func speedUp()
    {
        if self.verticalSpeed <= self.topSpeed
        {
            self.verticalSpeed += 0.1
            print("Speed is \(self.verticalSpeed)")
        }
    }
    @objc func speedDown()
    {
        if self.verticalSpeed >= 0 - self.topSpeed
        {
            self.verticalSpeed -= 0.1
            print("Speed is \(self.verticalSpeed)")
        }
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

