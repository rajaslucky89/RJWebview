//
//  RJWebView.swift
//  RJWebView
//
//  Created by Raja Syahmudin on 12/08/20.
//  Copyright © 2020 RJWebView. All rights reserved.
//

import UIKit
import WebKit

public class RJWebView: UIViewController {
    
    // IBOutlet
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // Variables
    public var urlString: String?
    public var navigationTitle: String?
    public var webView = WKWebView()
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        containerView.addSubview(webView)
        loadURLString(urlString)
        setNavigation()
    }
    
    override public func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override public func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(true)
        activityIndicator.stopAnimating()
    }
    
    override public func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        webView.frame = containerView.bounds
    }
    
    public func loadURLString(_ urlString: String?) {
        if let webUrlString = urlString, let webURL = URL(string: webUrlString) {
            webView.load(URLRequest(url: webURL))
        }
    }
    
    public func setNavigation() {
        titleLabel.text = navigationTitle
        closeButton.setTitle("X Close", for: .normal)
        closeButton.addTarget(self, action: #selector(popViewController), for: .touchUpInside)
    }
    
    @objc func popViewController(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    public class func loadWebViewWith(title: String? = nil, urlString: String?) -> RJWebView {
        let webBrowserViewController = RJWebView(nibName: "RJWebView", bundle: Bundle.main)
        webBrowserViewController.urlString = urlString
        webBrowserViewController.navigationTitle = title
        return webBrowserViewController
    }

}

extension RJWebView: WKNavigationDelegate {
    public func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        activityIndicator.startAnimating()
    }
    
    public func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }
    
    public func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print("Error...")
    }
    
    public func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
}
