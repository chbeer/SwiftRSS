//
//  RSSParser.swift
//  SwiftRSS_Example
//
//  Created by Thibaut LE LEVIER on 05/09/2014.
//  Copyright (c) 2014 Thibaut LE LEVIER. All rights reserved.
//

public typealias RSSParserCallback = (_ feed: RSSFeed?, _ error: NSError?) -> Void

public class RSSParser: NSObject, XMLParserDelegate {
    
    public class func parseFeedForRequest(_ request: URLRequest, callback: @escaping RSSParserCallback)
    {
        let rssParser: RSSParser = RSSParser()
        
        rssParser.parseFeedForRequest(request, callback: callback)
    }
    
    var callbackClosure: RSSParserCallback?
    var currentElement: String = ""
    var currentItem: RSSItem?
    var feed: RSSFeed = RSSFeed()
    
    // node names
    let node_item: String = "item"
    
    let node_title: String = "title"
    let node_link: String = "link"
    let node_guid: String = "guid"
    let node_publicationDate: String = "pubDate"
    let node_description: String = "description"
    let node_content: String = "content:encoded"
    let node_language: String = "language"
    let node_lastBuildDate = "lastBuildDate"
    let node_generator = "generator"
    let node_copyright = "copyright"
    // wordpress specifics
    let node_commentsLink = "comments"
    let node_commentsCount = "slash:comments"
    let node_commentRSSLink = "wfw:commentRss"
    let node_author = "dc:creator"
    let node_category = "category"
    
    func parseFeedForRequest(_ request: URLRequest, callback: @escaping RSSParserCallback)
    {
        NSURLConnection.sendAsynchronousRequest(request, queue: OperationQueue.main) { (response, data, error) -> Void in

            if let error = error
            {
                callback(nil, error as NSError)
            }
            else if let data = data
            {
                self.callbackClosure = callback
                
                let parser = XMLParser(data: data)
                parser.delegate = self
                parser.shouldResolveExternalEntities = false
                parser.parse()
            }
        }
    }
    
// MARK: NSXMLParserDelegate
    public func parserDidStartDocument(_ parser: XMLParser)
    {
    }
    
    public func parserDidEndDocument(_ parser: XMLParser)
    {
        if let closure = self.callbackClosure
        {
            closure(self.feed, nil)
        }
    }
    
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == node_item
        {
            self.currentItem = RSSItem()
        }
        
        self.currentElement = ""
        
    }
   
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if elementName == node_item
        {
            if let item = self.currentItem
            {
                self.feed.items.append(item)
            }
            
            self.currentItem = nil
            return
        }
        
        if let item = self.currentItem
        {
            if elementName == node_title
            {
                item.title = self.currentElement
            }
            
            if elementName == node_link
            {
                item.setLink(string: self.currentElement)
            }
            
            if elementName == node_guid
            {
                item.guid = self.currentElement
            }
            
            if elementName == node_publicationDate
            {
                item.setPubDate(string: self.currentElement)
            }
            
            if elementName == node_description
            {
                item.itemDescription = self.currentElement
            }
            
            if elementName == node_content
            {
                item.content = self.currentElement
            }
            
            if elementName == node_commentsLink
            {
                item.setCommentsLink(string: self.currentElement)
            }
            
            if elementName == node_commentsCount
            {
                item.commentsCount = Int(self.currentElement)
            }
            
            if elementName == node_commentRSSLink
            {
                item.setCommentRSSLink(string: self.currentElement)
            }
            
            if elementName == node_author
            {
                item.author = self.currentElement
            }
            
            if elementName == node_category
            {
                item.categories.append(self.currentElement)
            }
            
        }
        else
        {
            if elementName == node_title
            {
                feed.title = self.currentElement
            }
            
            if elementName == node_link
            {
                feed.setLink(string: self.currentElement)
            }
            
            if elementName == node_description
            {
                feed.feedDescription = self.currentElement
            }
            
            if elementName == node_language
            {
                feed.language = self.currentElement
            }
            
            if elementName == node_lastBuildDate
            {
                feed.setLastBuildDate(string: self.currentElement)
            }
            
            if elementName == node_generator
            {
                feed.generator = self.currentElement
            }
            
            if elementName == node_copyright
            {
                feed.copyright = self.currentElement
            }
        }
    }
    
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        self.currentElement += string
    }
    
    public func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        
        if let closure = self.callbackClosure
        {
            closure(nil, parseError as NSError)
        }
    }

}
