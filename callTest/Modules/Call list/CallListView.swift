//
//  callListView.swift
//  callTest
//
//  Created by Marcos Sabarís on 12/2/22.
//

import SwiftUI

struct CallListView: View {
    @ObservedObject var viewModel: CallListViewModel

    init(viewModel: CallListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView{
            VStack{
                List(viewModel.data){ call in
                    NavigationLink(destination: CallDetailsView(call: call, reloadList: {
                        viewModel.getCallList()
                    })) {
                        CallRow(viewModel: viewModel, call: call)
                    }
                }.accessibilityIdentifier("callListTable")
            }.navigationTitle("History")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button("Restore calls") {
                            viewModel.resetCalls()
                            }
                        .accessibilityIdentifier("callListRestoreCalls")
                        }
                }.tint(Color.white)
                
        }
        .onAppear {
            // Fetch calls
            viewModel.getCallList()
        }
    }
}

struct CallRow: View {
    let viewModel: CallListViewModel
    let call: Call
    
    var body: some View {
        HStack(alignment: .center) {
            CallStatus(data: CallStatusData(call: call))
                
            VStack (alignment: .leading) {
                Text(call.direction == .outbound ? call.to ?? "" : call.from).bold()
                    .accessibilityIdentifier("callListRowStatus")
                Text(call.direction == .outbound ? call.from : call.to ?? "Unknown")
            }
            Spacer()
            Image(systemName: "archivebox.fill").onTapGesture {
                viewModel.archiveCall(id: call.id)
            }
            .accessibilityIdentifier("callListArchiveButton")

            VStack{
                Text(call.createdAt.toString(style: .listView))
            }
            
        }
    }
}

struct callListView_Previews: PreviewProvider {
    static var previews: some View {
        
        CallListView(viewModel:
                        CallListViewModel()
        )
    }
}
