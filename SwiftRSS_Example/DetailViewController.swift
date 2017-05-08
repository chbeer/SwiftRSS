//
//  DetailViewController.swift
//  SwiftRSS_Example
//
//  Created by Thibaut LE LEVIER on 05/09/2014.
//  Copyright (c) 2014 Thibaut LE LEVIER. All rights reserved.
//

import UIKit
import SwiftRSS

class DetailViewController: UIViewController {
                            
    @IBOutlet weak var itemWebView: UIWebView!


    var detailItem: RSSItem? {
        didSet {
            self.configureView()
        }
    }

    func configureView() {
        
        if let item: RSSItem = self.detailItem
        {
            if let webView = self.itemWebView
            {
                
                if let templateURL = Bundle.main.url(forResource: "template", withExtension: "html")
                {
                    if var template = try? String(contentsOf: templateURL, encoding: .utf8)
                    {
                        if let title = item.title
                        {
                            template = template.replacingOccurrences(of: "###TITLE###", with: title)
                        }
                        
                        if let content = item.content
                        {
                            template = template.replacingOccurrences(of: "###CONTENT###", with: content)
                        }
                        else if let description = item.itemDescription
                        {
                            template = template.replacingOccurrences(of: "###CONTENT###", with: description)
                        }
                        
                        if let date = item.pubDate
                        {
                            let formatter = DateFormatter()
                            formatter.dateFormat = "MMM dd, yyyy"
                            
                            template = template.replacingOccurrences(of: "###DATE###", with: formatter.string(from: date))
                        }
                        
                        webView.loadHTMLString(template, baseURL: nil)
                    }
                    
                }
                else
                {
                    if let content = item.content
                    {
                        webView.loadHTMLString(content, baseURL: nil)
                    }
                    else if let description = item.itemDescription
                    {
                        webView.loadHTMLString(description, baseURL: nil)
                    }
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

