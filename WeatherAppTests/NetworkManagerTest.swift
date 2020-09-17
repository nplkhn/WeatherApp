//
//  NetworkManagerTest.swift
//  WeatherAppTests
//
//  Created by Никита Плахин on 9/17/20.
//  Copyright © 2020 Никита Плахин. All rights reserved.
//

@testable import WeatherApp
import XCTest

class NetworkManagerTest: XCTestCase {
    
    var networkManager: NetworkManager!
    
    override func setUp() {
        super.setUp()
        networkManager = NetworkManager()
    }
    
    override func tearDown() {
        networkManager = nil
        super.tearDown()
    }
    
    func testCoordinatesValidation1() {
        XCTAssertNoThrow(try networkManager.validateCoordinates(coordinates: fakeCoordinatesMinsk))
    }
    
    func testCoordinatesValidation2() {
        XCTAssertNoThrow(try networkManager.validateCoordinates(coordinates: fakeCoordinatesBerlin))
    }

    
    func testCoordinatesValidation3() {
        let expectedError = CoordinateError.invalidCoordinates
        var error: CoordinateError?
        
        XCTAssertThrowsError(try networkManager.validateCoordinates(coordinates: fakeCoordinatesUnknown1)) { thrownError in
            error = thrownError as? CoordinateError
        }
        
        XCTAssertEqual(error, expectedError)
    }

    func testCoordinatesValidation4() {
        let expectedError = CoordinateError.invalidCoordinates
        var error: CoordinateError?
        
        XCTAssertThrowsError(try networkManager.validateCoordinates(coordinates: fakeCoordinatesUnknown2)) { thrownError in
            error = thrownError as? CoordinateError
        }
        
        XCTAssertEqual(error, expectedError)
    }

    func testCoordinatesValidation5() {
        let expectedError = CoordinateError.invalidCoordinates
        var error: CoordinateError?
        
        XCTAssertThrowsError(try networkManager.validateCoordinates(coordinates: fakeCoordinatesUnknown3)) { thrownError in
            error = thrownError as? CoordinateError
        }
        
        XCTAssertEqual(error, expectedError)
    }

    
    // Happy pass
    let fakeCoordinatesMinsk = Coordinates(latitude: 53.904541, longitude: 27.561523)
    let fakeCoordinatesBerlin = Coordinates(latitude: 52.520008, longitude: 13.404954)
    
    // Unhappy pass
    let fakeCoordinatesUnknown1 = Coordinates(latitude: -53.904541, longitude: 27.561523)
    let fakeCoordinatesUnknown2 = Coordinates(latitude: 90.000001, longitude: 27.561523)
    let fakeCoordinatesUnknown3 = Coordinates(latitude: 53.904541, longitude: 180.000001)
    
    
}
