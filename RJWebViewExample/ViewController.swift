//
//  ViewController.swift
//  RJWebViewExample
//
//  Created by Raja Syahmudin on 14/08/20.
//  Copyright © 2020 RJWebView. All rights reserved.
//

import UIKit
import RJWebView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapOpenWebView(_ sender: UIButton) {
        let webViewURL = "https://id.linkedin.com/in/raja-syahmudin-harahap-8b125849"
        let vc = RJWebView.loadWebViewWith(title: "Linkedin", urlString: webViewURL)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

