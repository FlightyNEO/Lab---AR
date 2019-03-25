//
//  Utils.swift
//  Lab - AR
//
//  Created by Arkadiy Grigoryanc on 23/03/2019.
//  Copyright © 2019 Arkadiy Grigoryanc. All rights reserved.
//

import Darwin

extension Float: DegreesToRadiansProtocol { }
extension Double: DegreesToRadiansProtocol { }

protocol DegreesToRadiansProtocol: FloatingPoint, ExpressibleByFloatLiteral { }

extension DegreesToRadiansProtocol {
    var radians: Self {
        return self * .pi / 180.0
    }
}
