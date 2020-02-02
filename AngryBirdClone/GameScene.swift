//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by Marcus Vinicius Galdino Medeiros on 01/02/20.
//  Copyright © 2020 Marcus Vinicius Galdino Medeiros. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //var bird2 = SKSpriteNode()
    var bird = SKSpriteNode()
    var box1 = SKSpriteNode()
    var box2 = SKSpriteNode()
    var box3 = SKSpriteNode()
    var box4 = SKSpriteNode()
    var box5 = SKSpriteNode()
    var box6 = SKSpriteNode()
    
    var gameStarted = false
    
    override func didMove(to view: SKView) {
        
        /*let texture = SKTexture(imageNamed: "bird")
        bird2 = SKSpriteNode(texture: texture)
        bird2.position = CGPoint(x: -self.frame.width / 4, y: -self.frame.height / 4)
        bird2.size = CGSize(width: self.frame.width / 16, height: self.frame.height / 10)
        bird2.zPosition = 1
        self.addChild(bird2)*/
        
        // Physics Body
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        
        // Bird
        bird = childNode(withName: "bird") as! SKSpriteNode
        
        let birdTexture = SKTexture(imageNamed: "bird")
        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height/13)
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.15
        
        //Box
        let boxTexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: boxTexture.size().width / 6, height: boxTexture.size().height / 6)
        
        box1 = childNode(withName: "box1") as! SKSpriteNode
        setBoxSettings(box: box1, size: size)
        
        box2 = childNode(withName: "box2") as! SKSpriteNode
        setBoxSettings(box: box2, size: size)
        
        box3 = childNode(withName: "box3") as! SKSpriteNode
        setBoxSettings(box: box3, size: size)
        
        box4 = childNode(withName: "box4") as! SKSpriteNode
        setBoxSettings(box: box4, size: size)
        
        box5 = childNode(withName: "box5") as! SKSpriteNode
        setBoxSettings(box: box5, size: size)
        
        box6 = childNode(withName: "box6") as! SKSpriteNode
        setBoxSettings(box: box6, size: size)
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /*
        bird.physicsBody?.applyImpulse(CGVector(dx: 50, dy: 100))
        bird.physicsBody?.affectedByGravity = true*/
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if gameStarted == false {
            if let touch = touches.first {
                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)
                
                if touchNodes.isEmpty == false {
                    for node in touchNodes {
                        if let sprite = node as? SKSpriteNode {
                            if sprite == bird {
                                bird.position = touchLocation
                            }
                        }
                    }
                }
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func setBoxSettings(box: SKSpriteNode, size: CGSize){
        box.physicsBody = SKPhysicsBody(rectangleOf: size)
        box.physicsBody?.isDynamic = true
        box.physicsBody?.affectedByGravity = true
        box.physicsBody?.allowsRotation = true
        box.physicsBody?.mass = 0.4
    }
}
