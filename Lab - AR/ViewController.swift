//
//  ViewController.swift
//  Lab - AR
//
//  Created by Arkadiy Grigoryanc on 22/03/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import ARKit

class ViewController: UIViewController {

    @IBOutlet var sceneView: ARSCNView!
    
    // MARK: - Private properties
    private enum SceneName: String {
        
        enum Character: String, CaseIterable {
            
            case human1 = "art.scnassets/Character/Cas-Sum_Man_RtStand_366.dae"
            case human2 = "art.scnassets/Character2/7.scn"
            
        }
        
        case house = "art.scnassets/Building/lowpoly_house.dae"
        case car = "art.scnassets/Car/van 003a_2012.dae"
        case streetLight = "art.scnassets/Street light/Street light.scn"
        case starship = "art.scnassets/Starship/NXResonance_BM.scn"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = true
        sceneView.debugOptions = [.showWorldOrigin, .showFeaturePoints]
        #endif
        
        // Create a new scene
        let scene = SCNScene(named: SceneName.house.rawValue)!
        
        // Set the scene to the view
        sceneView.scene = scene
        
        // Create and add car to the scene
        addCarToScene()
        
        // Create and add plane to the scene
        addPlaneToScene()
        
        // Create and add character to the scene
        addCharactersToScene()
        
        // Create and add street light and omni light to the scene
        addStreetLightAndOmniLightToScene()
        
    }
    
    // MARK: Life cicles
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    
    // MARK: Private methods
    
    // --- add car
    private func addCarToScene() {
        let car = nodeFrom(SceneName.car.rawValue)
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
    private func addStreetLightAndOmniLightToScene() {
        let lamp = nodeFrom(SceneName.streetLight.rawValue)
        sceneView.scene.rootNode.addChildNode(lamp)
    }
    
    // --- add humans
    private func addCharactersToScene() {
        addHumansToScene()
    }
    
    private func addHumansToScene() {
        let humans = SceneName.Character.allCases.map { $0.rawValue }
        humans.forEach { sceneView.scene.rootNode.addChildNode(nodeFrom($0)) }
    }
    
    private func nodeFrom(_ sceneFile: String) -> SCNNode {
        return SCNScene(named: sceneFile)!.rootNode
    }
    
}
