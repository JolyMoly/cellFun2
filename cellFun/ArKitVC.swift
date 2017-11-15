//
//  ArKitVC.swift
//  cellFun
//
//  Created by Vsevolod Doroshenko on 13.11.2017.
//  Copyright © 2017 MAGNUMIUM. All rights reserved.
//

import UIKit
import ARKit
import AVFoundation

class ArKitVC: UIViewController {

    var counter:Int = 0{
        didSet{
            countLabel.text = "\(counter)"
        }
    }
    
    @IBOutlet weak var myArview: ARSCNView!
    @IBOutlet weak var countLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = SCNScene()
        
        myArview.scene = scene
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let configuration = ARWorldTrackingConfiguration()
        
        myArview.session.run(configuration)
        
        addObject()
    }

    func addObject() {
        let ship = spaceShip()
        ship.loadModel()
        
        let xPosition = randomPosition(lowerBound: -1.5, upperBound: 1.5)
        let yPosition = randomPosition(lowerBound: -1.5, upperBound: 1.5)
        let zPosition = Float(-1)
        ship.position = SCNVector3(xPosition, yPosition, zPosition)
        
        myArview.scene.rootNode.addChildNode(ship)
    }
    
    func randomPosition(lowerBound lower:Float, upperBound upper:Float) -> Float{
        
        return Float(arc4random()) / Float(UInt32.max) * (lower - upper) + upper
        
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
           
            let location = touch.location(in: myArview)
            
            let hitList = myArview.hitTest(location, options: nil)
            
            if let hitObject = hitList.first{
                let node  = hitObject.node
                
                if node.name == "ARShip"{
                     counter += 1 
                    node.removeFromParentNode()
                    addObject()
                }
            }
        }
    }
}
