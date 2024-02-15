//
//  SecondViewController.swift
//  API_Call_Assignment
//
//  Created by promact on 15/02/24.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var lblIP: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    
    @IBOutlet weak var lblReadme: UILabel!
    @IBOutlet weak var lblTimezone: UILabel!
    @IBOutlet weak var lblPostal: UILabel!
    @IBOutlet weak var lblOrg: UILabel!
    @IBOutlet weak var lblLoc: UILabel!
    @IBOutlet weak var lblCountry: UILabel!
    @IBOutlet weak var lblRegion: UILabel!
    var result:[String:String] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        lblIP.text = result["ip"]
        lblCity.text = result["city"]
        lblRegion.text = result["region"]
        lblCountry.text = result["country"]
        lblLoc.text = result["loc"]
        lblOrg.text = result["org"]
        lblPostal.text = result["postal"]
        lblTimezone.text = result["timezone"]
        lblReadme.text = result["readme"]
    }
}
