//
//  RSSItem_Tests.swift
//  SwiftRSS_Example
//
//  Created by Thibaut LE LEVIER on 13/10/2014.
//  Copyright (c) 2014 Thibaut LE LEVIER. All rights reserved.
//

import UIKit
import XCTest
@testable import SwiftRSS

class RSSItem_Tests: XCTestCase {
    
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
        
        let archive = documentsPath + "test.archive"
        
        NSKeyedArchiver.archiveRootObject(item, toFile: archive)
        
        let item2 = NSKeyedUnarchiver.unarchiveObject(withFile: archive) as! RSSItem
        
        XCTAssertEqual(item.title, item2.title)
        XCTAssertEqual(item.link, item2.link)
        XCTAssertEqual(item.guid, item2.guid)
        XCTAssertEqual(item.pubDate, item2.pubDate)
        XCTAssertEqual(item.itemDescription, item2.itemDescription)
        XCTAssertEqual(item.content, item2.content)
        XCTAssertEqual(item.commentsLink!.absoluteString, item2.commentsLink!.absoluteString)
        XCTAssertEqual(item.commentRSSLink!.absoluteString, item2.commentRSSLink!.absoluteString)
        XCTAssertEqual(item.commentsCount, item2.commentsCount)
        XCTAssertEqual(item.author, item2.author)
        XCTAssertEqual(item.categories[0], item2.categories[0])
        XCTAssertEqual(item.categories[1], item2.categories[1])
        XCTAssertEqual(item.categories[2], item2.categories[2])
    }

}
