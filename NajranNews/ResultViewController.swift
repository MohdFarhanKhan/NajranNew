//
//  ResultViewController.swift
//  NajranNews
//
//  Created by Najran Emarah on 12/07/1441 AH.
//  Copyright © 1441 Najran Emarah. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultTextView: UITextView!
    var resultDictionary: [String:AnyObject]?
    var keysArray :[String]?
    override func viewDidLoad() {
        super.viewDidLoad()
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                   self.resultTextView.transform = CGAffineTransform(scaleX: -1, y: 1)
                               }, completion: {  success in
                                 UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                                          self.resultTextView.transform = CGAffineTransform(scaleX:1, y: 1)
                                                      }, completion: {  success in
                                                        
                                                      })
                                  
                               })
        // Do any additional setup after loading the view.
        var result:String = ""
        for key in keysArray!{
            let value = resultDictionary![key] as! String
            let res = key + " : " + value
            
            result = result + "\n\n\n\n" + res
                
        }
        
        resultTextView.text = result
       self.navigationController?.isNavigationBarHidden = true
       
    }
    
    @IBAction func GObacktoRoot(_ sender: Any) {
        
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.popViewController(animated: false)
        
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
