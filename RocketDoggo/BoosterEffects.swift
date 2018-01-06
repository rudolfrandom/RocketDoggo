//
//  BoosterEffects.swift
//  RocketDoggo
//
//  Created by Martine Onstad on 06/01/2018.
//  Copyright © 2018 Ole Onstad. All rights reserved.
//

import SpriteKit
import GameplayKit

class BoosterEffects: SKEmitterNode {

    let fireParticle = SKEmitterNode(fileNamed: "Fire")
    let smokeParticle = SKEmitterNode(fileNamed: "Smoke")
    let rocketSmokeParticle = SKEmitterNode(fileNamed: "RocketSmoke")

    
    /// Spawns the booster effects
    func spawn(targetNode: Player) -> Void
    {
        // Fire particle
        self.fireParticle?.targetNode = targetNode
        self.fireParticle?.xScale = 0.1
        self.fireParticle?.zPosition = -1
        self.fireParticle?.position = CGPoint(x: 0, y: 0 - targetNode.getBoosterHeight())
        self.fireParticle?.particleBirthRate = 0
        targetNode.booster.addChild(fireParticle!)
        
        self.rocketSmokeParticle?.targetNode = targetNode
        self.rocketSmokeParticle?.xScale = 0.1
        self.rocketSmokeParticle?.zPosition = -1
        self.rocketSmokeParticle?.position = CGPoint(x: 0, y: 0 - targetNode.getBoosterHeight())
        self.rocketSmokeParticle?.particleBirthRate = 0
        targetNode.booster.addChild(rocketSmokeParticle!)
    }
    
    func start() -> Void
    {
        self.fireParticle?.particleBirthRate = 50
        self.rocketSmokeParticle?.particleBirthRate = 10
    }
    
    func stop() -> Void
    {
        self.fireParticle?.particleBirthRate = 0
        self.rocketSmokeParticle?.particleBirthRate = 0
    }
}