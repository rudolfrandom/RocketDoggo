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
/*dum kommentar - slett neste gang noen leser dette*/
    /* Makes constants from Classes */
    let player = Player()
    let ground = Ground()
    let boostBotton = UIButton(type: UIButtonType.custom) as UIButton
    let fireParticle = SKEmitterNode(fileNamed: "Fire")
    let smokeParticle = SKEmitterNode(fileNamed: "Smoke")
    let rocketSmokeParticle = SKEmitterNode(fileNamed: "RocketSmoke")
    var particelBool : Bool = true
    
    override func didMove(to view: SKView)
    {
        /* Sets up the scene */
        self.backgroundColor = UIColor.black // delete later
        self.size = view.bounds.size

        /* Adds a player object to the scene */
        self.player.spawn()
        self.addChild(player)

        /* Adds a ground object to the scene */
        self.ground.spawn(heightOfRocketIs: player.getHeight(), andSizeOfScreenIs: self.size)
        self.addChild(ground)
        
        boostBotton.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        boostBotton.addTarget(self, action: #selector(GameScene.acceleratePlayerUp), for: UIControlEvents.touchDown)
        boostBotton.addTarget(self, action: #selector(GameScene.acceleratePlayerDown), for: UIControlEvents.touchUpInside)
        boostBotton.addTarget(self, action: #selector(GameScene.moveRocket), for: UIControlEvents.touchDragInside)
        self.view?.addSubview(boostBotton)
        
        // Fire particle
        fireParticle?.targetNode = player
        fireParticle?.xScale = 0.1
        fireParticle?.zPosition = -1
        fireParticle?.position = CGPoint(x: 0, y: 0)
        fireParticle?.particleBirthRate = 0
        player.booster.addChild(fireParticle!)
        
        // Smoke Particle
        rocketSmokeParticle?.targetNode = player
        rocketSmokeParticle?.xScale = 0.1
        rocketSmokeParticle?.zPosition = -1
        rocketSmokeParticle?.position = CGPoint(x: 0, y: 0)
        rocketSmokeParticle?.particleBirthRate = 0
        player.booster.addChild(rocketSmokeParticle!)
    
    }
    @objc func moveRocket(_ sender: Any, forEvent event: UIEvent)
    {
        let touches: Set<UITouch>? = event.touches(for: boostBotton)
        let touch: UITouch? = touches?.first
        let touchPoint: CGPoint? = touch?.location(in: boostBotton)
        let previousLocation = touch?.previousLocation(in: boostBotton)
        let diff = (touchPoint?.x)! - (previousLocation?.x)!
        let newPos = CGPoint(x: player.top.position.x + diff, y: player.top.position.y)
        
        player.top.position = newPos
    }
    
    @objc func acceleratePlayerUp()
    {
        self.player.addAcceleration()
        // start fire
        if particelBool == true {
        particelBool = false
        fireParticle?.particleBirthRate = 500
        rocketSmokeParticle?.particleBirthRate = 10
        }
    }
    @objc func acceleratePlayerDown()
    {
        self.player.removeAcceleration()
        // stop fire
        if particelBool == false {
            particelBool = true
            fireParticle?.particleBirthRate = 0
            rocketSmokeParticle?.particleBirthRate = 0
        }
    }

    override func update(_ currentTime: TimeInterval)
    {
        let playerVerticalPosision: CGFloat = self.player.updateVerticalPosition()
      
        self.ground.move(playerPosition: playerVerticalPosision)
    }
}
