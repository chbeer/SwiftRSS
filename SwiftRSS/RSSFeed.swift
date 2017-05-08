//
//  RSSFeedMeta.swift
//  SwiftRSS_Example
//
//  Created by Thibaut LE LEVIER on 05/10/2014.
//  Copyright (c) 2014 Thibaut LE LEVIER. All rights reserved.
//

public class RSSFeed: NSObject, NSCoding {
    
    public var items: [RSSItem]! = [RSSItem]()
    
    public var title: String?
    public var link: URL?
    
    func setLink(string: String!)
    {
        link = URL(string: string)
    }
    
    public var feedDescription: String?
    public var language: String?
    public var lastBuildDate: Date?
    
    func setLastBuildDate(string: String!)
    {
        lastBuildDate = Date.dateFromInternetDateTimeString(string)
    }
    
    public var generator: String?
    public var copyright: String?
    
    
    override init()
    {
        super.init()
    }
    
    // MARK: NSCoding
    required public init(coder aDecoder: NSCoder)
    {
        super.init()
        
        title = aDecoder.decodeObject(forKey: "title") as? String
        link = aDecoder.decodeObject(forKey: "link") as? URL
        feedDescription = aDecoder.decodeObject(forKey: "description") as? String
        language = aDecoder.decodeObject(forKey: "language") as? String
        lastBuildDate = aDecoder.decodeObject(forKey: "lastBuildDate") as? Date
        generator = aDecoder.decodeObject(forKey: "generator") as? String
        copyright = aDecoder.decodeObject(forKey: "copyright") as? String
        
        items = aDecoder.decodeObject(forKey: "items") as? [RSSItem]
    }
    
    public func encode(with aCoder: NSCoder)
    {
        if let title = self.title
        {
            aCoder.encode(title, forKey: "title")
        }
        
        if let link = self.link
        {
            aCoder.encode(link, forKey: "link")
        }
        
        if let feedDescription = self.feedDescription
        {
            aCoder.encode(feedDescription, forKey: "description")
        }
        
        if let language = self.language
        {
            aCoder.encode(language, forKey: "language")
        }
        
        if let lastBuildDate = self.lastBuildDate
        {
            aCoder.encode(lastBuildDate, forKey: "lastBuildDate")
        }
        
        if let generator = self.generator
        {
            aCoder.encode(generator, forKey: "generator")
        }
        
        
        if let copyright = self.copyright
        {
            aCoder.encode(copyright, forKey: "copyright")
        }
        
        aCoder.encode(self.items, forKey: "items")
    }
    
}
