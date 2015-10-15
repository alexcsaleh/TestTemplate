//
//  InGameScene.swift
//  TestTemplate
//
//  Created by Alexander Saleh on 10/14/15.
//  Copyright (c) 2015 Moonwalk Studios. All rights reserved.
//

import SpriteKit
import UIKit
import Foundation
import AudioToolbox
import AVFoundation
import GameKit



class InGameScene: SKScene, SKPhysicsContactDelegate  {
    
    let transitionFade = SKTransition.fadeWithDuration(3.0)
    var background: SKSpriteNode

    
    override init(size: CGSize) {
        self.background = SKSpriteNode(imageNamed: "Background2")
        
        
        
        
       
        
        
        super.init(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    
    
    enum UIUserInterfaceIdiom : Int
    {
        case Unspecified
        case Phone
        case Pad
    }
    struct ScreenSize
    {
        static let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
        static let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
        static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
        static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    }
    struct DeviceType
    {
        static let IS_IPHONE_4_OR_LESS =  UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
        static let IS_IPHONE_5 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
        static let IS_IPHONE_6 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
        static let IS_IPHONE_6P = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
        static let IS_IPAD = UIDevice.currentDevice().userInterfaceIdiom == .Pad && ScreenSize.SCREEN_MAX_LENGTH == 1024.0
    }
    
    
    
    enum ColliderType: UInt32 {
        case Ball = 1
        case Blackhole1 = 2
        case Blackhole2 = 3
        
    }
    
    
    
    
    override func didMoveToView(view: SKView) {
        self.background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(self.background)
    }
    
    

    
    
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        var scene = MainMenu(size: self.size)
        let skView = self.view as SKView!
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .AspectFill
        scene.size = skView.bounds.size
        scene.anchorPoint = CGPointMake(CGRectGetMidX(MainMenu().frame), CGRectGetMidY(MainMenu().frame))
        skView.presentScene(scene, transition: transitionFade)
    }
    
    
    
 
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
    }
}
