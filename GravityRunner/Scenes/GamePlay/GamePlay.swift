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
    var outOfBoundTimer: Timer?
    override func didMove(to view: SKView) {
        initGame()
        physicsWorld.contactDelegate = self
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
        Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(spawnItem), userInfo: nil, repeats: true)
        outOfBoundTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(clearOutOfBound), userInfo: self, repeats: true)
        
    }
    @objc private func clearOutOfBound() {
        for child in children {
            if (child.name == "Ring" || child.name == "Fire") && (child.position.x < mainCamera!.position.x - 500) {
                child.removeFromParent()
                print("OutOfBound Removed")
            }
        }
    }
    @objc private func spawnItem() {
        addChild(ItemManger.getItem(minY: self.frame.minY, maxY: self.frame.maxY, positionXCamera: (mainCamera?.position.x)!))
    }
    override func update(_ currentTime: TimeInterval) {
        mainCamera?.position.x += 10
        background1?.move(camera: mainCamera)
        background2?.move(camera: mainCamera)
        background3?.move(camera: mainCamera)
        player?.move()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        physicsWorld.gravity.dy *= -1
        player?.reversePlayer()
    }
}

extension GamePlay: SKPhysicsContactDelegate {
    func didBegin(_ contact: SKPhysicsContact) {
        print("Have a contact")
        if contact.bodyA.node?.name == "Player" && contact.bodyB.node?.name == "Ring" {
            contact.bodyB.node?.removeFromParent()
        }
        else if contact.bodyA.node?.name == "Player" && contact.bodyB.node?.name == "Fire" {
            if let gamePlayScene = GamePlay(fileNamed: "GamePlay") {
                view!.presentScene(gamePlayScene)
            }
        }
        
    }
}
