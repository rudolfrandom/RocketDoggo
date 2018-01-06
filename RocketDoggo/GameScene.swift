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
    var particelBool : Bool = true
    
    override func didMove(to view: SKView)
    {
        /* Sets up the scene */
        self.backgroundColor = UIColor.blue // delete later
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
        self.view?.addSubview(boostBotton)

    }
    
    @objc func acceleratePlayerUp()
    {
        self.player.addAcceleration()
        // start fire
        if particelBool == true {
        particelBool = false
        fireParticle?.targetNode = player
        fireParticle?.zPosition = -1
        fireParticle?.position = CGPoint(x: 0, y: 0)
        //BoosterPart.addChild(fireParticle)
        //player.booster.addChild(fireParticle)
        // Add childen til boosteren ^
        }
    }
    @objc func acceleratePlayerDown()
    {
        self.player.removeAcceleration()
        // stop fire
    }

    override func update(_ currentTime: TimeInterval)
    {
        let playerVerticalPosision: CGFloat = self.player.updateVerticalPosition()
      
        self.ground.move(playerPosition: playerVerticalPosision)
    }
}
