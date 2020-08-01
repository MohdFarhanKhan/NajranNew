//
//  AboutPageViewController.swift
//  NajranNews
//
//  Created by Najran Emarah on 15/07/1441 AH.
//  Copyright © 1441 Najran Emarah. All rights reserved.
//

import UIKit
import MessageUI
class AboutPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , MFMessageComposeViewControllerDelegate{
    /*
     twitter: https://twitter.com/emara_najran
     call   : 00966175223600
     web  : http://www.najran.gov.sa/Pages/default.aspx
     email:  link@najran.gov.sa
     */
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    }
    func getLinkTitle(row: Int)->String{
        if row == 1{
                   return "info@e-najran.gov.sa"
               }
        else  if row == 2{
                          return "www.e-najran.gov.sa"
                      }
        else{
          return "https://twitter.com/emara_najran"
            
        }
    }
  
    func underlinedString(string: NSString, term: NSString) -> NSAttributedString {
        let output = NSMutableAttributedString(string: string as String)
        let underlineRange = string.range(of: term as String)
        
        let s1 = string as String
        let s2 = term as String
        let s = s1.replacingOccurrences(of: s2, with: "") as NSString
        let noUnderlineRange = string.range(of: s as String)
        
        output.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.init().rawValue, range: NSMakeRange(0, string.length))
        
        output.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white , range: underlineRange)
        
        output.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white , range: noUnderlineRange)
       
        output.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: underlineRange)

        return output
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        if indexPath.row == 0{
             let cell = tableView.dequeueReusableCell(withIdentifier: "callIdentifier", for: indexPath)
             let btCall1 = cell.viewWithTag(1000) as! UIButton
             let btCall2 = cell.viewWithTag(1001) as! UIButton
            let string1 = "017-522-0000"
            let string2 = "800-124-0080"
            let attributedString1 = underlinedString(string: string1 as NSString, term: string1 as NSString)
            btCall1.setAttributedTitle(attributedString1, for: .normal)
            let attributedString2 = underlinedString(string: string2 as NSString, term: string2 as NSString)
            btCall2.setAttributedTitle(attributedString2, for: .normal)
             btCall1.addTarget(self, action: #selector(contactViaPhone), for: .touchUpInside)
             btCall2.addTarget(self, action: #selector(contactViaPhone1), for: .touchUpInside)
              return cell
                 
        }
        else{
            var cell = UITableViewCell()
              let optionNo = indexPath.row
             print(optionNo)
            switch optionNo {
                        case 1:
                        cell = tableView.dequeueReusableCell(withIdentifier: "otherldentifier1", for: indexPath)
                            break
                        case 2:
                         cell = tableView.dequeueReusableCell(withIdentifier: "otherldentifier2", for: indexPath)
                            break
                       
                        default:
                         cell = tableView.dequeueReusableCell(withIdentifier: "otherldentifier3", for: indexPath)
                            break
                        }
           
            let btShop = cell.viewWithTag(1000) as! UIButton
            let string = getLinkTitle(row: indexPath.row)
            
            let attributedString = underlinedString(string: string as NSString, term: string as NSString)
               btShop.setAttributedTitle(attributedString, for: .normal)
          
            
             switch optionNo {
             case 1:
              btShop.addTarget(self, action: #selector(sendEmail), for: .touchUpInside)
                 break
             case 2:
               btShop.addTarget(self, action: #selector(openWebLink), for: .touchUpInside)
                 break
            
             default:
               btShop.addTarget(self, action: #selector(openTwitter), for: .touchUpInside)
                 break
             }
              return cell
        }
        
       
           
         
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let optionNo = indexPath.row
        print(optionNo)
        switch optionNo {
        case 0:
            break
        case 1:
            break
        case 2:
               break
        case 3:
                break
        default:
            break
        }
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.contentView.frame.size.height/6
    }
  
    @IBOutlet weak var contactTableView: UITableView!
@IBOutlet weak var contentView: UIView!
    var isAnimationComplete = false
   
    var isBackPressed = false
    var aboutImageView = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutImageView = self.view.viewWithTag(1000) as! UIImageView
 self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
        self.navigationController?.isNavigationBarHidden = true
                  
                  UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                    self.contentView.transform = CGAffineTransform(scaleX: -1, y: 1)
                     self.aboutImageView.transform = CGAffineTransform(scaleX: -1, y: 1)
                                }, completion: {  success in
                                  UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                                           self.contentView.transform = CGAffineTransform(scaleX:1, y: 1)
                                    self.aboutImageView.transform = CGAffineTransform(scaleX:1, y: 1)
                                                       }, completion: {  success in
                                                           self.isAnimationComplete = true
                                                           self.goBack()
                                                       })
                                   
                                })
    }
    override func viewDidAppear(_ animated: Bool) {
             super.viewDidAppear(animated)
              self.navigationController?.isNavigationBarHidden = true
        self.contactTableView.estimatedRowHeight = self.contentView.frame.size.height/4
        contactTableView.rowHeight = UITableView.automaticDimension
        self.contactTableView.reloadData()
          
         }
    func goBack(){
         
                     if isBackPressed == true && isAnimationComplete == true {
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
            if  isAnimationComplete == true{
                             goBack()
                          }
        
    }
    @objc func contactViaPhone(){
        let alertController = UIAlertController(title:"ماذا تريد ؟" , message: "",         preferredStyle: UIAlertController.Style.alert)
             
              let imgAction = UIAlertAction(title: "رسالة قصيرة", style: .default) { (action: UIAlertAction!) in
                  self.sendSMS(mobileNo: "017-522-0000")
                  }
                  
            
              let imageSms = UIImage(named: "sms")?.imageWithSize(scaledToSize: CGSize(width: 30, height: 30))
              let f = alertController.view.frame.size.width/2
              let left = CGFloat(-1)*f ;
              let smsRightImage = imageSms?.withAlignmentRectInsets(UIEdgeInsets(top: 0,left: left,bottom: 0,right: 0))
                  
                
              imgAction.setValue(smsRightImage?.withRenderingMode(.alwaysOriginal), forKey: "_image")
              
            
               alertController.addAction(imgAction)
              //call
              
              let imgActionCall = UIAlertAction(title: "مكالمة هاتفية", style: .default)  { (action: UIAlertAction!) in
                  self.callToMobile(mobileNo: "TEL://017-522-0000")
                    }
                    
              
                let imageCall = UIImage(named: "call")?.imageWithSize(scaledToSize: CGSize(width: 30, height: 30))
                
              let callRightImage = imageCall?.withAlignmentRectInsets(UIEdgeInsets(top: 0,left: left,bottom: 0,right: 0))
                         
              imgActionCall.setValue(callRightImage?.withRenderingMode(.alwaysOriginal), forKey: "_image")
                
              
                 alertController.addAction(imgActionCall)
              
              //cancel
              let imgActionCancel = UIAlertAction(title: " إلغاء", style: .default){ (action: UIAlertAction!) in
                              
                           }
                           
                     
                       let imageCancel = UIImage(named: "cancel")?.imageWithSize(scaledToSize: CGSize(width: 30, height: 30))
                       
                       let cancelRightImage = imageCancel?.withAlignmentRectInsets(UIEdgeInsets(top: 0,left: left,bottom: 0,right: 0))
                                        
                             imgActionCancel.setValue(cancelRightImage?.withRenderingMode(.alwaysOriginal), forKey: "_image")
                           
                     
                        alertController.addAction(imgActionCancel)
              
              
               self.present(alertController, animated: true)
          
                 
       
    }
    func sendSMS(mobileNo: String){
       
        let composeVC = MFMessageComposeViewController()
                composeVC.messageComposeDelegate = self

                      // Configure the fields of the interface.
                      composeVC.recipients = [mobileNo]
                      composeVC.body = "Write message...."
        
                      // Present the view controller modally.
                      if MFMessageComposeViewController.canSendText() {
                          self.present(composeVC, animated: true, completion: nil)
                      }
    }
    func callToMobile(mobileNo: String){
           let url = URL(string: mobileNo)!
                           UIApplication.shared.open(url, options: [:], completionHandler: nil)
       }
    @objc func contactViaPhone1(){
         let alertController = UIAlertController(title:"ماذا تريد ؟" , message: "",         preferredStyle: UIAlertController.Style.alert)
       
        let imgAction = UIAlertAction(title: "رسالة قصيرة", style: .default) { (action: UIAlertAction!) in
            self.sendSMS(mobileNo: "800-124-0080")
            }
            
      
        let imageSms = UIImage(named: "sms")?.imageWithSize(scaledToSize: CGSize(width: 30, height: 30))
        let f = alertController.view.frame.size.width/2
        let left = CGFloat(-1)*f ;
        let smsRightImage = imageSms?.withAlignmentRectInsets(UIEdgeInsets(top: 0,left: left,bottom: 0,right: 0))
            
          
        imgAction.setValue(smsRightImage?.withRenderingMode(.alwaysOriginal), forKey: "_image")
        
      
         alertController.addAction(imgAction)
        //call
        
        let imgActionCall = UIAlertAction(title: "مكالمة هاتفية", style: .default)  { (action: UIAlertAction!) in
            self.callToMobile(mobileNo: "TEL://800-124-0080")
              }
              
        
          let imageCall = UIImage(named: "call")?.imageWithSize(scaledToSize: CGSize(width: 30, height: 30))
          
        let callRightImage = imageCall?.withAlignmentRectInsets(UIEdgeInsets(top: 0,left: left,bottom: 0,right: 0))
                   
        imgActionCall.setValue(callRightImage?.withRenderingMode(.alwaysOriginal), forKey: "_image")
          
        
           alertController.addAction(imgActionCall)
        
        //cancel
        let imgActionCancel = UIAlertAction(title: " إلغاء", style: .default){ (action: UIAlertAction!) in
                        
                     }
                     
               
                 let imageCancel = UIImage(named: "cancel")?.imageWithSize(scaledToSize: CGSize(width: 30, height: 30))
                 
                 let cancelRightImage = imageCancel?.withAlignmentRectInsets(UIEdgeInsets(top: 0,left: left,bottom: 0,right: 0))
                                  
                       imgActionCancel.setValue(cancelRightImage?.withRenderingMode(.alwaysOriginal), forKey: "_image")
                     
               
                  alertController.addAction(imgActionCancel)
        
        
         self.present(alertController, animated: true)
            //      self.present(alertController, animated: true, completion: nil)
       }
    @objc func sendEmail(){
      
      
        if MFMailComposeViewController.canSendMail(){
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
            mail.setCcRecipients(["link@najran.gov.sa"])
            mail.setMessageBody("Enter text", isHTML: false)
            self.present(mail, animated: true, completion: nil)
        }
        else{
            let message = "خدمات البريد غير متاحة"
            let alert = UIAlertController(title: NSLocalizedString("تنبيه", comment: "Title"), message: message,         preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: nil))
              
                self.present(alert, animated: true)
                  
            
        }
          func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error : Error?){
            controller.dismiss(animated: true, completion: nil)
             }
       }
   @objc func openWebLink(){
     if let url = URL(string: "http://www.e-najran.gov.sa"){
        if UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
      }
    }
   @objc func openTwitter(){
    let screenName = "emara_najran"
    let appUrl = URL(string: "twitter://user?screen_name=\(screenName)")!
    let webUrl = URL(string: "https://twitter.com/\(screenName)")!
    if UIApplication.shared.canOpenURL(appUrl){
        UIApplication.shared.open(appUrl, options: [:], completionHandler: nil)
    }
    else{
        UIApplication.shared.open(webUrl, options: [:], completionHandler: nil)
          
    }
   }
    

}
