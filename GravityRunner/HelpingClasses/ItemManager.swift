//
//  Item.swift
//  GravityRunner
//
//  Created by punyawee  on 11/8/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import SpriteKit

class ItemManger {
    static func getItem(minY: CGFloat, maxY: CGFloat, positionXCamera: CGFloat) -> SKSpriteNode {
        let randomForTypeItem = randomBetweenNumbers(first: 1, second: 20)
        var item: SKSpriteNode
        if randomForTypeItem >= 16 {
            item = SKSpriteNode(imageNamed: "ring")
            item.name = "Ring"
            item.size = CGSize(width: 50, height: 50)
            item.physicsBody = SKPhysicsBody(circleOfRadius: item.size.height / 2)
        }
        else {
            item = SKSpriteNode(imageNamed: "fire1")
            item.name = "Fire"
            item.size = CGSize(width: 50, height: 50)
            item.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: item.size.width - 30, height: item.size.height - 30))
            var textures = [SKTexture]()
            for i in 1...12 {
                textures.append(SKTexture(imageNamed: "fire\(i)"))
            }
            item.run(SKAction.repeatForever(SKAction.animate(with: textures, timePerFrame: 0.1, resize: true, restore: false)))
            let moveAction = SKAction.moveBy(x: -4, y: 0, duration: 0.05)
            item.run(SKAction.repeatForever(moveAction))
        }
        item.physicsBody?.categoryBitMask = ColliderType.FIRE_AND_RING
        item.physicsBody?.contactTestBitMask = ColliderType.PLAYER
        item.physicsBody?.collisionBitMask = ColliderType.PLAYER
        item.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        item.physicsBody?.affectedByGravity = false
        item.physicsBody?.isDynamic = false
        item.physicsBody?.restitution = 0.0
        item.position = CGPoint(x: positionXCamera + 800, y: randomBetweenNumbers(first: minY + 250, second: maxY - 250))
        item.zPosition = 1
        return item
    }
    static func randomBetweenNumbers(first: CGFloat, second: CGFloat) -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs(first - second) + min(first, second)
    }
}
