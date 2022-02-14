//
//  CallDetailsViewModel.swift
//  callTest
//
//  Created by Marcos Sabarís on 13/2/22.
//

import Foundation

protocol CallDetailsViewModelProtocol {
    func getCallDetails(id: Int)
    func archiveCall(id: Int, callWasArchived: (() -> Void)?)
}

class CallDetailsViewModel: CallDetailsViewModelProtocol, ObservableObject {
    
    @Published var data: Call = Call.emptyCallMock
    let service: CallDetailsServiceProtocol
    let id: Int
    
    init(id: Int, service: CallDetailsServiceProtocol = CallDetailsService()) {
        self.id = id
        self.service = service
    }
    
    func getCallDetails(id: Int) {
        service.getCallDetails(id: id) { [weak self] response in
            guard let self = self else { return }
            switch response {
            case let .success(call):
                self.data = call
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    func archiveCall(id: Int, callWasArchived: (() -> Void)?){
        let callWasArchived = callWasArchived

        service.archiveCall(id: id) { response in
            switch response {
            case let .success(call):
                if call.isArchived {
                    callWasArchived?()
                }
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
