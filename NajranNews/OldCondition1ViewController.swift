//
//  OldCondition1ViewController.swift
//  NajranNews
//
//  Created by Najran Emarah on 20/05/1441 AH.
//  Copyright © 1441 Najran Emarah. All rights reserved.
//

import UIKit

class OldCondition1ViewController: UIViewController {
    @IBOutlet weak var firstView: UIView!
        @IBOutlet weak var secondView: UIView!
        @IBOutlet weak var thirdView: UIView!
        @IBOutlet weak var fourthView: UIView!
    var isAnimation1Complete = false
    var isAnimation2Complete = false
    var isAnimation3Complete = false
    var isAnimation4Complete = false
    var isBackPressed = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
            self.navigationController?.isNavigationBarHidden = true
           
           UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                             self.firstView.transform = CGAffineTransform(scaleX: -1, y: 1)
                         }, completion: {  success in
                           UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                                    self.firstView.transform = CGAffineTransform(scaleX:1, y: 1)
                                                }, completion: {  success in
                                                    self.isAnimation1Complete = true
                                                    self.goBack()
                                                })
                            
                         })
           
           UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                    self.secondView.transform = CGAffineTransform(scaleX: -1, y: 1)
                                }, completion: {  success in
                                  UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                                           self.secondView.transform = CGAffineTransform(scaleX:1, y: 1)
                                                       }, completion: {  success in
                                                         self.isAnimation2Complete = true
                                                         self.goBack()
                                                       })
                                   
                                })
           
           UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                    self.thirdView.transform = CGAffineTransform(scaleX: -1, y: 1)
                                }, completion: {  success in
                                  UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                                           self.thirdView.transform = CGAffineTransform(scaleX:1, y: 1)
                                                       }, completion: {  success in
                                                         self.isAnimation3Complete = true
                                                         self.goBack()
                                                       })
                                   
                                })
           
           UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                    self.fourthView.transform = CGAffineTransform(scaleX: -1, y: 1)
                                }, completion: {  success in
                                  UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                                           self.fourthView.transform = CGAffineTransform(scaleX:1, y: 1)
                                                       }, completion: {  success in
                                                         self.isAnimation4Complete = true
                                                         self.goBack()
                                                       })
                                   
                                })
           
       }
    func goBack(){
        if isBackPressed == true && isAnimation1Complete == true && isAnimation2Complete == true && isAnimation3Complete == true && isAnimation4Complete == true {
                  let transition = CATransition()
                  transition.duration = 0.4
                  transition.type = CATransitionType.push
                  transition.subtype = CATransitionSubtype.fromRight
                  self.navigationController?.view.layer.add(transition, forKey: kCATransition)
                  self.navigationController?.popViewController(animated: false)
               }
    }
    @IBAction func GObacktoRoot(_ sender: UIButton?) {
           isBackPressed = true
       if  isAnimation1Complete == true && isAnimation2Complete == true && isAnimation3Complete == true && isAnimation4Complete == true {
                        goBack()
                     }
           
       }
    @IBAction func GOIstedaatAammaViewController(_ sender: Any) {
           isAnimation1Complete = false
                       isAnimation2Complete = false
                       isAnimation3Complete = false
                       isAnimation4Complete = false
                     
                       isBackPressed = false
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "IstedaatAammaViewController") as? IstedaatAammaViewController
                       let transition = CATransition()
                         transition.duration = 0.5
                         transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                         transition.type = CATransitionType.push
                         transition.subtype = CATransitionSubtype.fromLeft
                         
                         self.navigationController?.view.layer.add(transition, forKey: nil)
                         self.navigationController?.pushViewController(vc!, animated: false)

       }
    @IBAction func GOAlHawadaswController(_ sender: Any) {
        isAnimation1Complete = false
                              isAnimation2Complete = false
                              isAnimation3Complete = false
                              isAnimation4Complete = false
                            
                              isBackPressed = false
         let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AlHawadasViewController") as? AlHawadasViewController
                    let transition = CATransition()
                      transition.duration = 0.5
                      transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                      transition.type = CATransitionType.push
                      transition.subtype = CATransitionSubtype.fromLeft
                      
                      self.navigationController?.view.layer.add(transition, forKey: nil)
                      self.navigationController?.pushViewController(vc!, animated: false)

    }
   @IBAction func GOAzwajController(_ sender: Any) {
       isAnimation1Complete = false
                             isAnimation2Complete = false
                             isAnimation3Complete = false
                             isAnimation4Complete = false
                             isBackPressed = false
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AzwajViewController") as? AzwajViewController
                   let transition = CATransition()
                     transition.duration = 0.5
                     transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                     transition.type = CATransitionType.push
                     transition.subtype = CATransitionSubtype.fromLeft
                     
                     self.navigationController?.view.layer.add(transition, forKey: nil)
                     self.navigationController?.pushViewController(vc!, animated: false)

   }
   @IBAction func GOLeiqaarController(_ sender: Any) {
          isAnimation1Complete = false
                                isAnimation2Complete = false
                                isAnimation3Complete = false
                                isAnimation4Complete = false
                              
                                isBackPressed = false
           let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LilIqaarViewController") as? LilIqaarViewController
                      let transition = CATransition()
                        transition.duration = 0.5
                        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                        transition.type = CATransitionType.push
                        transition.subtype = CATransitionSubtype.fromLeft
                        
                        self.navigationController?.view.layer.add(transition, forKey: nil)
                        self.navigationController?.pushViewController(vc!, animated: false)

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
