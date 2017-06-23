//
//  Grid.swift
//  GameOfLife
//
//  Created by Pavan Sabnis on 6/22/17.
//  Copyright © 2017 Pavan Sabnis. All rights reserved.
//

import SpriteKit

class Grid: SKSpriteNode { // subclass of SKSpriteNode, attributed to the custom class Grid
    //creature Array: 
    var gridArray = [[Creature]]()
    
    /* Grid array dimensions */
    let rows = 8
    let columns = 10
    
    //counters
    var generation = 0
    var population = 0
    
    //initializing the gridArray with appropriate dimensions
    
    
    /* Individual cell dimension, calculated in setup*/
    var cellWidth = 0
    var cellHeight = 0
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        /* Called when a touch begins */
        
        /* There will only be one touch as multi touch is not enabled by default */
        let touch = touches.first!
        let location = touch.location(in: self)
        
        //calculate grid array position
        let gridX = Int(location.x) / cellWidth
        let gridY = Int(location.y) / cellHeight
        
        //toggle creature visibility
        let creature = gridArray[gridX][gridY]
        creature.isAlive = !creature.isAlive // if alive, dead. if dead, alive
    }
    
    /* You are required to implement this for your subclass to work */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        /* Enable own touch implementation for this node */
        isUserInteractionEnabled = true
        
        /* Calculate individual cell dimensions */
        cellWidth = Int(size.width) / columns
        cellHeight = Int(size.height) / rows
        
        //populate grid with creatures
        populateGrid()
        
        
    }
    
    func addCreatureAtGrid(x:Int, y:Int) {// uses the actual graphics-CGPoit, and also sets basic defaults
        //new creature object
        let creature = Creature()
        
        //calculate position on screen
        let gridPosition = CGPoint(x: x * cellWidth, y: y * cellHeight)
        creature.position = gridPosition
        
        //set default isAlive
        creature.isAlive = false
        
        //add creature to grid node. This is also what enables the displaying of creature
        addChild(creature)
        
        //add creature to grid array
        gridArray[x].append(creature)
        
    }
    
    func populateGrid() {
        /*populate the grid with creatures*/
        
        //loop through columns
        for gridX:Int in 0..<columns {
            
            //initialize empty column
            gridArray.append([])
            
            //loop through rows
            for gridY in 0..<rows {
                //create a new creature at row/column position
                addCreatureAtGrid(x: gridX, y: gridY)
            }
        }
    }
    
}
