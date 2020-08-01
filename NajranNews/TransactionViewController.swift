//
//  ViewController1.swift
//  APIConnect
//
//  Created by Najran Emarah on 14/05/1441 AH.
//  Copyright © 1441 Najran Emarah. All rights reserved.
//

import UIKit

class TransactionViewController: UIViewController , UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate, XMLParserDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
         return years.count
    }
   
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let numString = "\(years[row])"
               let format = NumberFormatter()
               format.locale = Locale(identifier: "ar_SA")
               let number =   format.number(from: numString)

               let arabicNumber = format.string(from: number!)
        yearTextField.text = arabicNumber
         yearPicker.isHidden = true
    }
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            var label = UILabel()
            if let v = view {
                label = v as! UILabel
            }
            label.font = UIFont (name: "Helvetica Neue", size: 30)
    //data source means your ui picker view items array
         let numString = "\(years[row])"
        let format = NumberFormatter()
        format.locale = Locale(identifier: "ar_SA")
        let number =   format.number(from: numString)

        let arabicNumber = format.string(from: number!)
       
        
            label.text =  arabicNumber
            label.textAlignment = .center
        label.textColor = .white
       
            return label
        }
    var years : [Int] = []
    var firstType = "الاستعلام عن معاملة واردة"
    var secondType = "الاستعلام برقم قيد الوارد"
    var isSecondTypeSelected = true
    let successMsg = "مكتملة بنجاح"
    let errorMsga = "لم يكتمل بنجاح"
    var currentElement = ""
    var previosElement = ""
    var keyArray: [String] = []
    let secondPlaceHolderText = "المرجو إدخال رقم قيد الوارد"
    let firstPlaceHolderText = "المرجو ادخال رقم الهوية او الاقامة"
    let secondLabelText = " رقم قيد الوارد"
    let firstLabelText = " رقم الهوية او الاقامة"
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var yearTextLabel: UILabel!
    @IBOutlet weak var infoTextField: UITextField!
    @IBOutlet weak var yearTextField: UITextField!
    @IBOutlet weak var typeFirstButton: UIButton!
    @IBOutlet weak var typeSecondButton: UIButton!
    @IBOutlet weak var yearPicker: UIPickerView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var activityIndicatorView: UIView!
    var gameTimer: Timer?
    var msgLabel: UILabel = UILabel()
    var rotateImgView : UIImageView = UIImageView()
       var angle : Double = 0
       var isRotating = false
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    override func viewDidAppear(_ animated: Bool) {
          super.viewDidAppear(animated)
           self.navigationController?.isNavigationBarHidden = true
        let lbl = self.view.viewWithTag(1000)  as! UILabel
        msgLabel = lbl
        msgLabel.layer.cornerRadius = msgLabel.frame.size.width/2
        msgLabel.layer.masksToBounds = true
        msgLabel.layer.borderColor = UIColor.white.cgColor
        msgLabel.layer.borderWidth = 5.0
        let imgV = self.view.viewWithTag(50)  as! UIImageView
              rotateImgView = imgV
          UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                            self.contentView.transform = CGAffineTransform(scaleX: -1, y: 1)
                        }, completion: {  success in
                          UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                                   self.contentView.transform = CGAffineTransform(scaleX:1, y: 1)
                                               }, completion: {  success in
                                                 
                                               })
                           
                        })
          
          UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                   self.typeFirstButton.transform = CGAffineTransform(scaleX: -1, y: 1)
                               }, completion: {  success in
                                 UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                                          self.typeFirstButton.transform = CGAffineTransform(scaleX:1, y: 1)
                                                      }, completion: {  success in
                                                        
                                                      })
                                  
                               })
          
          UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                   self.typeSecondButton.transform = CGAffineTransform(scaleX: -1, y: 1)
                               }, completion: {  success in
                                 UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {
                                                          self.typeSecondButton.transform = CGAffineTransform(scaleX:1, y: 1)
                                                      }, completion: {  success in
                                                        
                                                      })
                                  
                               })
          
          self.view.sendSubviewToBack(activityIndicatorView)
      //  infoTextField.accessibilityLanguage = "ar_SA"
       
      //  infoTextField.keyboardType = UIKeyboardType.numberPad
      }
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        infoTextField.resignFirstResponder()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         self.navigationController?.isNavigationBarHidden = true
        isSecondTypeSelected = true
        firstLabel.text = secondLabelText
        infoTextField.placeholder = secondPlaceHolderText
               typeFirstButton.backgroundColor = UIColor.darkGray
               typeFirstButton.setTitleColor(.white, for: .normal)
               
               typeSecondButton.backgroundColor = UIColor.white
               typeSecondButton.setTitleColor(.darkGray, for: .normal)
             
              let dateNow = DateFormatter()
               let islamicCalendar = Calendar.init(identifier: Calendar.Identifier.islamicCivil)
               dateNow.calendar = islamicCalendar
              // dateNow.locale = Locale.init(identifier: "ar_SA") // This is used to show numbers, day and month in arabic letters
               dateNow.dateFormat = "yyyy"
               let currYear = Int( dateNow.string(from: Date()))! + 10
               let maxPrvYear = currYear - 20
                 var selectedIdex = 0
                               var j = 0
                               for i in maxPrvYear...currYear{
                                   self.years.append(i)
                                 if i == currYear-10{
                                     selectedIdex = j
                                 }
                                 j += 1
                               }
                     yearPicker.reloadAllComponents()
                     yearPicker.selectRow(selectedIdex, inComponent: 0, animated: true)
            
               yearPicker.isHidden = false
               yearTextField.isHidden = false
               yearTextLabel.isHidden = false
               yearTextField.text = dateNow.string(from: Date())
          infoTextField.resignFirstResponder()
    }
    
    override func didMove(toParent parent: UIViewController?) {
        super.didMove(toParent: parent)
        
         infoTextField.resignFirstResponder()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
          self.view.endEditing(true)
    }
  
   
    @IBAction func selectSecondType(_ sender: Any) {
          infoTextField.resignFirstResponder()
            isSecondTypeSelected = true
        firstLabel.text = secondLabelText
        infoTextField.placeholder = secondPlaceHolderText
                  typeFirstButton.backgroundColor = UIColor.darkGray
                  typeFirstButton.setTitleColor(.white, for: .normal)
                  
                  typeSecondButton.backgroundColor = UIColor.white
                  typeSecondButton.setTitleColor(.darkGray, for: .normal)
                  
                 let dateNow = DateFormatter()
                  let islamicCalendar = Calendar.init(identifier: Calendar.Identifier.islamicCivil)
                  dateNow.calendar = islamicCalendar
                 // dateNow.locale = Locale.init(identifier: "ar_SA") // This is used to show numbers, day and month in arabic letters
                  dateNow.dateFormat = "yyyy"
                  let currYear = Int( dateNow.string(from: Date()))! + 10
                  let maxPrvYear = currYear - 20
                  var selectedIdex = 0
                  var j = 0
                  for i in maxPrvYear...currYear{
                      self.years.append(i)
                    if i == currYear-10{
                        selectedIdex = j
                    }
                    j += 1
                  }
        yearPicker.reloadAllComponents()
        yearPicker.selectRow(selectedIdex, inComponent: 0, animated: true)
                 yearPicker.selectRow(j, inComponent: 0, animated: true)
                  yearPicker.isHidden = false
                  yearTextField.isHidden = false
         yearTextLabel.isHidden = false
         yearTextField.text = dateNow.string(from: Date())
       }
    @IBAction func selectFirstType(_ sender: Any) {
          infoTextField.resignFirstResponder()
              isSecondTypeSelected = false
        firstLabel.text = firstLabelText
        infoTextField.placeholder = firstPlaceHolderText
        //typeFirstButton
                    typeSecondButton.backgroundColor = UIColor.darkGray
                    typeSecondButton.setTitleColor(.white, for: .normal)
                    
                    typeFirstButton.backgroundColor = UIColor.white
                    typeFirstButton.setTitleColor(.darkGray, for: .normal)
                    
                   let dateNow = DateFormatter()
                    let islamicCalendar = Calendar.init(identifier: Calendar.Identifier.islamicCivil)
                    dateNow.calendar = islamicCalendar
                   // dateNow.locale = Locale.init(identifier: "ar_SA") // This is used to show numbers, day and month in arabic letters
                    dateNow.dateFormat = "yyyy"
                    let currYear = Int( dateNow.string(from: Date()))! + 10
                    let maxPrvYear = currYear - 20
                     var selectedIdex = 0
                                    var j = 0
                                    for i in maxPrvYear...currYear{
                                        self.years.append(i)
                                      if i == currYear-10{
                                          selectedIdex = j
                                      }
                                      j += 1
                                    }
                          yearPicker.reloadAllComponents()
                          yearPicker.selectRow(selectedIdex, inComponent: 0, animated: true)
                 
                    yearPicker.isHidden = true
                    yearTextField.isHidden = true
         yearTextLabel.isHidden = true
         }
    @IBAction func selectYear(_ sender: Any) {
         infoTextField.resignFirstResponder()
          yearPicker.isHidden = false
    }
    @IBAction func sendData(_ sender: Any) {
           infoTextField.resignFirstResponder()
             //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
        msgLabel.text = " "
        var type = firstType
        var message = ""
        if isSecondTypeSelected == true{
            type = secondType
            message = NSLocalizedString("رقم قيد الوارد (المرجو ادخال رقم قيد الوارد )", comment: "Error message")
        }
        else{
             message = NSLocalizedString("المرجو ادخال رقم الهويه او الاقامة", comment: "Error message")
        }
        var r_Number = infoTextField.text;
        if r_Number?.isEmpty == true{
            let alert = UIAlertController(title: NSLocalizedString("تنبيه", comment: "Title"), message: message,         preferredStyle: UIAlertController.Style.alert)
            
                             let closeAction = UIAlertAction(title: NSLocalizedString("OK", comment: "The Close button title"), style: UIAlertAction.Style.cancel) { (action: UIAlertAction!) -> Void in
                             
                             
                                }
                             
                                alert.addAction(closeAction)
                              self.present(alert, animated: true, completion: nil)
                       return
        }
        r_Number = r_Number?.convertEngNumToArabicNum()
        if r_Number?.isEmpty == false && r_Number!.isDigits == true{
            
        }
        else{
           
              let alert = UIAlertController(title: NSLocalizedString("تنبيه", comment: "Title"), message: message,         preferredStyle: UIAlertController.Style.alert)
                  let closeAction = UIAlertAction(title: NSLocalizedString("OK", comment: "The Close button title"), style: UIAlertAction.Style.cancel) { (action: UIAlertAction!) -> Void in
                  
                  
                     }
                  
                     alert.addAction(closeAction)
                   self.present(alert, animated: true, completion: nil)
            return
        }
        var year = yearTextField.text;
        year = year?.convertEngNumToArabicNum()
        if year?.isDigits == true{
            
        }
        else{
            year = "0"
        }
        if isSecondTypeSelected == false{
             year = "0"
        }
        let parameters = ["type": type, "registration_number": r_Number!, "year": year!] as [String : Any]

             //create the url with URL
             let url1 = URL(string: "http://mediaadv.com.sa/phpEmarahDBService.php")! //change the url
//        let stringUrl = "http://mediaadv.com.sa/phpEmarahDBService.php?type=\(type)&registration_number=\(r_Number!)&year=\(year!)"
//
        var stringUrl = "http://eservices.e-najran.gov.sa/webservice_najran/ByKayedWared.aspx?73+78+68+79+67+78+79=49+57+57+50+&89+69+65+82=49+52+51+55+&msgType=1&RETURN=xml"
        
        stringUrl =  getUrl(year: year!, id: r_Number!)
        if let encodedURL = stringUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
          let url = URL(string: encodedURL) {
          print(url)
       
       
             //create the session object
             let session = URLSession.shared

             //now create the URLRequest object using the url object
             var request = URLRequest(url: url)
             request.httpMethod = "POST" //set http method as POST

             do {
                 request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
             } catch let error {
                 print(error.localizedDescription)
             }

             request.addValue("text/html; charset=UTF-8", forHTTPHeaderField: "Content-Type")
//             request.addValue("application/json", forHTTPHeaderField: "Accept")

             //create dataTask using the session object to send data to the server
       
           DispatchQueue.main.async {
             self.msgLabel.isHidden = true
           self.rotateImgView.isHidden = false
                                         self.showActivityIndicator(show: true)
                                     }
             let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
               
                 guard error == nil else {
                    DispatchQueue.main.async {
                         self.msgLabel.isHidden = false
                             self.rotateImgView.isHidden = true
                             self.msgLabel.text = self.errorMsga
                              self.showActivityIndicator(show: false)
                                                       }
                    
                   
                     return
                 }

                 guard let data = data else {
                    DispatchQueue.main.async {
                            self.rotateImgView.isHidden = true
                                self.msgLabel.isHidden = false
                                self.msgLabel.text = self.errorMsga
                                self.showActivityIndicator(show: false)
                             
                                                       }
                    
                    
                     return
                 }

                 do {
                     //create json object from data
                    if let dataString = String(data: data, encoding: .utf8) {
                           print("Response data string:\n \(dataString)")
                       }
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
                       
                          self.msgLabel.isHidden = true
                         self.rotateImgView.isHidden = true
                        self.msgLabel.text = self.successMsg
                         self.showActivityIndicator(show: false)
 
                        var parser: XMLParser? = XMLParser(data: data )

                        //setting delegate
                        parser?.delegate = self

                        //call the method to parse
                        var result: Bool? = parser?.parse()

                        parser?.shouldResolveExternalEntities = true
                               })
                    
                    
                   
                    
                 } catch let error {
                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now(), execute: {
                                                        print(error.localizedDescription)
                         self.rotateImgView.isHidden = true
                          self.msgLabel.isHidden = false
                                                                       self.msgLabel.text = self.errorMsga
                                                                       self.showActivityIndicator(show: false)
                                                 })
                 
                   
                 }
             })
             task.resume()
        }
       }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        previosElement = currentElement
    currentElement = elementName
    print("CurrentElementl: [\(elementName)]")
    }

    func parser(_ parser: XMLParser, foundCharacters string: String) {
    print("foundCharacters: [\(string)]")
        if currentElement == "Message"{
            
            if  let dict = string.convertToDictionary {
                print(dict)
                if dict.keys.contains("NoKey") == true{
                    let alert = UIAlertController(title: "نتىجة", message: dict["NoKey"] as! String, preferredStyle: .alert)

                           alert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: nil))
                           //alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

                           self.present(alert, animated: true)
                }
                else{
                   if let keys  = string.getKeys{
                        keyArray = keys
                        print(keys)
                        self.navigationController?.isNavigationBarHidden = false
                               let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
                                   vc.keysArray = keyArray
                                   vc.resultDictionary = dict
                               
                               let transition = CATransition()
                               transition.duration = 0.5
                               transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
                               transition.type = CATransitionType.push
                               transition.subtype = CATransitionSubtype.fromLeft
                               
                               self.navigationController?.view.layer.add(transition, forKey: nil)
                        
                               self.navigationController?.pushViewController(vc, animated: false)
                    }
                    
                  
                }
               //do something with dict
            }
            
       
        }
    }
   
    func getUrl(year:String, id: String)->String
    {
        let separators = NSCharacterSet(charactersIn: "")
        var stringUrl = "http://eservices.e-najran.gov.sa/webservice_najran/ByKayedWared.aspx?73+78+68+79+67+78+79=49+57+57+50+&89+69+65+82=49+52+51+55+&msgType=1&RETURN=xml"
        let digitArray = Array(id)
        var digitString = ""
        for dig in digitArray{
            let digit = String(dig)
            let d = Int(digit)
            switch d {
                   case 0:
                       digitString = digitString + "+48"
                   case 1:
                       digitString = digitString + "+49"
                   case 2:
                       digitString = digitString + "+50"
                   case 3:
                       digitString = digitString + "+51"
                   case 4:
                       digitString = digitString + "+52"
                   case 5:
                        digitString = digitString + "+53"
                   case 6:
                        digitString = digitString + "+54"
                   case 7:
                        digitString = digitString + "+55"
                   case 8:
                        digitString = digitString + "+56"
                  default:
                        digitString = digitString + "+57"
                   }
           
            
        }
         digitString = digitString + "+"
        digitString.remove(at: digitString.startIndex)
       
        stringUrl = "http://eservices.e-najran.gov.sa/webservice_najran/ByCITIZEN_ID.aspx?73+78+68+79+67+78+79=\(digitString)&msgType=1&RETURN=xml"
        if year == "0"{
            
        }
        else{
            let yearArray = Array(year)
            var yearString = ""
            for dig in yearArray{
               let digit = String(dig)
                let d = Int(digit)
                switch d {
                       case 0:
                           yearString = yearString + "+48"
                       case 1:
                           yearString = yearString + "+49"
                       case 2:
                           yearString = yearString + "+50"
                       case 3:
                           yearString = yearString + "+51"
                       case 4:
                           yearString = yearString + "+52"
                       case 5:
                            yearString = yearString + "+53"
                       case 6:
                            yearString = yearString + "+54"
                       case 7:
                            yearString = yearString + "+55"
                       case 8:
                            yearString = yearString + "+56"
                      default:
                            yearString = yearString + "+57"
                       }
            }
             yearString = yearString + "+"
            yearString.remove(at: yearString.startIndex)
            stringUrl = "http://eservices.e-najran.gov.sa/webservice_najran/ByKayedWared.aspx?73+78+68+79+67+78+79=\(digitString)&89+69+65+82=\(yearString)&msgType=1&RETURN=xml"
        }
        
       return stringUrl
    }
    @IBAction func GObacktoRoot(_ sender: Any) {
        
        let transition = CATransition()
        transition.duration = 0.4
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.navigationController?.view.layer.add(transition, forKey: kCATransition)
        self.navigationController?.popViewController(animated: false)
        
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
      
         return true
    }
   func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {


        var newText = NSString(string: textField.text!).replacingCharacters(in: range, with: string)

   
        newText =  appDelegate.convertStringToArabic(newText)

          // You can use this new text

        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        let isNumer = allowedCharacters.isSuperset(of: characterSet)
        if isNumer == true{
            textField.text = newText
        }
        return false
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
     textField.resignFirstResponder()

       return true
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
            let delayTime = DispatchTime.now() + 3.0
            print("one")
            DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
                self.view.sendSubviewToBack(self.activityIndicatorView)
               
            })
           
           
            isRotating = false
        }
    }
    @objc func rotateView(){
           angle = 0.1
         rotateImgView.transform = rotateImgView.transform.rotated(by: CGFloat(angle))
                 
//           activityIndicatorView.transform = activityIndicatorView.transform.rotated(by: CGFloat(angle))
//
              
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

public extension UITextField {
       override var textInputMode: UITextInputMode? {
           return UITextInputMode.activeInputModes.filter { $0.primaryLanguage == "ar_SA" }.first ?? super.textInputMode
       }
   }
extension String {
   
  var isDigits: Bool {
    guard !self.isEmpty else { return false }
    return !self.contains { Int(String($0)) == nil }
  }
    
    var getKeys: [String]?{
          
           
                  var keysArray :[String ] = []
                   let fullNameArr = self.components(separatedBy: "@")
                  if fullNameArr.count <= 0{
                       return nil
                  }
                  if fullNameArr.count <= 1{
                      let keyValueArr = fullNameArr[0].components(separatedBy: ":")
                      if keyValueArr.count <= 1{
                          
                           return nil
                      }
                      
                      
                  }
                  for keyValue in fullNameArr{
                      let keyValueArr = keyValue.components(separatedBy: ":")
                      let key = keyValueArr[0]
                      keysArray.append(key)
                    
                    
                     
                  }
         return keysArray
       }
    var convertToDictionary: [String: AnyObject]?  {
        var emptyDict = [String: AnyObject]()
        var keysArray :[String ] = []
         let fullNameArr = self.components(separatedBy: "@")
        if fullNameArr.count <= 0{
             return nil
        }
        if fullNameArr.count <= 1{
            let keyValueArr = fullNameArr[0].components(separatedBy: ":")
            if keyValueArr.count <= 1{
                 emptyDict["NoKey"] = keyValueArr[0] as AnyObject
                 return emptyDict
            }
            
            
        }
        for keyValue in fullNameArr{
            var keyValueArr = keyValue.components(separatedBy: ":")
            let key = keyValueArr[0]
            keysArray.append(key)
            var value = keyValueArr[1]
            if keyValueArr.count > 2{
                keyValueArr.remove(at: 0)
                keyValueArr.remove(at: 0)
                for v in keyValueArr{
                    value = value + ":" + v
                }
            }
            emptyDict[key] = value as AnyObject
        }
        
        return emptyDict
    }
    func convertEngNumToArabicNum()->String{
        let format = NumberFormatter()
        format.locale = Locale(identifier: "en")
        let number =   format.number(from: self)

        let faNumber = format.string(from: number!)
        return faNumber!

    }
    func convertToPersian()-> String {
        let numbersDictionary : Dictionary = ["0" : "۰","1" : "۱", "2" : "۲", "3" : "۳", "4" : "۴", "5" : "۵", "6" : "۶", "7" : "۷", "8" : "۸", "9" : "۹"]
        var str : String = self

        for (key,value) in numbersDictionary {
            str =  str.replacingOccurrences(of: key, with: value)
        }

        return str
    }
}
