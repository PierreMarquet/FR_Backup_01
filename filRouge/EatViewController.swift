//
//  EatViewController.swift
//  filRouge
//
//  Created by Joris Thiery on 09/06/2021.
//

import UIKit

class EatViewController: UIViewController {

    @IBOutlet var centeredLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Manger"
        centeredLabel.text = "Manger"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
