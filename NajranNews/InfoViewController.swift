//
//  InfoViewController.swift
//  NajranNews
//
//  Created by Najran Emarah on 24/07/1441 AH.
//  Copyright © 1441 Najran Emarah. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
  var pageTitle = ""
  var text  = ""
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var infoTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = pageTitle
        infoTextView.text = text
        // Do any additional setup after loading the view.
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
