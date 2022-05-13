//
//  WebViewController.swift
//  SGWeb
//
//  Created by Rostyslav Gress on 13.05.22.
//

import UIKit
import WebKit


class WebViewController: UIViewController, WKUIDelegate, WKNavigationDelegate {
    @IBOutlet weak var formWebView: WKWebView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWebView()
    }

    func loadWebView() {
        if let url = Bundle.main.url(forResource: "index", withExtension: "html", subdirectory: "") {
            print(url)
            formWebView.loadFileURL(url, allowingReadAccessTo: url)
            let request = URLRequest(url: url)
            formWebView.load(request)
        } else {
            print("Error -> Html file not found!")
        }

        formWebView.uiDelegate = self
        formWebView.navigationDelegate = self
    }
}
