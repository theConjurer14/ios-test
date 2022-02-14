//
//  CallListTests.swift
//  callTest
//
//  Created by Marcos Sabarís on 13/2/22.
//

@testable import callTest
import XCTest

class CallListTests: XCTestCase{
    private var service: CallListServiceMock!
    private var viewModel: CallListViewModel!
    
    override func setUp() {
        service = CallListServiceMock()
        viewModel = CallListViewModel(service: service)
    }
    
    func test01_loadDataWithError() throws {
        // Given
        service.success = false
        
        // When
        viewModel.getCallList()
        
        // Then
        XCTAssert(viewModel.data.count == 0)
    }
    
    /// Test to check if viewModel is only loading  calls NOT archived
    func test02_loadData() throws {
        // Given
        service.success = true
        
        // When
        viewModel.getCallList()
        
        // Then
        XCTAssert(viewModel.data.count == 3)
    }
    
    func test03_resetCallsWithError() throws {
        // Given
        service.success = false
        
        // When
        viewModel.getCallList()
        
        // Then
        XCTAssert(viewModel.data.count == 0)
    }
    
    /// Test viewModel loads data after fetching for a reset and it is only loading  calls NOT archived
    func test04_resetCalls() throws {
        // Given
        service.success = true
        viewModel.data = []
        
        // When
        viewModel.getCallList()
        
        // Then
        XCTAssert(viewModel.data.count == 3)
    }
    
    func test05_archiveCallWithError() throws {
        // Given
        service.success = false
        
        // When
        viewModel.archiveCall(id: 0)
        
        // Then
        XCTAssert(viewModel.data.count == 0)
    }
    
    /// Test if archive is success, viewModel should go back and RELOAD data in order to dismiss archived calls
    func test06_archiveCall() throws {
        // Given
        service.success = true
        
        // When
        viewModel.archiveCall(id: 0)
        
        // Then
        XCTAssert(viewModel.data.count == 3)
    }
}


