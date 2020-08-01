//
//  EmarahNewsViewController.swift
//  NajranNews
//
//  Created by Najran Emarah on 24/05/1441 AH.
//  Copyright © 1441 Najran Emarah. All rights reserved.
//

import UIKit
import WebKit
class EmarahNewsViewController: UIViewController, WKNavigationDelegate {
    var gameTimer: Timer?
    var angle : Double = 0
    var isRotating = false
     @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var activityIndicatorView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
       
         webView.navigationDelegate = self
        let url = URL(string: "https://www.moi.gov.sa/wps/portal/Home/emirates/najran/!ut/p/z1/04_Sj9CPykssy0xPLMnMz0vMAfIjo8ziLQPdnT08TIy83Q0dzQwcPc2N_A08TQ3dPY30wwkpiAJKG-AAjgZA_VFgJc7ujh4m5j4GBhY-7qYGno4eoUGWgcbGBo7GUAV4zAhOLNIvyI0wyDJxVAQAWYyrQQ!!/dz/d5/L2dJQSEvUUt3QS80TmxFL1o2XzBJNDRIMTQySzhGQzUwQVFNMEE3VEIzOEQ0/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = true
          self.view.sendSubviewToBack(activityIndicatorView)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func GObacktoRoot(_ sender: Any) {
           
           let transition = CATransition()
           transition.duration = 0.4
           transition.type = CATransitionType.push
           transition.subtype = CATransitionSubtype.fromRight
           self.navigationController?.view.layer.add(transition, forKey: kCATransition)
           self.navigationController?.popViewController(animated: false)
           
       }
    func showActivityIndicator(show: Bool) {
        if show {
            if isRotating == true{
                gameTimer?.invalidate()
                self.view.sendSubviewToBack(activityIndicatorView)
                isRotating = false
            }
            self.view.bringSubviewToFront(activityIndicatorView)
            rotateView()
            
            gameTimer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector: #selector(rotateView), userInfo: nil, repeats: true)
            isRotating = true
           
        } else {
           gameTimer?.invalidate()
            self.view.sendSubviewToBack(activityIndicatorView)
            isRotating = false
        }
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showActivityIndicator(show: true)
    }


    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        showActivityIndicator(show: false)
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
         showActivityIndicator(show: false)
    }
    @objc func rotateView(){
        angle = 0.1
        activityIndicatorView.transform = activityIndicatorView.transform.rotated(by: CGFloat(angle))
       
           
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
