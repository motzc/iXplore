//
//  MapViewController.swift
//  iXplore
//
//  Created by Chris Motz on 6/8/16.
//  Copyright © 2016 iXperience. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var tableView: UITableView!
    
    var placeList = [Place]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.placeList = Place.placeList()
        self.mapView.delegate = self
        setupTableView()
        setupMapView()

        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        
        self.tableView.registerClass(TableViewCellController.self, forCellReuseIdentifier: "tableViewCellController")
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setupMapView(){
        self.mapView.mapType = .Hybrid
        self.mapView.showsBuildings = true
        self.mapView.addAnnotations(placeList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {

        let pin = annotation as! Place
        let reuseId = "pin"

        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        
        if pinView == nil {
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.animatesDrop = true
    
                if !(pin.favourite) {
                    pinView!.pinTintColor = UIColor.redColor()
                } else {
                    pinView!.pinTintColor = UIColor.cyanColor()
                }
    
        }
        else {
            pinView!.annotation = annotation
        }
        
        return pinView

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.placeList.count
    }

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let dateFormatter = NSDateFormatter()
        let currentDate = NSDate()
        
        let place = placeList[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("tableViewCellController", forIndexPath: indexPath) as! TableViewCellController
        cell.cellImage.image = UIImage(named: place.logo!)

        cell.setNeedsLayout()
        cell.cellLabel.text = place.title!
        
        
        dateFormatter.dateFormat = "MM/dd/yyyy HH:mm"
        dateFormatter.stringFromDate(currentDate)
        
        cell.dateLabel.text = dateFormatter.stringFromDate(currentDate)
        print(place.title)
        return cell
    }
    
//    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//        if editingStyle == .Delete {
//            placeList.removeAtIndex(indexPath.row)
//            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
//        } else if editingStyle == .Insert {
//            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
//        }
//    }
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .Normal, title: "Delete") { action, index in
            self.placeList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            print("delete button tapped")
        }
        delete.backgroundColor = UIColor.redColor()
        
        let favourite = UITableViewRowAction(style: .Normal, title: "Favorite") { action, index in
            self.placeList[indexPath.row].favourite = true
            self.mapView.addAnnotation(self.placeList[indexPath.row])

            print("favourite button tapped")
        }
        favourite.backgroundColor = UIColor.orangeColor()
        
        
        return [delete, favourite]
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // the cells you would like the actions to appear needs to be editable
        return true
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(placeList[indexPath.row].coordinate, 200, 2000)
        self.mapView.setRegion(coordinateRegion, animated: true)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.mapView.setCenterCoordinate(placeList[indexPath.row].coordinate, animated: true)
        self.mapView.addAnnotation(placeList[indexPath.row])
        self.mapView.selectAnnotation(placeList[indexPath.row], animated: true)
//        self.mapView.showAnnotations(placeList, animated: true)

        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
