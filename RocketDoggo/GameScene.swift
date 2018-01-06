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

    override func didMove(to view: SKView)
    {
        /* Sets up the scene */
        self.backgroundColor = UIColor(red: 0 / 255, green: 0 / 255, blue: 200 / 255, alpha: 1) // delete later
        self.size = view.bounds.size

        /* Adds a player object to the scene */
        self.player.spawn(toScene: self)

        /* Adds a ground object to the scene */
        self.ground.spawn(toScene: self, heightOfRocketIs: player.getHeight(), andSizeOfScreenIs: self.size)

        /* Adds a boost button to the scene */
        boostBotton.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        boostBotton.addTarget(self, action: #selector(GameScene.acceleratePlayerUp), for: UIControlEvents.touchDown)
        boostBotton.addTarget(self, action: #selector(GameScene.acceleratePlayerDown), for: UIControlEvents.touchUpInside)
        boostBotton.addTarget(self, action: #selector(GameScene.movePlayer), for: UIControlEvents.touchDragInside)
        self.view?.addSubview(boostBotton)

        /* Adds particle effects to the booster */
        self.boosterEffects.spawn(to: player)
    }
    @objc func movePlayer(_ sender: Any, forEvent event: UIEvent)
    {
        let touches: Set<UITouch>? = event.touches(for: boostBotton)
        let touch: UITouch? = touches?.first
        let touchPoint: CGPoint? = touch?.location(in: self)
        let newPos = CGPoint(x: (touchPoint?.x)!, y: player.top.position.y)
        player.moveHorizontally(to: newPos)
    }

    @objc func acceleratePlayerUp(_ sender: Any, forEvent event: UIEvent)
    {
        self.player.addAcceleration()
        self.boosterEffects.start()
        
        let touches: Set<UITouch>? = event.touches(for: boostBotton)
        let touch: UITouch? = touches?.first
        let touchPoint: CGPoint? = touch?.location(in: self)
        let newPos = CGPoint(x: (touchPoint?.x)!, y: player.top.position.y)
        player.moveHorizontally(to: newPos)
    }

    @objc func acceleratePlayerDown()
    {
        self.player.removeAcceleration()
        self.boosterEffects.stop()
    }

    override func update(_ currentTime: TimeInterval)
    {
<<<<<<< HEAD
        let playerVerticalPosition: CGFloat = self.player.updateVerticalPosition()
      
        self.ground.move(playerPosition: playerVerticalPosition)
=======
        let playerVerticalPosision: CGFloat = self.player.updateVerticalPosition()
        self.player.update()
        self.ground.move(playerPosition: playerVerticalPosision)
>>>>>>> 17759f87974f41ed7c0ab81485f1f24ee980b035
    }
}
