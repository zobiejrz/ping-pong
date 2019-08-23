//
//  GameScene.swift
//  fantastic-chainsaw
//
//  Created by Ben Zobrist on 8/21/19.
//  Copyright © 2019 Ben Zobrist. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var Ball = SKSpriteNode()
    var LeftPlayer = SKSpriteNode()
    var RightPlayer = SKSpriteNode()
    
    var LeftLbl = SKLabelNode()
    var RightLbl = SKLabelNode()
    
    override func sceneDidLoad() {
        Ball = self.childNode(withName: "Ball") as! SKSpriteNode
        LeftPlayer = self.childNode(withName: "LeftPlayer") as! SKSpriteNode
        RightPlayer = self.childNode(withName: "RightPlayer") as! SKSpriteNode
        
        LeftLbl = self.childNode(withName: "LeftLbl") as! SKLabelNode
        RightLbl = self.childNode(withName: "RightLbl") as! SKLabelNode
        
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
            case 1:
                print("down")
            case 13:
                print("up")
            
            default:
                print("keyDown: \(event.characters!) keyCode: \(event.keyCode)")
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered

    }
}
