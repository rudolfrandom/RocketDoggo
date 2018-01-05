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

    /* Makes constants from Classes */
    let player = Player()
    let ground = Ground()
    let boostBotton = UIButton(type: UIButtonType.custom) as UIButton
    
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
    }
    @objc func acceleratePlayerDown()
    {
        self.player.removeAcceleration()
    }
    
    override func update(_ currentTime: TimeInterval)
    {
        let playerVerticalPosision: CGFloat = self.player.updateVerticalPosition()
        //print("The pos of the player is \(playerVerticalPosision)")
        self.ground.move(playerPosition: playerVerticalPosision)
    }
}
