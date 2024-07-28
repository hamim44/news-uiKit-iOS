//
//  newsController.swift
//  news
//
//  Created by Abrar Hamim on 27/7/24.
//

import UIKit
import WebKit

class newsController: UIViewController {
    var urlString: String?
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView(frame: self.view.frame)
        self.view.addSubview(webView)
        
        if let urlString = urlString {
            if  let url = URL(string: urlString) {
                let request = URLRequest(url: url)
                webView.load(request)
            }
        }
    }
}
