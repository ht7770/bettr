//
//  ProfileView.swift
//  bettr
//
//  Created by Henry Thomas on 19/10/2022.
//

import SwiftUI

struct ProfileView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }
                Section {
                    Text("Placeholder toggle")
                }
            }
            .navigationTitle("Profile")
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
