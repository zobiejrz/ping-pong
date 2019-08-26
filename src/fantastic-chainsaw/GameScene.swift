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
    
    // Variables that are played with
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
    
    // ===== DEBUGGING VARIABLES =====
    let scoreLength = CGFloat(460) // The ±x that the Ball must surpass for a point condition
    let paddleDistance = CGFloat(450) // The ±x location of the paddle
    let paddleSpeed = CGFloat(10) // The verticle speed of the Paddle
    let ballSpeed = CGVector(dx: 20, dy: 20) // The Speed of the ball. CANNOT GO ANY SLOWER THAN (dx: 5 dy: 5), otherwise the ball can't bounce
    let height = CGFloat(384) // The ±y coordinate of the screen
    
    override func sceneDidLoad() {
        /*Initialize Game Scene*/
        
        // ===== Initialize variables from GameScene.sks =====
        self.Ball = self.childNode(withName: "Ball") as! SKSpriteNode
//        self.Ball.physicsBody!.contactTestBitMask = Ball.physicsBody!.collisionBitMask
        
        self.LeftPlayer = self.childNode(withName: "LeftPlayer") as! SKSpriteNode
            self.LeftPlayer.position.x = -self.paddleDistance
        self.RightPlayer = self.childNode(withName: "RightPlayer") as! SKSpriteNode
            self.RightPlayer.position.x = self.paddleDistance
        
        self.LeftLbl = self.childNode(withName: "LeftLbl") as! SKLabelNode
        self.RightLbl = self.childNode(withName: "RightLbl") as! SKLabelNode
        
        // ===== Set Up Physics Border =====
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        
        border.friction = 0
        border.restitution = 1
        border.isDynamic = true
        
        self.physicsBody = border
        
        // ===== Start Game =====
        startPoint()
        
    }
    
    func startPoint() {
        /* This starts a new point, not a new game. */
        
        // Update score labels
        self.LeftLbl.text = String(self.Score[0])
        self.RightLbl.text = String(self.Score[1])
        
        // Set Ball Position to (0,0) and set v = 0
        self.Ball.position.x = 0
        self.Ball.position.y = 0
        self.Ball.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        
        // Give ball an intial impulse after 2 second delay
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(2), execute: {
            self.Ball.physicsBody?.applyImpulse(self.ballSpeed)
        })
        
    }
    
    override func keyUp(with event: NSEvent) {
        /* Stops moving on keyUp */
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
        /* Starts moving on keyDown */
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
        /*Moves Players and Checks if a point has been made*/
        
        // ===== Move the players based on their booleans =====
        if LDown { // DOWN
            self.LeftPlayer.position.y -= self.paddleSpeed
        }
        else if LUp { // UP
            self.LeftPlayer.position.y += self.paddleSpeed
        }
        
        if RDown { // DOWN
            self.RightPlayer.position.y -= self.paddleSpeed
        } else if RUp { // UP
            self.RightPlayer.position.y += self.paddleSpeed
        }
        
        // ===== Check to see if someone made a point =====
        if self.Ball.position.x < -self.scoreLength {
            self.Score[1] += 1
            startPoint()
        } else if self.Ball.position.x > self.scoreLength {
            self.Score[0] += 1
            startPoint()
        }

        // ===== Fix paddle Y coordinate if they are moved out of position =====
        if self.LeftPlayer.position.y > self.height {
            self.LeftPlayer.position.y = self.height
        } else if self.LeftPlayer.position.y < -self.height {
            self.LeftPlayer.position.y = -self.height
        }

        if self.RightPlayer.position.y > self.height {
            self.RightPlayer.position.y = self.height
        } else if self.RightPlayer.position.y < -self.height {
            self.RightPlayer.position.y = -self.height
        }
    }
}
