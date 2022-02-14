//
//  CallListViewModel.swift
//  callTest
//
//  Created by Marcos Sabarís on 12/2/22.
//

import Foundation

protocol CallListViewModelProtocol {
    func getCallList()
    func resetCalls()
    func archiveCall(id: Int)
}

class CallListViewModel: CallListViewModelProtocol, ObservableObject {
    @Published var data = [Call]()
    let service: CallListServiceProtocol
    
    init(service: CallListServiceProtocol = CallListService()){
        self.service = service
    }
    
    
    
    func getCallList() {
        service.getCallList { [weak self] response in
            guard let self = self else { return }
            switch response {
            case let .success(calls):
                self.data = calls.filter( { !$0.isArchived})
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    func resetCalls(){
        service.resetCallList { [weak self] response in
            guard let self = self else{ return }
            switch response {
            case .success(_):
                self.getCallList()
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
    
    func archiveCall(id: Int) {
        service.archiveCall(id: id) { [weak self] response in
            guard let self = self else{ return }
            switch response {
            case .success(_):
                self.getCallList()
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
