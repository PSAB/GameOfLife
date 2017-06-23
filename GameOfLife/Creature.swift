//
//  Creature.swift
//  GameOfLife
//
//  Created by Pavan Sabnis on 6/22/17.
//  Copyright © 2017 Pavan Sabnis. All rights reserved.
//

import SpriteKit

class Creature: SKSpriteNode { // Like grid, also a subclass of SKSpriteNode
    //2 important additions in Creature subclass: 
        //- isAlive.... if dead, you want to hide it with the hidden property
        //neighborCount
    
    /* Character side */
    var isAlive: Bool = false {
        didSet {
            /* Visibility */
            isHidden = !isAlive
        }
    }
    
    /* Living neighbor counter */
    var neighborCount = 0
    
    init() {
        /* Initialize with 'bubble' asset */
        let texture = SKTexture(imageNamed: "bubble")
        //initialize as normal SKSpriteNode
        super.init(texture: texture, color: UIColor.clear, size: texture.size()) //calling the parent SKSpritenode
        
        /* Set Z-Position, ensure it's on top of grid */
        zPosition = 1
        
        /* Set anchor point to bottom-left */
        anchorPoint = CGPoint(x: 0, y: 0)
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
