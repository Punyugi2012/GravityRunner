//
//  GamePlay.swift
//  GravityRunner
//
//  Created by punyawee  on 11/8/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import SpriteKit

class GamePlay: SKScene {
    var mainCamera: SKCameraNode?
    var player: Player?
    var background1: Background?
    var background2: Background?
    var background3: Background?
    override func didMove(to view: SKView) {
        initGame()
    }
    private func initGame() {
        mainCamera = childNode(withName: "MainCamera") as? SKCameraNode
        background1 = childNode(withName: "Background1") as? Background
        background2 = childNode(withName: "Background2") as? Background
        background3 = childNode(withName: "Background3") as? Background
        
        [background1, background2, background3].forEach { (background) in
            let ground = background?.childNode(withName: "Ground") as? Ground_Floor
            ground?.initGroundAndFloor()
            let floor = background?.childNode(withName: "Floor") as? Ground_Floor
            floor?.initGroundAndFloor()
        }
        
        player = childNode(withName: "Player") as? Player
        player?.initPlayer()
        
    }
    override func update(_ currentTime: TimeInterval) {
        mainCamera?.position.x += 10
        background1?.move(camera: mainCamera)
        background2?.move(camera: mainCamera)
        background3?.move(camera: mainCamera)
    }
}
