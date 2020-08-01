//
//  ViewController2.swift
//  APIConnect
//
//  Created by Najran Emarah on 14/05/1441 AH.
//  Copyright © 1441 Najran Emarah. All rights reserved.
//

import UIKit

class AboutEmarahViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let documentsPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let destinationURL = documentsPath.appendingPathComponent("AboutImarah.txt")
       
        if FileManager.default.fileExists(atPath: destinationURL.path) == true{
        
            let fileContent =  try? String(contentsOf: destinationURL)
                   print(fileContent)

            let textViewe = self.view.viewWithTag(1000) as! UITextView
          //  textViewe.text = fileContent
          

        }
       
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func GObacktoRoot(_ sender: Any) {
        
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        
        self.navigationController?.popViewController(animated: false)
    }
  
    
}
