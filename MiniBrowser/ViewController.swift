//
//  ViewController.swift
//  MiniBrowser
//
//  Created by 이규진 on 2016. 9. 1..
//  Copyright © 2016년 이규진. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIWebViewDelegate {

    @IBOutlet weak var bookMarkSegmentedControl: UISegmentedControl!
    @IBOutlet weak var urlTextField: UITextField!    
    @IBOutlet weak var mainWebView: UIWebView!
    @IBOutlet weak var spinningActivityIndicatorView: UIActivityIndicatorView!

    @IBAction func boookMarkAction(_ sender: AnyObject) {
        let bookMarkUrl = bookMarkSegmentedControl.titleForSegment(at: bookMarkSegmentedControl.selectedSegmentIndex)
        let urlString = "https://www.\(bookMarkUrl!).com"
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString

    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        var urlString = "\(urlTextField.text!)"
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
        if !urlString.hasPrefix("https://") {
            urlString = "https://\(urlTextField.text!)"
        }
        urlTextField.text = urlString
        
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
        textField.resignFirstResponder()
        
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let urlString = "https://www.facebook.com"
        mainWebView.loadRequest(URLRequest(url: URL(string: urlString)!))
        urlTextField.text = urlString
        spinningActivityIndicatorView.hidesWhenStopped = true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        spinningActivityIndicatorView.startAnimating()

    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        spinningActivityIndicatorView.stopAnimating()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

