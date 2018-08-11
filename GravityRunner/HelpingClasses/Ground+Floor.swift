//
//  Ground+Floor.swift
//  GravityRunner
//
//  Created by punyawee  on 11/8/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import SpriteKit

class Ground_Floor: SKSpriteNode {
    func initGroundAndFloor() {
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody?.categoryBitMask = ColliderType.GROUND_AND_FLOOR
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.isDynamic = false
    }
}
