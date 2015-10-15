//
//  MainMenu.swift
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



class MainMenu: SKScene  {
    
    let background = SKSpriteNode(imageNamed: "Background")
    let startButton = SKSpriteNode(imageNamed: "StartButton")

    
    
    
    
    
    
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
    
    
    
    override func didMoveToView(view: SKView) {
        
       
        
        self.startButton.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        self.background.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        self.addChild(self.background)
        self.background.zPosition = 1
        self.startButton.zPosition = 2
        
        self.addChild(self.startButton)
    }
    
    
    
    func moveSceneToGame() {
        var scene = InGameScene(size: self.size)
        let skView = self.view as SKView!
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .AspectFill
        scene.size = skView.bounds.size
        scene.anchorPoint = CGPointMake(CGRectGetMidX(MainMenu().frame), CGRectGetMidY(MainMenu().frame))
        skView.presentScene(scene)
    }
    
    
    
    
    
    
    
    override func  touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            if self.nodeAtPoint(location) == self.startButton {
                moveSceneToGame()
                            }
                }
        
    }
    
    
    
    
    
    
    
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
}

