//
//  MapViewController.swift
//  TaxiApp
//
//  Created by Ismayil Ismayilov on 03.05.22.
//

import Foundation
import UIKit
import SnapKit
import MapKit

class MapViewController : UIViewController {
    
    //MARK: - Variables
    let locationManager = CLLocationManager()
    let initialLocation = CLLocation.init(latitude: 40.414349, longitude: 49.824233)
    let homeAnno = Annotation(title: "Home", coordinate: CLLocationCoordinate2D.init(latitude: 40.414349, longitude: 49.824233), image: UIImageView(image: UIImage(named: "home")))
    
    //MARK: - UI Components
    private lazy var mapView : MKMapView = {
        let view = MKMapView()
        return view
    }()
    
    public  lazy var firstView : FirstView = {
        let view = FirstView()
        view.layer.cornerRadius = 36
        view.clipsToBounds = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.onTapGesture(_:)))
        view.tableView.addGestureRecognizer(tapGesture)
        return view
    }()
    
    public lazy var secondView : SecondView = {
        let view = SecondView()
        view.layer.cornerRadius = 36
        view.clipsToBounds = true
        view.confirmButton.addTarget(self, action: #selector(self.onButton), for: .touchUpInside)
        return view
    }()
    
    public lazy var thirdView : ThirdView = {
        let view = ThirdView()
        view.layer.cornerRadius = 36
        view.clipsToBounds = true
        return view
    }()
    
    //MARK: - Parent Delegate
    override func viewDidLoad() {
        
        let arr = [1, 2, 3, 4, 5, 5, 6, 7, 8, 8, 8, 9]
        let arr2 = Set(arr)
        print("Array count: \(arr.count)")
        print("Set count: \(arr2.count)")
        arr2.forEach { i in
            print(i)
        }
        
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        self.view.addSubview(self.mapView)
        self.view.addSubview(self.firstView)
        
        self.mapView.snp.makeConstraints { make in
            make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
        self.firstView.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(12)
            make.height.equalTo(358)
        }
        
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: 1200, longitudinalMeters: 1200)
        
        self.mapView.setRegion(coordinateRegion, animated: true)
            
        let taxi1 = Annotation(title: "Taxi1", coordinate: CLLocationCoordinate2D.init(latitude: 40.419349, longitude: 49.826233), image: UIImageView(image: UIImage(named: "taxi")))
        
        let taxi2 = Annotation(title: "Taxi2", coordinate: CLLocationCoordinate2D.init(latitude: 40.413349, longitude: 49.821393), image: UIImageView(image: UIImage(named: "taxi")))
        
        let taxi3 = Annotation(title: "Taxi3", coordinate: CLLocationCoordinate2D.init(latitude: 40.417349, longitude: 49.826763), image: UIImageView(image: UIImage(named: "taxi")))
        
        let taxi4 = Annotation(title: "Taxi4", coordinate: CLLocationCoordinate2D.init(latitude: 40.418349, longitude: 49.821593), image: UIImageView(image: UIImage(named: "taxi")))
        
        self.mapView.addAnnotation(homeAnno)
        self.mapView.addAnnotation(taxi1)
        self.mapView.addAnnotation(taxi2)
        self.mapView.addAnnotation(taxi3)
        self.mapView.addAnnotation(taxi4)
        
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            locationManager.startUpdatingLocation()
        }
        
        mapView.register(Artwork.self, forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier)
    }
    
    //MARK: - Functions
    @objc func onTapGesture (_ sender: UITapGestureRecognizer) {
        self.firstView.removeFromSuperview()
        
        self.view.addSubview(self.secondView)
        
        self.secondView.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(12)
            make.height.equalTo(275)
        }
        
        self.secondView.setup(locationImage: UIImageView(image: UIImage(named: "location1")), mainLcation: "Mall of the Emirates Metro", secondaryLocation: "Dubai, al barsha 1 - mall of the emirates")
    }
    
    @objc func onButton () {
        self.secondView.removeFromSuperview()
        
        self.view.addSubview(self.thirdView)
        
        self.thirdView.snp.makeConstraints { make in
            make.left.equalTo(self.view.safeAreaLayoutGuide.snp.left)
            make.right.equalTo(self.view.safeAreaLayoutGuide.snp.right)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).offset(12)
            make.height.equalTo(480)
        }
    }
}

//MARK: - Annotation class
class Annotation : NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var image = UIImageView()
    
    init(title: String?, coordinate: CLLocationCoordinate2D, image : UIImageView) {
        self.title = title
        self.coordinate = coordinate
        self.image = image
    }
}

class Artwork: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            guard let artwork = newValue as? Annotation else {
                return
            }
            
            canShowCallout = true
            calloutOffset = CGPoint(x: 0, y: 0)
            image = artwork.image.image
            
            let resizedSize = CGSize(width: 55, height: 55)
            UIGraphicsBeginImageContext(resizedSize)
            image?.draw(in: CGRect(origin: .zero, size: resizedSize))
            let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            image = resizedImage
            
            let mapsButton = UIButton(frame: CGRect(
              origin: CGPoint.zero,
              size: CGSize(width: 45, height: 45)))
            mapsButton.setBackgroundImage(image, for: .normal)
            rightCalloutAccessoryView = mapsButton
        }
    }
}

//MARK: - Extensions
extension MapViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let recentLocation = locations.last {
            self.homeAnno.coordinate = recentLocation.coordinate
            
            let coordinateRegion = MKCoordinateRegion(
                center: initialLocation.coordinate, latitudinalMeters: 1200, longitudinalMeters: 1200
            )
            self.mapView.setRegion(coordinateRegion, animated: true)
        }
    }
}

