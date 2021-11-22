//
//  ViewController.swift
//  AsisCT
//
//  Created by Cem Eke on 19.11.2021.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mapView: MKMapView!
    
    private let viewModel = BussListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib.init(nibName: "StationTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "StationTableViewCell")
        tableView.register(UINib.init(nibName: "StationTableViewHeader", bundle: Bundle.main), forHeaderFooterViewReuseIdentifier: "HeaderCell")
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.updateUI = {
            print("update")
            self.tableView.reloadData()
        }
        viewModel.fetchUsers()
        

        
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        cellTapped(station: indexPath.section, buss: indexPath.row)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

            let headerView = UIView()
            let headerCell = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderCell") as! StationTableViewHeader
            headerCell.lblStation.text = viewModel.stations[section].stationName
            headerView.addSubview(headerCell)
        
            return headerView
         
        }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80  // or whatever
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.stations[section].buses.count
 
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.stations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "StationTableViewCell", for: indexPath) as! StationTableViewCell
            let station = viewModel.stations[indexPath.section]
        cell.lblRoute.text = station.buses[indexPath.row].routeCode
        cell.lblRemaining.text = String(station.buses[indexPath.row].remainingTime)
            return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}


extension ViewController {
    func cellTapped(station:Int, buss:Int) {
        let latitude = viewModel.stations[station].buses[buss].location.latitude
        let longitude = viewModel.stations[station].buses[buss].location.longitude
        
        let location = CLLocation(latitude: latitude, longitude: longitude)
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: 10000, longitudinalMeters: 10000)
        mapView.setRegion(coordinateRegion, animated: true)
      
        let annotation = MKPointAnnotation()
        let centerCoordinate = CLLocationCoordinate2D(latitude: latitude, longitude:longitude)
        annotation.coordinate = centerCoordinate
        annotation.title = "Home"
        mapView.addAnnotation(annotation)
    }
}
