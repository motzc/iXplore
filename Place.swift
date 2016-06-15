//
//  Place.swift
//  iXplore
//
//  Created by Chris Motz on 6/8/16.
//  Copyright © 2016 iXperience. All rights reserved.
//

import Foundation
import MapKit

class Place:NSObject, MKAnnotation {
    
    var title:String? = ""
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    var logoURL:String? = ""
    var logo:String? = ""
    var info:String? = ""
    var date:NSDate = NSDate()
    var favourite:Bool = false
    
    
    class func placeList() -> [Place] {
        
        let place = Place()
        place.title = "Workshop 17"
        place.logo = "iX.png"
        place.favourite = true
        place.coordinate = CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983)
        
        let place2 = Place()
        place2.title = "Truth Coffee"
        place2.logo = "truth.png"
        place2.favourite = true
        place2.coordinate = CLLocationCoordinate2D(latitude: -33.9281976,longitude: 18.4227045)
        
        let place3 = Place()
        place3.title = "Chop Chop Coffee"
        place3.logo = "chopchop.jpg"
        place3.coordinate = CLLocationCoordinate2D(latitude: -33.9271879,longitude: 18.4327055)
        
        let place4 = Place()
        place4.title = "Christ the Redeemer"
        place4.logo = "christ_the_redeemer"
        place4.favourite = true
        place4.coordinate = CLLocationCoordinate2D(latitude: -22.9519,longitude: -43.2105)
        
        let place5 = Place()
        place5.title = "Great Wall of China"
        place5.logo = "great_wall_of_china"
        place5.coordinate = CLLocationCoordinate2D(latitude: 40.4319,longitude: 116.5704)
        
        let place6 = Place()
        place6.title = "Machu Picchu"
        place6.logo = "machu_picchu.png"
        place6.coordinate = CLLocationCoordinate2D(latitude: -13.1631,longitude: -72.5450)
        
        let place7 = Place()
        place7.title = "Petra"
        place7.logo = "petra.png"
        place7.coordinate = CLLocationCoordinate2D(latitude: 30.3285,longitude: 35.4444)
        
        let place8 = Place()
        place8.title = "Pyramid at Chichén Itzá"
        place8.logo = "chichen_itza.jpg"
        place8.coordinate = CLLocationCoordinate2D(latitude: 20.6829,longitude: -88.56865)
        
        let place9 = Place()
        place9.title = "Roman Colosseum"
        place9.logo = "italy.png"
        place9.coordinate = CLLocationCoordinate2D(latitude: 41.8902,longitude: 12.4922)
        
        let place10 = Place()
        place10.title = "Taj Mahal"
        place10.logo = "taj_mahal.png"
        place10.coordinate = CLLocationCoordinate2D(latitude: 27.1750,longitude: 78.0422)
        
        
        return [place ,place2, place3, place4, place5, place6, place7, place8, place9, place10]
    }
}



//let mapCenterCoordinateAfterMove = CLLocationCoordinate2D(latitude: self.spotList[indexPath.row].coordinate.latitude,longitude: self.spotList[indexPath.row].coordinate.longitude)
//        let adjustedRegion = mapView.regionThatFits(MKCoordinateRegionMake(mapCenterCoordinateAfterMove,
//MKCoordinateSpanMake(0.01, 0.01)))
//        mapView.setRegion(adjustedRegion, animated: true)

extension UIImageView   {
    
    
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
}
