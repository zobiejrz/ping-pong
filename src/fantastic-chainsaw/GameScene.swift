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
    
    // Score [Left, Right]
    var Score = [0, 0]
    
    override func sceneDidLoad() {
        self.Ball = self.childNode(withName: "Ball") as! SKSpriteNode
        self.Ball.physicsBody!.contactTestBitMask = Ball.physicsBody!.collisionBitMask
        
        self.LeftPlayer = self.childNode(withName: "LeftPlayer") as! SKSpriteNode
        self.RightPlayer = self.childNode(withName: "RightPlayer") as! SKSpriteNode
        
        self.LeftLbl = self.childNode(withName: "LeftLbl") as! SKLabelNode
        self.RightLbl = self.childNode(withName: "RightLbl") as! SKLabelNode
        
        
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        
        self.physicsBody = border
        
        startPoint()
    }
    
    func startPoint() {
        // Update score labels
        self.LeftLbl.text = String(self.Score[0])
        self.RightLbl.text = String(self.Score[1])
        
        // Set Ball Position to (0,0) and set v = 0
        self.Ball.position.x = 0
        self.Ball.position.y = 0
        self.Ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        
        // Give ball an intial impulse
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            // Put your code which should be executed with a delay here
            self.Ball.physicsBody?.applyImpulse(CGVector(dx: 5, dy: 5)) // CANNOT GO ANY SLOWER THAN (dx: 5 dy: 5), otherwise the ball can't bounce
        })
    }
    
    override func keyUp(with event: NSEvent) {
        switch event.keyCode {
        case 1:
            print("leftdown")
            self.LDown = false
        case 13:
            print("leftup")
            self.LUp = false
        case 126:
            print("rightup")
            self.RUp = false
        case 125:
            print("rightdown")
            self.RDown = false
        default:
            print(event.keyCode)
        }
    }
    
    override func keyDown(with event: NSEvent) {
        switch event.keyCode {
        case 1:
            print("leftdown")
            self.LDown = true
        case 13:
            print("leftup")
            self.LUp = true
        case 126:
            print("rightup")
            self.RUp = true
        case 125:
            print("rightdown")
            self.RDown = true
        default:
            print(event.keyCode)
        }
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // ===== Move the players based on their booleans =====
        if LDown { // DOWN
            self.LeftPlayer.run(SKAction.moveTo(y: self.LeftPlayer.position.y-20, duration: 0.1))
        }
        else if LUp { // UP
            self.LeftPlayer.run(SKAction.moveTo(y: self.LeftPlayer.position.y+20, duration: 0.1))
        }
        
        if RDown { // DOWN
            self.RightPlayer.run(SKAction.moveTo(y: self.RightPlayer.position.y-20, duration: 0.1))
        } else if RUp { // UP
            self.RightPlayer.run(SKAction.moveTo(y: self.RightPlayer.position.y+20, duration: 0.1))
        }
        
        // ===== Check to see if someone made a point =====
        if self.Ball.position.x < -470 {
            self.Score[0] += 1
            startPoint()
        } else if self.Ball.position.x > 470 {
            self.Score[1] += 1
            startPoint()
        }
    }
}
