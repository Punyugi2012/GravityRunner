//
//  Player.swift
//  GravityRunner
//
//  Created by punyawee  on 11/8/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    func initPlayer() {
        var textures = [SKTexture]()
        for i in 1...8 {
            textures.append(SKTexture(imageNamed: "player\(i)"))
        }
        self.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1, resize: true, restore: false)))
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width, height: self.size.height))
        self.physicsBody?.categoryBitMask = ColliderType.PLAYER
        self.physicsBody?.contactTestBitMask = ColliderType.FIRE_AND_RING
        self.physicsBody?.restitution = 0.0
    }
    
    func reversePlayer() {
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        self.yScale *= -1
    }
    
    func move() {
        self.position.x += 10
    }
}
