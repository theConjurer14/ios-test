//
//  callTestApp.swift
//  Shared
//
//  Created by Marcos Sabarís on 12/2/22.
//

import SwiftUI

@main
struct callTestApp: App {
    
    init() {
        ///Nav bar settings
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.backgroundColor = UIColor(Color.green)
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]

        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().tintColor = .white
    }
    
    var body: some Scene {
        WindowGroup {
            CallListView(viewModel: CallListViewModel())
        }
    }
}
