//
//  MapViewController.swift
//  SeSAC0524Assignment
//
//  Created by 최대성 on 5/30/24.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet var mapView: MKMapView!
    
    let foodList = RestaurantList().restaurantArray
    let picker = UIPickerView()
    var blankList: [Restaurant] = []
    
    @IBOutlet var pickRestaurantControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "맛집 추천"
        
        mapView.delegate = self
        blankList = foodList
        getRestaurant()

        
    }
    

    @IBAction func categoryClicked(_ sender: UISegmentedControl) {
        
        
        switch sender.selectedSegmentIndex {
        case 0:
            blankList = foodList
        case 1:
            getCategory(category: "한식")
        case 2:
            getCategory(category: "일식")
        case 3:
            getCategory(category: "카페")
            
        default:
            break
        }
        
        getRestaurant()
        
    }
    
    func getCategory(category: String) {
        blankList = []
        for item in foodList {
            if item.category == category {
                blankList.append(item)
            }
        }
    }
    
    
    func getRestaurant() {
        
        mapView.removeAnnotations(mapView.annotations)
        for i in 0...blankList.count-1 {
            let restaurant = CLLocationCoordinate2D(latitude: blankList[i].latitude, longitude: blankList[i].longitude)
            
            
            mapView.region = MKCoordinateRegion(center: restaurant, latitudinalMeters: 500, longitudinalMeters: 500)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = restaurant
            annotation.title = blankList[i].name
            mapView.addAnnotation(annotation)
        }
    }
}

