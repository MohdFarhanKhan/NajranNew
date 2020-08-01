//
//  AppDelegate.swift
//  NajranNews
//
//  Created by Najran Emarah on 18/05/1441 AH.
//  Copyright © 1441 Najran Emarah. All rights reserved.
//
//http://eservices.e-najran.gov.sa/webservice_najran/ByKayedWared.aspx?73+78+68+79+67+78+79=49+50+51+52+53+&89+69+65+82=49+52+51+55+&msgType=1&RETURN=xml
//http://eservices.e-najran.gov.sa/webservice_najran/ByCITIZEN_ID.aspx?73+78+68+79+67+78+79=53+51+51+51+51+51+51+51+51+51+&msgType=1&RETURN=xml


import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
   func convertStringToArabic(_ paramString: String) -> String{
           var finalString: String = paramString
           finalString = finalString.replacingOccurrences(of: "1", with: "١")
           finalString = finalString.replacingOccurrences(of: "2", with: "٢")
           finalString = finalString.replacingOccurrences(of: "3", with: "٣")
           finalString = finalString.replacingOccurrences(of: "4", with: "٤")
           finalString = finalString.replacingOccurrences(of: "5", with: "٥" )
           finalString = finalString.replacingOccurrences(of: "6", with: "٦")
           finalString = finalString.replacingOccurrences(of: "7", with: "٧" )
           finalString = finalString.replacingOccurrences(of: "8", with: "٨")
           finalString = finalString.replacingOccurrences(of: "9", with: "٩")
           finalString = finalString.replacingOccurrences(of: "0", with: ".")
                     
                               
           return finalString
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
//        let letnavigationBarAppearace = UINavigationBar.appearance()
//       
//      // letnavigationBarAppearace.tintColor = uicolorFromHex(rgbValue: 0xffffff)
//        letnavigationBarAppearace.barTintColor = UIColor.init(red: 197.0/255, green: 198.0/255, blue: 199.0/255, alpha: 0.50)
//       
//        // change navigation item title color
//        letnavigationBarAppearace.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
//        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
        self.saveContext()
    }

    // MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentContainer(name: "NajranNews")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support

    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    func uicolorFromHex(rgbValue:UInt32)->UIColor{
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0

        return UIColor(red:red, green:green, blue:blue, alpha:1.0)
    }
   
}
extension UIView {
func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
    let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
    rotateAnimation.fromValue = 0.0
    rotateAnimation.toValue = CGFloat(Double.pi)
    rotateAnimation.duration = duration

    if let delegate: CAAnimationDelegate = completionDelegate as! CAAnimationDelegate? {
        rotateAnimation.delegate = delegate
    }
    self.layer.add(rotateAnimation, forKey: nil)
}
  
}

extension String {
    var data: Data {
        return Data(utf8)
    }
}
extension Data {
    var attributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options:[.documentType : NSAttributedString.DocumentType.rtf], documentAttributes: nil)
        } catch {
            print(error)
        }
        return nil
    }
}
extension UIImage {
    func imageWithSize(scaledToSize newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return newImage
    }
}
extension UIImage {
    class func imageWithView(_ view: UIView) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0)
        defer { UIGraphicsEndImageContext() }
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        return UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
    }
}
public extension UIView {
    @available(iOS 10.0, *)
   
    func scale(by scale: CGFloat) {
           self.contentScaleFactor = scale
           for subview in self.subviews {
               subview.scale(by: scale)
           }
       }

       func getImage(scale: CGFloat? = nil) -> UIImage {
           let newScale = scale ?? UIScreen.main.scale
           self.scale(by: newScale)

           let format = UIGraphicsImageRendererFormat()
           format.scale = newScale

           let renderer = UIGraphicsImageRenderer(size: self.bounds.size, format: format)

           let image = renderer.image { rendererContext in
               self.layer.render(in: rendererContext.cgContext)
           }

           return image
       }
}
