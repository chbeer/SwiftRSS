//
//  RSSFeed_Tests.swift
//  SwiftRSS_Example
//
//  Created by Thibaut LE LEVIER on 16/10/2014.
//  Copyright (c) 2014 Thibaut LE LEVIER. All rights reserved.
//

import UIKit
import XCTest
@testable import SwiftRSS

class RSSFeed_Tests: XCTestCase {
    
    let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_setLink_withAValidURLString_shouldCreateAValidURL()
    {
        let item: RSSItem = RSSItem()
        item.setLink(string: "http://www.apple.com")
        
        if let _ = item.link
        {
            XCTAssert(true, "link is valid")
        }
        else
        {
            XCTFail("link should be valid")
        }
        
    }
    
    func test_archivingAndUnarchiving_withValidObject_shouldReturnValidObjectWithSameValues()
    {
        let feed: RSSFeed = RSSFeed()
        
        feed.title = "Feed title"
        feed.setLink(string: "http://www.swift.io")
        feed.feedDescription = "Description of the feed"
        feed.language = "fr"
        feed.lastBuildDate = Date()
        feed.generator = "My Generator"
        feed.copyright = "Copyright Acme corp"
        
        let item: RSSItem = RSSItem()
        
        item.title = "Hello"
        item.setLink(string: "http://www.apple.com")
        item.guid = "1234"
        item.pubDate = Date()
        item.itemDescription = "Big Description"
        item.content = "Here is the content"
        item.setCommentsLink(string: "http://www.test.com")
        item.setCommentRSSLink(string: "http://www.whatever.com/")
        item.commentsCount = 666
        item.author = "John Doe"
        item.categories = ["One","Two","Tree"]
        
        feed.items.append(item)
        
        let item2: RSSItem = RSSItem()
        
        item2.title = "Hello2"
        item2.setLink(string: "http://www.google.com")
        item2.guid = "5678"
        item2.pubDate = Date()
        item2.itemDescription = "Big Description Again"
        item2.content = "Here is the content for the second item"
        item2.setCommentsLink(string: "http://www.testing.com")
        item2.setCommentRSSLink(string: "http://www.whateveragain.com/")
        item2.commentsCount = 42
        item2.author = "Jane Doe"
        item2.categories = ["Four","Five","Six"]
        
        feed.items.append(item2)
        
        let archive = documentsPath + "test.archive"
        
        NSKeyedArchiver.archiveRootObject(feed, toFile: archive)
        
        let feed2 = NSKeyedUnarchiver.unarchiveObject(withFile: archive) as! RSSFeed

        XCTAssertEqual(feed.title, feed2.title)
        XCTAssertEqual(feed.link, feed2.link)
        XCTAssertEqual(feed.feedDescription, feed2.feedDescription)
        XCTAssertEqual(feed.language, feed2.language)
        XCTAssertEqual(feed.lastBuildDate, feed2.lastBuildDate)
        XCTAssertEqual(feed.generator, feed2.generator)
        XCTAssertEqual(feed.copyright, feed2.copyright)
        XCTAssertEqual(feed.items.count, feed2.items.count)
        
        let itemcopy = feed2.items[0]
        
        XCTAssertEqual(item.title, itemcopy.title)
        XCTAssertEqual(item.link, itemcopy.link)
        XCTAssertEqual(item.guid, itemcopy.guid)
        XCTAssertEqual(item.pubDate, itemcopy.pubDate)
        XCTAssertEqual(item.itemDescription, itemcopy.itemDescription)
        XCTAssertEqual(item.content, itemcopy.content)
        XCTAssertEqual(item.commentsLink!.absoluteString, itemcopy.commentsLink!.absoluteString)
        XCTAssertEqual(item.commentRSSLink!.absoluteString, itemcopy.commentRSSLink!.absoluteString)
        XCTAssertEqual(item.commentsCount, itemcopy.commentsCount)
        XCTAssertEqual(item.author, itemcopy.author)
        XCTAssertEqual(item.categories[0], itemcopy.categories[0])
        XCTAssertEqual(item.categories[1], itemcopy.categories[1])
        XCTAssertEqual(item.categories[2], itemcopy.categories[2])
        
        let item2copy = feed2.items[1]
        
        XCTAssertEqual(item2.title, item2copy.title)
        XCTAssertEqual(item2.link, item2copy.link)
        XCTAssertEqual(item2.guid, item2copy.guid)
        XCTAssertEqual(item2.pubDate, item2copy.pubDate)
        XCTAssertEqual(item2.itemDescription, item2copy.itemDescription)
        XCTAssertEqual(item2.content, item2copy.content)
        XCTAssertEqual(item2.commentsLink!.absoluteString, item2copy.commentsLink!.absoluteString)
        XCTAssertEqual(item2.commentRSSLink!.absoluteString, item2copy.commentRSSLink!.absoluteString)
        XCTAssertEqual(item2.commentsCount, item2copy.commentsCount)
        XCTAssertEqual(item2.author, item2copy.author)
        XCTAssertEqual(item2.categories[0], item2copy.categories[0])
        XCTAssertEqual(item2.categories[1], item2copy.categories[1])
        XCTAssertEqual(item2.categories[2], item2copy.categories[2])
    }
}
