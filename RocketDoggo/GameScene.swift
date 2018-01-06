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

    /* Creates objects from Classes */
    let player = Player()
    let ground = Ground()
    let boosterEffects = BoosterEffects()
    let boostBotton = UIButton(type: UIButtonType.custom) as UIButton

    var particelBool : Bool = true // dleete=???

    
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
        
        /* Adds a boost button to the scene */
        boostBotton.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        boostBotton.addTarget(self, action: #selector(GameScene.acceleratePlayerUp), for: UIControlEvents.touchDown)
        boostBotton.addTarget(self, action: #selector(GameScene.acceleratePlayerDown), for: UIControlEvents.touchUpInside)
        boostBotton.addTarget(self, action: #selector(GameScene.moveRocket), for: UIControlEvents.touchDragInside)
        self.view?.addSubview(boostBotton)
        

        /* Adds particle effects to the booster */
        self.boosterEffects.spawn(targetNode: player)

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
        self.boosterEffects.start()

    }

    @objc func acceleratePlayerDown()
    {
        self.player.removeAcceleration()
        self.boosterEffects.stop()
        

    }

    override func update(_ currentTime: TimeInterval)
    {
        let playerVerticalPosision: CGFloat = self.player.updateVerticalPosition()
      
        self.ground.move(playerPosition: playerVerticalPosision)
    }
}
