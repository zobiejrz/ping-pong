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
    
    // Left and Right Movement Variables
    var LUp = false
    var LDown = false
    var RUp = false
    var RDown = false
    
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
    
    override func keyUp(with event: NSEvent) {
        switch event.keyCode {
        case 1:
            print("leftdown")
            LDown = false
        case 13:
            print("leftup")
            LUp = false
        case 126:
            print("rightup")
            RUp = false
        case 125:
            print("rightdown")
            RDown = false
        default:
            print(event.keyCode)
        }
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 1:
            print("leftdown")
            LDown = true
        case 13:
            print("leftup")
            LUp = true
        case 126:
            print("rightup")
            RUp = true
        case 125:
            print("rightdown")
            RDown = true
        default:
            print(event.keyCode)
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // ===== Move the players based on their booleans =====
        if LDown { // DOWN
            LeftPlayer.run(SKAction.moveTo(y: LeftPlayer.position.y-20, duration: 0.1))
        }
        else if LUp { // UP
            LeftPlayer.run(SKAction.moveTo(y: LeftPlayer.position.y+20, duration: 0.1))
        }
        
        if RDown { // DOWN
            RightPlayer.run(SKAction.moveTo(y: RightPlayer.position.y-20, duration: 0.1))
        } else if RUp { // UP
            RightPlayer.run(SKAction.moveTo(y: RightPlayer.position.y+20, duration: 0.1))
        }
    }
}
