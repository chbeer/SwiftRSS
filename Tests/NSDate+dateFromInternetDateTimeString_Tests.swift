//
//  NSDateExtension_Tests.swift
//  SwiftRSS_Example
//
//  Created by Thibaut LE LEVIER on 01/10/2014.
//  Copyright (c) 2014 Thibaut LE LEVIER. All rights reserved.
//

import UIKit
import XCTest
@testable import SwiftRSS

class NSDateExtension_Tests: XCTestCase {
    
    let GMT_timeZone: TimeZone! = TimeZone(secondsFromGMT: 0)
    var calendar: Calendar! = Calendar(identifier: Calendar.Identifier.gregorian)
    let calendar_flags: Set<Calendar.Component> = [.weekday, .day, .month, .year, .hour, .minute, .second, .timeZone]

    override func setUp() {
        super.setUp()
        calendar.timeZone = GMT_timeZone
    }
    
    override func tearDown() {
        super.tearDown()
    }

// MARK: RFC822
    
    func test_dateFormatter_withDateStringRFC822Format1_shouldReturnValidDate() {
        
        let dateString = "Sun, 19 May 2002 15:21:36 GMT"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendar_flags, from: date)
            
            XCTAssertEqual(dateComponent.weekday, 1)
            XCTAssertEqual(dateComponent.day, 19)
            XCTAssertEqual(dateComponent.month, 5)
            XCTAssertEqual(dateComponent.year, 2002)
            XCTAssertEqual(dateComponent.hour, 15)
            XCTAssertEqual(dateComponent.minute, 21)
            XCTAssertEqual(dateComponent.second, 36)
            XCTAssertEqual(dateComponent.timeZone!, GMT_timeZone)
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC822Format2_shouldReturnValidDate() {
        
        let dateString = "Sun, 19 May 2002 15:21 GMT"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendar_flags, from: date)
            
            XCTAssertEqual(dateComponent.weekday, 1)
            XCTAssertEqual(dateComponent.day, 19)
            XCTAssertEqual(dateComponent.month, 5)
            XCTAssertEqual(dateComponent.year, 2002)
            XCTAssertEqual(dateComponent.hour, 15)
            XCTAssertEqual(dateComponent.minute, 21)
            XCTAssertEqual(dateComponent.second, 0)
            XCTAssertEqual(dateComponent.timeZone!, GMT_timeZone)
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC822Format3_shouldReturnValidDate() {
        
        let dateString = "Sun, 19 May 2002 15:21:36"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendar_flags, from: date)
            
            XCTAssertEqual(dateComponent.weekday, 1)
            XCTAssertEqual(dateComponent.day, 19)
            XCTAssertEqual(dateComponent.month, 5)
            XCTAssertEqual(dateComponent.year, 2002)
            XCTAssertEqual(dateComponent.hour, 15)
            XCTAssertEqual(dateComponent.minute, 21)
            XCTAssertEqual(dateComponent.second, 36)
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC822Format4_shouldReturnValidDate() {
        
        let dateString = "Sun, 19 May 2002 15:21"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendar_flags, from: date)
            
            XCTAssertEqual(dateComponent.weekday, 1)
            XCTAssertEqual(dateComponent.day, 19)
            XCTAssertEqual(dateComponent.month, 5)
            XCTAssertEqual(dateComponent.year, 2002)
            XCTAssertEqual(dateComponent.hour, 15)
            XCTAssertEqual(dateComponent.minute, 21)
            XCTAssertEqual(dateComponent.second, 0)
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC822Format5_shouldReturnValidDate() {
        
        let dateString = "19 May 2002 15:21:36 GMT"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendar_flags, from: date)
            
            XCTAssertEqual(dateComponent.day, 19)
            XCTAssertEqual(dateComponent.month, 5)
            XCTAssertEqual(dateComponent.year, 2002)
            XCTAssertEqual(dateComponent.hour, 15)
            XCTAssertEqual(dateComponent.minute, 21)
            XCTAssertEqual(dateComponent.second, 36)
            XCTAssertEqual(dateComponent.timeZone!, GMT_timeZone)
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC822Format6_shouldReturnValidDate() {
        
        let dateString = "19 May 2002 15:21 GMT"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendar_flags, from: date)
            
            XCTAssertEqual(dateComponent.day, 19)
            XCTAssertEqual(dateComponent.month, 5)
            XCTAssertEqual(dateComponent.year, 2002)
            XCTAssertEqual(dateComponent.hour, 15)
            XCTAssertEqual(dateComponent.minute, 21)
            XCTAssertEqual(dateComponent.second, 0)
            XCTAssertEqual(dateComponent.timeZone!, GMT_timeZone)
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC822Format7_shouldReturnValidDate() {
        
        let dateString = "19 May 2002 15:21:36"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendar_flags, from: date)
            
            XCTAssertEqual(dateComponent.day, 19)
            XCTAssertEqual(dateComponent.month, 5)
            XCTAssertEqual(dateComponent.year, 2002)
            XCTAssertEqual(dateComponent.hour, 15)
            XCTAssertEqual(dateComponent.minute, 21)
            XCTAssertEqual(dateComponent.second, 36)
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC822Format8_shouldReturnValidDate() {
        
        let dateString = "19 May 2002 15:21"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendar_flags, from: date)
            
            XCTAssertEqual(dateComponent.day, 19)
            XCTAssertEqual(dateComponent.month, 5)
            XCTAssertEqual(dateComponent.year, 2002)
            XCTAssertEqual(dateComponent.hour, 15)
            XCTAssertEqual(dateComponent.minute, 21)
            XCTAssertEqual(dateComponent.second, 0)
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
// MARK: RFC3339
    
    func test_dateFormatter_withDateStringRFC3339Format1_shouldReturnValidDate() {
        
        let dateString = "1996-12-19T16:39:57-0800"
        let timeZone = TimeZone(secondsFromGMT: -60*60*8)
        calendar.timeZone = timeZone!
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendar_flags, from: date)
            
            XCTAssertEqual(dateComponent.day, 19)
            XCTAssertEqual(dateComponent.month, 12)
            XCTAssertEqual(dateComponent.year, 1996)
            XCTAssertEqual(dateComponent.hour, 16)
            XCTAssertEqual(dateComponent.minute, 39)
            XCTAssertEqual(dateComponent.second, 57)
            XCTAssertEqual(dateComponent.timeZone!, timeZone)
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC3339Format2_shouldReturnValidDate() {
        
        let dateString = "1937-01-01T12:00:27.87+0020"
        let timeZone = TimeZone(secondsFromGMT: 60*60*2)
        calendar.timeZone = timeZone!
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            
            var dateComponent = calendar.dateComponents(calendar_flags, from: date)
            
            XCTAssertEqual(dateComponent.day, 1)
            XCTAssertEqual(dateComponent.month, 1)
            XCTAssertEqual(dateComponent.year, 1937)
//            XCTAssertEqual(dateComponent.hour, 12)
//            XCTAssertEqual(dateComponent.minute, 0)
            XCTAssertEqual(dateComponent.second, 27)
            XCTAssertEqual(dateComponent.timeZone!, timeZone)
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    
    func test_dateFormatter_withDateStringRFC3339Format3_shouldReturnValidDate() {
        
        let dateString = "1937-01-01T12:00:27"
        
        if let date: Date = Date.dateFromInternetDateTimeString(dateString)
        {
            var dateComponent = calendar.dateComponents(calendar_flags, from: date)
            
            XCTAssertEqual(dateComponent.day, 1)
            XCTAssertEqual(dateComponent.month, 1)
            XCTAssertEqual(dateComponent.year, 1937)
            XCTAssertEqual(dateComponent.hour, 12)
            XCTAssertEqual(dateComponent.minute, 0)
            XCTAssertEqual(dateComponent.second, 27)
        }
        else
        {
            XCTFail("date is nil")
        }
    }
    


}
