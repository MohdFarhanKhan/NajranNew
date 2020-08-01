//
//  ViewController.swift
//  APIConnect
//
//  Created by Najran Emarah on 11/05/1441 AH.
//  Copyright © 1441 Najran Emarah. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, iCarouselDataSource, iCarouselDelegate {
   
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
            itemView.backgroundColor = UIColor.init(displayP3Red: 44.0/255, green: 180.0/255, blue: 100.0/255, alpha: 0.1)
            itemView.layer.cornerRadius = 10
            itemView.layer.masksToBounds = true
            itemView.layer.borderWidth = 1.5
            itemView.layer.borderColor = UIColor.init(displayP3Red: 144.0/255, green: 199.0/255, blue: 164.0/255, alpha: 0.9).cgColor
            
           // itemView.alpha = 0.9
            // Add Child View as Subview
          
           }
         
          
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
            GOto1(nil)
            
        case 1:
            GOtoOldConditionViewController(nil)
            
        case 2:
            GOtoEmarahNewsViewController(nil)
           
       
        default:
            GOto2(nil)
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
       
        items.append("iPhone10")
        
       
        items.append("iPhone11")
        
        items.append("iPhone12")
        
        items.append("iPhone13")
    }
     @IBOutlet var carousel: iCarousel!
    var imgV : UIView = UIView()
    
     var items: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationController?.isNavigationBarHidden = true
        carousel.type = .cylinder
        let imgView = self.view.viewWithTag(100)!
              imgView.frame = CGRect(origin: CGPoint(x: 0, y: 0), size: self.view.frame.size)
              imgV = imgView
        UIView.animate(withDuration: 0.75, delay: 0.0, options: .curveEaseInOut, animations: {
            self.imgV.transform = CGAffineTransform(scaleX: -1, y: 1)
                                
                             }, completion: {  success in
                               
                                UIView.animate(withDuration: 1, delay: 0.0, options: .curveEaseInOut, animations: {
                                    self.imgV.transform = CGAffineTransform(scaleX: 1, y: 1)
                                }, completion: {  success in
                                    self.perform(#selector(self.flip), with: nil, afterDelay: 0.00)
                                })
                             })
       
        let array = ["AboutImarah.txt","TalabIstedua.txt", "TajdeedTasareehulAslaha.txt","IsteduaAlHawadas.txt","TarjeelJasmanMuqeem.txt","MinGairSaudiMuqeem.txt","MinGairSaudiBilKharij.txt","MinGairSaudi.txt","ZawajAjnabiMauloodBilMulk.txt","FathIsterahatAwNaqlMulkiya.txt","TajdeedMaloomatIsterahat.txt","GairSaudiLilSakan.txt","GairSaudiMauloodBilSaudi.txt"]
        for fName in array{
            let filePath = "http://mediaadv.com.sa/\(fName)"
            guard let url = URL(string: filePath ) else { return }

                          let urlSession = URLSession(configuration: .default, delegate: self, delegateQueue: OperationQueue())

                          let downloadTask = urlSession.downloadTask(with: url)
                          downloadTask.resume()
        }
       
      
      //   Do any additional setup after loading the view, typically from a nib.
    }
    @objc func flip() {
        let transitionOptions: UIView.AnimationOptions = [.transitionCurlUp, .showHideTransitionViews]

        UIView.transition(with: view, duration: 1.0, options: transitionOptions, animations: {
            self.imgV.isHidden = true
        })

        UIView.transition(with: self.view, duration: 1.0, options: transitionOptions, animations: {
            self.view.isHidden = false
            self.imgV.removeFromSuperview()
        })
    }
  
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         self.navigationController?.isNavigationBarHidden = true
        self.title = "امارة منطقة نجران"
        
        
        self.carousel.scroll(byNumberOfItems: 3, duration: 0.75)
       
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) { [unowned self] in
         self.carousel.scroll(byNumberOfItems:1, duration: 0.75)
               
        //  self.animateMe()
      }
    }
    func animateMe(){
      
        UIView.animate(withDuration: 1.75, delay: 0.0, options: .curveEaseInOut, animations: {
                  self.carousel.scrollToItem(at: 3, animated: true)
                                   }, completion: {  success in
                                     UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                                              self.carousel.transform = CGAffineTransform(scaleX:1, y: 1)
                                                          }, completion: {  success in
                                                                self.carousel.scrollToItem(at: 0, animated: true)
                                                          })

                                   })
    }
  @IBAction func GOtoAbout(_ sender: UIButton?) {
         self.navigationController?.isNavigationBarHidden = false
         let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AboutPageViewController") as! AboutPageViewController
         
         let transition = CATransition()
         transition.duration = 0.5
         transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
         transition.type = CATransitionType.push
         transition.subtype = CATransitionSubtype.fromLeft
         
         self.navigationController?.view.layer.add(transition, forKey: nil)
  
         self.navigationController?.pushViewController(vc, animated: false)
         
     }
    @IBAction func GOto1(_ sender: UIButton?) {
        self.navigationController?.isNavigationBarHidden = false
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "TransactionViewController") as! TransactionViewController
        
        let transition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        
        self.navigationController?.view.layer.add(transition, forKey: nil)
 
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    @IBAction func GOto2(_ sender: UIButton?) {
           let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "AboutEmarahViewController") as? AboutEmarahViewController
         let transition = CATransition()
           transition.duration = 0.5
           transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
           transition.type = CATransitionType.push
           transition.subtype = CATransitionSubtype.fromLeft
           
           self.navigationController?.view.layer.add(transition, forKey: nil)
           self.navigationController?.pushViewController(vc!, animated: false)
           
       }
    @IBAction func GOtoOldConditionViewController(_ sender: UIButton?) {
              let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "OldCondition1ViewController") as? OldCondition1ViewController
            let transition = CATransition()
              transition.duration = 0.5
              transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
              transition.type = CATransitionType.push
              transition.subtype = CATransitionSubtype.fromLeft
              
              self.navigationController?.view.layer.add(transition, forKey: nil)
              self.navigationController?.pushViewController(vc!, animated: false)
              
          }
    @IBAction func GOtoEmarahNewsViewController(_ sender: UIButton?) {
                 let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "EmarahNewsViewController") as? EmarahNewsViewController
               let transition = CATransition()
                 transition.duration = 0.5
                 transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                 transition.type = CATransitionType.push
                 transition.subtype = CATransitionSubtype.fromLeft
                 
                 self.navigationController?.view.layer.add(transition, forKey: nil)
                 self.navigationController?.pushViewController(vc!, animated: false)
                 
             }
}

extension HomeViewController:  URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        print("downloadLocation:", location)
        guard let url = downloadTask.originalRequest?.url else { return }
        let documentsPath = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask)[0]
        let destinationURL = documentsPath.appendingPathComponent(url.lastPathComponent)
        // delete original copy
        try? FileManager.default.removeItem(at: destinationURL)
        // copy from temp to Document
        do {
            try FileManager.default.copyItem(at: location, to: destinationURL)
            
        } catch let error {
            print("Copy Error: \(error.localizedDescription)")
        }
    }
}
