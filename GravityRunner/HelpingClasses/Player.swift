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
        self.size = CGSize(width: 90, height: 90)
        self.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1, resize: true, restore: false)))
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width - 30, height: self.size.height - 10))
        self.physicsBody?.categoryBitMask = ColliderType.PLAYER
        self.physicsBody?.categoryBitMask = ColliderType.GROUND_AND_FLOOR
        self.physicsBody?.collisionBitMask = ColliderType.PLAYER
        self.physicsBody?.restitution = 0.0
    }
    
    func reversePlayer() {
        self.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        self.yScale *= -1
    }
    
    func move() {
        self.position.x += 5
    }
}
