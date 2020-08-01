//
//  AlHawadasViewController.swift
//  NajranNews
//
//  Created by Najran Emarah on 21/05/1441 AH.
//  Copyright © 1441 Najran Emarah. All rights reserved.
//

import UIKit

class AlHawadasViewController: UIViewController, iCarouselDataSource, iCarouselDelegate{
    func numberOfItems(in carousel: iCarousel) -> Int {
              return items.count
          }
       func numberOfItemsInCarousel(carousel: iCarousel) -> Int {
              return items.count
          }

          func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
             
              var itemView: UIImageView

              //reuse view if available, otherwise create a new view
           if let view = view as? UIImageView {
                  itemView = view
               itemView.frame = CGRect(x: 0, y: 10, width: self.view.frame.width-100, height: self.view.frame.size.height-250)
                  //get a reference to the label in the recycled view
                 
              } else {
                  //don't do anything specific to the index within
                  //this `if ... else` statement because the view will be
                  //recycled and used with other index values later
              
               itemView = UIImageView(frame: CGRect(x: 0, y: 10, width: self.view.frame.width-100, height: self.view.frame.size.height-200))
               itemView.image = UIImage(named: items[index])
                          itemView.contentMode = .scaleToFill
            itemView.backgroundColor = UIColor.init(displayP3Red: 1, green: 1, blue: 1, alpha: 0.7)
                       itemView.layer.cornerRadius = 10
                       itemView.layer.masksToBounds = true
                       itemView.layer.borderWidth = 1.5
                       itemView.layer.borderColor = UIColor.init(displayP3Red: 144.0/255, green: 199.0/255, blue: 164.0/255, alpha: 0.7).cgColor
               // Add Child View as Subview
             
              }
            
              //set item label
              //remember to always set any properties of your carousel item
              //views outside of the `if (view == nil) {...}` check otherwise
              //you'll get weird issues with carousel item content appearing
              //in the wrong place in the carousel
           
              itemView.frame = CGRect(x: 0, y: 50, width: self.view.frame.width-100, height: self.view.frame.size.height-200)
              return itemView
          }

          func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
              if (option == .spacing) {
                  return value * 1.1
              }
              return value
          }
       func carousel(_ carousel: iCarousel, didSelectItemAt index: Int) {
           switch index {
           case 0:
               GOHawadaswController(nil)
               
       
          
           default:
               GOTarheelJasmanViewController(nil)
               
           }
       }
       override func awakeFromNib() {
           super.awakeFromNib()
          
           items.append("iPhone20")
           
          
                  items.append("iPhone21")
           
       }
     @IBOutlet var carousel: iCarousel!
    var items: [String] = []
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    var isAnimation1Complete = false
    var isAnimation2Complete = false
    var isAnimation3Complete = false
    
    var isBackPressed = false

    override func viewDidLoad() {
        super.viewDidLoad()
  carousel.type = .rotary
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
              
             self.carousel.scroll(byNumberOfItems: 1, duration: 0.75)
              
               DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) { [unowned self] in
                self.carousel.scroll(byNumberOfItems:1, duration: 0.75)
                      self.isAnimation3Complete = true
                      self.goBack()
               //  self.animateMe()
             }
              
          }
    func goBack(){
           if isBackPressed == true && isAnimation1Complete == true && isAnimation2Complete == true && isAnimation3Complete == true {
                     let transition = CATransition()
                     transition.duration = 0.4
                     transition.type = CATransitionType.push
                     transition.subtype = CATransitionSubtype.fromRight
                     self.navigationController?.view.layer.add(transition, forKey: kCATransition)
                     self.navigationController?.popViewController(animated: false)
                  }
       }
    @IBAction func GOback(_ sender: Any) {
        
        isBackPressed = true
              if  isAnimation1Complete == true && isAnimation2Complete == true && isAnimation3Complete == true  {
                               goBack()
                            }
    }
    @IBAction func GOHawadaswController(_ sender: UIButton?) {
        isAnimation1Complete = false
                    isAnimation2Complete = false
                    isAnimation3Complete = false
                   
                    isBackPressed = false
         let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "HawadasMarwariyaViewController") as? HawadasMarwariyaViewController
                    let transition = CATransition()
                      transition.duration = 0.5
                      transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                      transition.type = CATransitionType.push
                      transition.subtype = CATransitionSubtype.fromLeft
                      
                      self.navigationController?.view.layer.add(transition, forKey: nil)
                      self.navigationController?.pushViewController(vc!, animated: false)

    }
    @IBAction func GOTarheelJasmanViewController(_ sender: UIButton?) {
        isAnimation1Complete = false
                           isAnimation2Complete = false
                           isAnimation3Complete = false
                          
                           isBackPressed = false
         let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TarheelJasmanMuqeemViewController") as? TarheelJasmanMuqeemViewController
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
