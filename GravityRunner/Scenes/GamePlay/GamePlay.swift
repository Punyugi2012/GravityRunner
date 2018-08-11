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
    override func didMove(to view: SKView) {
        initGame()
    }
    private func initGame() {
        mainCamera = childNode(withName: "MainCamera") as? SKCameraNode
    }
    override func update(_ currentTime: TimeInterval) {
        mainCamera?.position.x += 10
    }
}
