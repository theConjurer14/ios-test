//
//  CallStatus.swift
//  callTest
//
//  Created by Marcos Sabarís on 12/2/22.
//

import SwiftUI

struct CallStatusData {
    let iconName: String
    let color: Color
    
    init(call: Call) {
        switch call.direction {
        case .inbound:
            iconName = "arrow.down.left"
        case .outbound:
            iconName = "arrow.up.right"
        }
        
        switch call.callType {
        case .answered:
            color = .green
        case .missed:
            color = .red
        case .voicemail:
            color = .orange
        }
    }
}


struct CallStatus: View {
    var data: CallStatusData
    
    var body: some View {
        Image(systemName: data.iconName)
            .foregroundColor(data.color)
    }
}

struct CallStatus_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(Call.callListMock){ call in
            let data = CallStatusData(call: call)
            CallStatus(data: data).previewLayout(.sizeThatFits)
        }       
    }
}
