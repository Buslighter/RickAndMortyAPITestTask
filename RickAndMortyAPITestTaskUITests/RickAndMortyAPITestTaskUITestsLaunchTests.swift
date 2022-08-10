//
//  RickAndMortyAPITestTaskUITestsLaunchTests.swift
//  RickAndMortyAPITestTaskUITests
//
//  Created by gleba on 02.08.2022.
//

import XCTest

class RickAndMortyAPITestTaskUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        
        let tablesQuery = XCUIApplication().tables
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Эпизоды"]/*[[".cells.staticTexts[\"Эпизоды\"]",".staticTexts[\"Эпизоды\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery.children(matching: .cell).element(boundBy: 2).swipeUp()
        
        app.navigationBars["Эпизоды"].buttons["Back"].tap()
        
        app.navigationBars["Локации"].buttons["Back"].tap()
        tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Персонажи"]/*[[".cells.staticTexts[\"Персонажи\"]",".staticTexts[\"Персонажи\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let searchField = app.navigationBars["Персонажи"].searchFields["Поиск"]
        searchField.tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).tap()
        searchField.tap()
        
        
        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
