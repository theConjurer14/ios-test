//
//  CallDetailsTests.swift
//  Tests iOS
//
//  Created by Marcos Sabarís on 14/2/22.
//

import XCTest
@testable import callTest

class CallDetailsTests: XCTestCase {
    private var service: CallDetailsServiceMock!
    private var viewModel: CallDetailsViewModel!
    
    override func setUp() {
        service = CallDetailsServiceMock()
        viewModel = CallDetailsViewModel(id: 0, service: service)
    }
    
    func test01_getCallDetailsWithError() throws {
        // Given
        service.success = false
        
        // When
        viewModel.getCallDetails(id: 0)
        
        // Then
        XCTAssert(viewModel.data.id == Call.emptyCallMock.id)
        XCTAssert(viewModel.data.createdAt == Call.emptyCallMock.createdAt)
        XCTAssert(viewModel.data.from == Call.emptyCallMock.from)
        XCTAssert(viewModel.data.direction == Call.emptyCallMock.direction)
        XCTAssert(viewModel.data.to == Call.emptyCallMock.to)
        XCTAssert(viewModel.data.via == Call.emptyCallMock.via)
        XCTAssert(viewModel.data.duration == Call.emptyCallMock.duration)
        XCTAssert(viewModel.data.callType == Call.emptyCallMock.callType)
        XCTAssert(viewModel.data.isArchived == Call.emptyCallMock.isArchived)
    }
    
    func test02_getCallDetails() throws {
        // Given
        service.success = true
        
        // When
        viewModel.getCallDetails(id: 0)
        
        // Then
        XCTAssert(viewModel.data.id == Call.callMock.id)
        XCTAssert(viewModel.data.createdAt == Call.callMock.createdAt)
        XCTAssert(viewModel.data.from == Call.callMock.from)
        XCTAssert(viewModel.data.direction == Call.callMock.direction)
        XCTAssert(viewModel.data.to == Call.callMock.to)
        XCTAssert(viewModel.data.via == Call.callMock.via)
        XCTAssert(viewModel.data.duration == Call.callMock.duration)
        XCTAssert(viewModel.data.callType == Call.callMock.callType)
        XCTAssert(viewModel.data.isArchived == Call.callMock.isArchived)
    }
}
