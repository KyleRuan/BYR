////
////  LoginViewController.swift
////  Byr
////
////  Created by Jason on 15/10/13.
////  Copyright © 2015年 KYLERUAN. All rights reserved.
////
//
//import UIKit
//import Alamofire
//
//
//
//class LoginViewController: UIViewController ,UIWebViewDelegate {
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    let webview      = UIWebView(frame: self.view.frame)
//        webview.loadRequest(NSURLRequest(URL: NSURL(string: "http://bbs.byr.cn/oauth2/authorize?response_type=token&client_id=2a44821105d92482960593d94e4d042e&redirect_uri=http://bbs.byr.cn/oauth2/callback&state=2222")!))
//            self.view.addSubview(webview)
//    webview.delegate = self
//    }
//    func webViewDidFinishLoad(webView: UIWebView) {
//        let requestURLString:NSString = (webView.request?.URL?.absoluteString)!
//
//       let seq = requestURLString.componentsSeparatedByString("?")
//        
//         if requestURLString.containsString("access_token"){
//            let a = webView.request?.URL?.query
//            print("aaaaaaaa=\(a)")
//         let   accessRange = requestURLString.rangeOfString("access_token")
//         let    substring = requestURLString.substringFromIndex(accessRange.location)
//            let access_token = substring.componentsSeparatedByString("&")[0].componentsSeparatedByString("=")[1]
////             AccessToken = access_token
//            
//            let storyboard = UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
//            let start=storyboard.instantiateViewControllerWithIdentifier("TabBarController")
//                as! UITabBarController
//            
//            self.view.window?.rootViewController = start
//           print(AccessToken)
//       
////            http://bbs.byr.cn/oauth2/me
////            http://bbs.byr.cn/oauth2/me?response_type=token&client_id=2a44821105d92482960593d94e4d042e&redirect_uri=http://bbs.byr.cn/oauth2/callback&state=4d404f05d04eb891caacbc808ab45db1
//            
//            let param = ["oauth_token":AccessToken]
//            print("OK")
//            Alamofire.request(.GET, "http://bbs.byr.cn/open/user/getinfo.json", parameters: param).responseSwiftyJSON{
//                (request,response ,result ,error) in
//                if let err = error {
//                   print(err)
//                } else {
//                    print(request)
//                    print(result)
//                }
//            }
////            Alamofire.request(.GET, " http://bbs.byr.cn/open/user/getinfo.json?/oauth_token=\(AccessToken)").responseJSON(completionHandler: { (request, response, ressult) -> Void in
////                print(request)
////                print(response)
////                print(ressult)
////                
////            })
//            
//            }
////            http://bbs.byr.cn/open/user/getinfo.json?oauth_token=ddd06f3d6675fa948970dfe763e47f30
//
//            
//        }
//
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//
//    
//    
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
