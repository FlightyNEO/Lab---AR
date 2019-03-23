//
//  Utils.swift
//  Lab - AR
//
//  Created by Arkadiy Grigoryanc on 23/03/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import Darwin

extension Float: DegrisToRadiansProtocol { }
extension Double: DegrisToRadiansProtocol { }

protocol DegrisToRadiansProtocol: FloatingPoint, ExpressibleByFloatLiteral { }

extension DegrisToRadiansProtocol {
    var radians: Self {
        return self * .pi / 180.0
    }
}
