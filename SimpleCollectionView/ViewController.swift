//
//  ViewController.swift
//  SimpleCollectionView
//
//  Created by Manao on 4/25/16.
//  Copyright © 2016 Pitipong. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    let reuseIdentifier = "cell"
    var URL : String = "https://gank.io/api/data/%E7%A6%8F%E5%88%A9/500/1"
    var prettyModel : PrettyModel?

    @IBOutlet weak var collectionview: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        Alamofire.request(.GET, URL)
            .responseJSON { response in
                print(response.request)  // original URL request
                print(response.response) // URL response
                print(response.data)     // server data
                print(response.result)   // result of response serialization
                debugPrint(response)
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    self.prettyModel = PrettyModel(object: JSON)
                    
                    print("prettyModel Size = \(self.prettyModel?.results?.count)")
                    
                     self.collectionview.reloadData()
                    
                }
        }

           }
    
    // MARK: - UICollectionViewDataSource protocol
    
    // tell the collection view how many cells to make
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.prettyModel?.results!.count != nil {
            return (self.prettyModel?.results!.count)!
        }
        return 0
    }

    
    // make a cell for each cell index path
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        let data = self.prettyModel?.results?[indexPath.row]
        
        var urlL : String = ""
        urlL = (data?.url)!
        print("URL OF IMAGE ------- "+urlL)
        Alamofire.request(.GET, urlL)
            .responseImage { response in
                debugPrint(response)
                
                print(response.request)
                print(response.response)
                debugPrint(response.result)
                
                if let image = response.result.value {
                    print("image downloaded: \(image)")
                    cell.imgCover.image = image
                }
        }
    
        
        // Use the outlet in our custom class to get a reference to the UILabel in the cell
//        cell.myLabel.text = self.items[index	Path.item]
//        cell.backgroundColor = UIColor.yellowColor() // make cell more visible in our example project
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // handle tap events
        print("You selected cell #\(indexPath.item)!")
        
//        if let _ = collectionview.cellForItemAtIndexPath(indexPath) {
//            self.performSegueWithIdentifier("show detail", sender: self)
//        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "show detail") {
            // pass data to next view
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

