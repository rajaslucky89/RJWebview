//
//  RJWebViewController.swift
//  RJWebView
//
//  Created by Raja Syahmudin on 12/08/20.
//  Copyright © 2020 RJWebView. All rights reserved.
//

import UIKit
import WebKit

class RJWebViewController: UIViewController {
    
    // IBOutlet
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // Variables
    var urlString: String?
    var navigationTitle: String?
    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        containerView.addSubview(webView)
        loadURLString(urlString)
        setNavigation()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(true)
        activityIndicator.stopAnimating()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        webView.frame = containerView.bounds
    }
    
    func loadURLString(_ urlString: String?) {
        if let webUrlString = urlString, let webURL = URL(string: webUrlString) {
            webView.load(URLRequest(url: webURL))
        }
    }
    
    func setNavigation() {
        titleLabel.text = navigationTitle
        closeButton.setTitle("X Close", for: .normal)
        closeButton.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
    }
    
    @objc func popViewController(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    class func loadWebViewWith(title: String? = nil, urlString: String?) -> RJWebViewController {
        let webBrowserViewController = RJWebViewController(nibName: "RJWebViewController", bundle: Bundle.main)
        webBrowserViewController.urlString = urlString
        webBrowserViewController.navigationTitle = title
        return webBrowserViewController
    }
}

extension RJWebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Error...")
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
}
