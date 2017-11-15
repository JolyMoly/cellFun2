//
//  spaceShip.swift
//  cellFun
//
//  Created by Vsevolod Doroshenko on 14.11.2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import ARKit

class spaceShip: SCNNode {
    func loadModel(){
        guard let virtualObjectScene = SCNScene(named: "art.scnassets/ship.scn") else {return}
        
        let wrapperNode =  SCNNode()
        for child in virtualObjectScene.rootNode.childNodes{
            wrapperNode.addChildNode(child)
            
        }
        self.addChildNode(wrapperNode)
    }

}
