//
//  Background.swift
//  GravityRunner
//
//  Created by punyawee  on 11/8/61.
//  Copyright © พ.ศ. 2561 Punyugi. All rights reserved.
//

import SpriteKit


class Background: SKSpriteNode {
    func move(camera: SKCameraNode?) {
        if let camera = camera {
            if camera.position.x > self.size.width + self.position.x {
                self.position.x += self.size.width * 3
                print("moved")
            }
        }
    }
}
