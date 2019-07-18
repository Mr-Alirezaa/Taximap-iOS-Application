//
//  SearchViewController.swift
//  Taximap
//
//  Created by Alireza Asadi on 27/4/1398 AP.
//  Copyright © 1398 AP Alireza Asadi. All rights reserved.
//

import UIKit
import MapirServices
import CoreLocation

protocol SearchViewControllerDelegate {
    func searchViewController(selected: MPSSearchResult)
}

class SearchViewController: UIViewController {

    var delegate: SearchViewControllerDelegate?

    var centerCoordinate: CLLocationCoordinate2D?

    @IBOutlet weak var searchResultsTableView: UITableView!

    var searchResults: [MPSSearchResult] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchResultsTableView.delegate = self
        searchResultsTableView.dataSource = self
    }

    @IBAction func searchButtonTapped(_ sender: UIButton) {
        
    }

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "search-cell") {
            cell.semanticContentAttribute = .forceRightToLeft
            cell.detailTextLabel?.text = searchResults[indexPath.row].address
            cell.textLabel?.text = searchResults[indexPath.row].title
            return cell
        }

        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "search-cell")
        cell.semanticContentAttribute = .forceRightToLeft
        cell.detailTextLabel?.text = searchResults[indexPath.row].address
        cell.textLabel?.text = searchResults[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let selectedResult = searchResults[indexPath.row]
        self.dismiss(animated: true) {
            self.delegate?.searchViewController(selected: selectedResult)
        }
    }
}
