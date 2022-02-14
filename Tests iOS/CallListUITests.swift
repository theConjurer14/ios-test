//
//  CallListUITests.swift
//  Tests iOS
//
//  Created by Marcos Sabarís on 13/2/22.
//

import XCTest


// MARK: - Please note this tests rely on API data, so some of them may fail if API data changes in the future.


class CallListUITests: XCTestCase {
    private var app: XCUIApplication!
    
    override func setUp() {
        app = XCUIApplication()
        app.launch()
    }

    /// Call 'reset' endpoint needed for tests
    func test00_setupAPI() {
        let url = URL(string: "https://aircall-job.herokuapp.com/reset")!
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in }
        task.resume()
        sleep(3)
    }
    
    /// Test app loads table with API data
    func test01_table() throws {
        let list = app.tables["callListTable"]
        XCTAssertTrue(list.exists)
        XCTAssert(list.cells.count == 6)
    }
    
    /// Enter details view for a given call and check all data
    func test02_detailsView() throws {
        let list = app.tables["callListTable"]
        
        XCTAssertTrue(list.exists)
        let tableCell = list.cells.element(boundBy: 0)
        tableCell.staticTexts["callListRowStatus"].firstMatch.tap()
        
        sleep(3)
        
        XCTAssertEqual(app.staticTexts["detailsViewDirection"].label, "outcoming")
        XCTAssertEqual(app.staticTexts["detailsViewType"].label, "missed call")
        XCTAssertEqual(app.staticTexts["detailsViewVia"].label, "NYC Office")
        XCTAssertEqual(app.staticTexts["detailsViewContact"].label, "Pierre-Baptiste Béchu")
        XCTAssertEqual(app.staticTexts["detailsViewTo"].label, "06 46 62 12 33")
        XCTAssertEqual(app.staticTexts["detailsViewDate"].label, "19/04/18 11:38")
        
    }
    
    /// Archive call from list
    func test03_archiveCall() throws {
        let list = app.tables["callListTable"]
        
        XCTAssertTrue(list.exists)
        let oldElements = list.cells.count
        let tableCell = list.cells.element(boundBy: 0)
        tableCell.images["callListArchiveButton"].tap()
        
        sleep(3)
        // If archived successfully, the list should have one less element
        XCTAssertTrue(list.cells.count == oldElements - 1)

    }

    
    /// Archive call from call details
    func test04_archiveFromDetails() throws {
        let list = app.tables["callListTable"]
        
        XCTAssertTrue(list.exists)
        let oldElements = list.cells.count
        let tableCell = list.cells.element(boundBy: 0)
        tableCell.staticTexts["callListRowStatus"].firstMatch.tap()
        
        sleep(3)
        
        app.buttons["callDetailsArchive"].tap()
        sleep(3)
        
        // If archived successfully, the list should have one less element
        XCTAssertTrue(list.cells.count == oldElements - 1)
        
    }
    
    /// Test restore data button
    func test05_restoreCalls() throws {
        let list = app.tables["callListTable"]
        
        XCTAssertTrue(list.exists)
        let restoreButton = app.buttons["callListRestoreCalls"]
        restoreButton.tap()
        
        sleep(3)
        
        XCTAssertTrue(list.cells.count == 6)
       
    }
}
