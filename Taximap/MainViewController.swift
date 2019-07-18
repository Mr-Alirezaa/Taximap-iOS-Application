//
//  ViewController.swift
//  Take Taxi
//
//  Created by Alireza Asadi on 27/4/1398 AP.
//  Copyright © 1398 AP Alireza Asadi. All rights reserved.
//

import UIKit
import Mapbox
import MapirServices

class MainViewController: UIViewController {

    @IBOutlet weak var mapView: MGLMapView!

    let routing = Routing.default

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.styleURL = MGLStyle.mapirVectorStyleURL
    }

    @IBAction func mapLongTapped(_ sender: UILongPressGestureRecognizer) {

    }


    @IBAction func searchButtonTapped(_ sender: UIBarButtonItem) {
        let searchViewController = self.storyboard?.instantiateViewController(withIdentifier: "search-view-controller") as! SearchViewController
        searchViewController.delegate = self
        searchViewController.centerCoordinate = mapView.centerCoordinate

        self.present(searchViewController, animated: true, completion: nil)
    }


    @IBOutlet weak var routeButton: UIButton!
    @IBOutlet weak var selectButton: UIButton!

    private func updateView() {
        if routing.canRoute {
            routeButton.isEnabled = true
        }
        else {
            routeButton.isEnabled = false
        }

        if selectedCoordinate == nil {
            selectButton.isEnabled = false
        } else {
            selectButton.isEnabled = true
        }
    }

    @IBAction func routeButtonTapped(_ sender: UIButton) {

    }

    var selectedCoordinate: CLLocationCoordinate2D? = nil

    @IBAction func selectButtonTapped(_ sender: UIButton) {

    }

    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var distanceLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        detailsView.isHidden = true
    }
}

extension MainViewController: MGLMapViewDelegate {

}

extension MainViewController: SearchViewControllerDelegate {
    func searchViewController(selected: MPSSearchResult) {

    }

}

extension MainViewController: RoutingDelegate {
    func routing(_ routing: Routing, routeUpdated route: MPSRoute) {

    }

}
