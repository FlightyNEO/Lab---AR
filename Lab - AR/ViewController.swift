//
//  ViewController.swift
//  Lab - AR
//
//  Created by Arkadiy Grigoryanc on 22/03/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    // MARK: - Private properties
    var sceneHouseName = "art.scnassets/Building/lowpoly_house.dae"
    var sceneCarName = "art.scnassets/Car/van 003a_2012.dae"
    var sceneHuman1Name = "art.scnassets/Character/Cas-Sum_Man_RtStand_366.dae"
    var sceneHuman2Name = "art.scnassets/Character2/7.scn"
    var sceneStreetLightName = "art.scnassets/Street light/Street light.scn"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        
        // Create a new scene
        let scene = SCNScene(named: sceneHouseName)!
        
        // Set the scene to the view
        sceneView.scene = scene
        
        // Create car
        addCarToScene()
        
        // Create plane
        addPlaneToScene()
        
        // Create character
        addCharactersToScene()
        
        // Create street light
        addStreetLightToScene()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: Private methods
    
    // --- add car
    private func addCarToScene() {
        let car = nodeFrom(sceneCarName)
        sceneView.scene.rootNode.addChildNode(car)
    }
    
    // --- add grass
    private func addPlaneToScene() {
        
        let plane = SCNNode(geometry: SCNPlane(width: 1.5, height: 1.5))
        plane.position = SCNVector3(0.35, 0, -0.35)
        plane.eulerAngles = SCNVector3(-(90 as Float).radians, -(45 as Float).radians, 0)
        plane.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "grass.jpg")
        sceneView.scene.rootNode.addChildNode(plane)
        
    }
    
    // --- add street light
    private func addStreetLightToScene() {
        
        let lamp = nodeFrom(sceneStreetLightName)
        sceneView.scene.rootNode.addChildNode(lamp)
        
    }
    
    // --- add human
    private func addCharactersToScene() {
        
        addCharacterToScene()
        addCharacter2ToScene()
        
    }
    
    private func addCharacterToScene() {
        let human = nodeFrom(sceneHuman1Name)
        sceneView.scene.rootNode.addChildNode(human)
    }
    
    private func addCharacter2ToScene() {
        let human = nodeFrom(sceneHuman2Name)
        sceneView.scene.rootNode.addChildNode(human)
    }
    
    
    private func nodeFrom(_ sceneFile: String) -> SCNNode {
        return SCNScene(named: sceneFile)!.rootNode
    }

    // MARK: - ARSCNViewDelegate
    
/*
    // Override to create and configure nodes for anchors added to the view's session.
    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        let node = SCNNode()
     
        return node
    }
*/
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
