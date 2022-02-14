//
//  CallDetailsView.swift
//  callTest
//
//  Created by Marcos Sabarís on 13/2/22.
//

import SwiftUI

struct CallDetailsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: CallDetailsViewModel
    private let reloadList: (() -> Void)?
    
    init(call: Call, reloadList: (() -> Void)?) {
        //Create a viewModel according to the call selected
        self.viewModel = CallDetailsViewModel(id: call.id)
        self.reloadList = reloadList
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            callDetailsTitle(call: viewModel.data)
            Divider()
            Spacer()
            Divider()
            CallDetailsContact(call: viewModel.data)
            Divider()
            CallDetailsDate(call: viewModel.data)
        
        }.navigationTitle("Call details")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Archive") {
                        viewModel.archiveCall(id: viewModel.data.id) {
                            self.presentationMode.wrappedValue.dismiss()
                            reloadList?()
                        }
                    }.tint(Color.white)
                        .accessibilityIdentifier("callDetailsArchive")
                }
            }
        .padding()
        .onAppear {
            // Fetch call details
            viewModel.getCallDetails(id: viewModel.id)
        }
    }
}

private func callDetailsTitle(call: Call) -> some View {
    return VStack{
        HStack{
            CallStatus(data: CallStatusData(call: call))
            Text(call.direction == .outbound ? call.to! : call.from)
                .font(.title)
                .accessibilityIdentifier("detailsViewTo")
        }
        HStack{
            Text(call.direction == .outbound ? "outcoming" : "incoming")
                .accessibilityIdentifier("detailsViewDirection")
            switch call.callType {
            case .missed:
                Text("missed call")
                    .bold()
                    .accessibilityIdentifier("detailsViewType")
            case .answered:
                Text("answered call")
                    .bold()
                    .accessibilityIdentifier("detailsViewType")
            case .voicemail:
                Text("voicemail")
                    .bold()
                    .accessibilityIdentifier("detailsViewType")
            }
        }
        HStack{
            Text(call.direction == .outbound ? "made by" : "by")
            Text(call.via)
                .accessibilityIdentifier("detailsViewVia")
        }
    }
    .frame(maxWidth: .infinity)
}

private func CallDetailsStatus(call: Call) -> some View {
    return VStack {
        Divider()
        HStack{
            CallStatus(data: CallStatusData(call: call))
            HStack{
            Text(call.direction == .outbound ? "made by" : "by")
                Text(call.via)
            }
        }
    }
}

private func CallDetailsContact(call: Call) -> some View {
    return VStack (alignment: .leading){
        Text("Contact details")
            .bold()
        Text(call.direction == .outbound ? call.from : call.to ?? "Unknown")
            .accessibilityIdentifier("detailsViewContact")
    }
}

private func CallDetailsDate(call: Call) -> some View {
    return VStack(alignment: .leading) {
        Text("Date").bold()
        HStack{
            Text(call.createdAt.toString(style: .detailsView))
                .accessibilityIdentifier("detailsViewDate")

            Text("(duration: \(call.duration) seconds)")
        }
    }
}

struct CallDetailsView_Previews: PreviewProvider {
    static var previews: some View {

        CallDetailsView(call: Call.callMock, reloadList: {})
    }
}
