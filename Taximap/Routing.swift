//
//  Routing.swift
//  Taximap
//
//  Created by Alireza Asadi on 27/4/1398 AP.
//  Copyright © 1398 AP Alireza Asadi. All rights reserved.
//

import Foundation
import CoreLocation
import MapirServices

protocol RoutingDelegate {
    func routing(_ routing: Routing, routeUpdated route: MPSRoute)
}

class Routing {
    var origin: CLLocationCoordinate2D?
    var destination: [CLLocationCoordinate2D] = []

    var route: MPSRoute?

    let services = MPSMapirServices.shared

    var delegate: RoutingDelegate?

    var canRoute: Bool {
        return (origin != nil && destination.count > 0)
    }

    static let `default` = Routing()

    func addPoint(_ point: CLLocationCoordinate2D) {
        if origin == nil {
            origin = point
        } else {
            destination.append(point)
        }
    }

    func cancel() {
        origin = nil
        destination.removeAll()
    }

    func getRoute() {

    }
}

