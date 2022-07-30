//
//  SignUp.swift
//  bettr
//
//  Created by Henry Thomas on 03/01/2022.
//

import SwiftUI



struct SignUp: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var Authentication: Bool = true
    
    @Binding var loggedIn: Bool
    
    
    var body: some View {
        
        ZStack{
            backgroundColour()
            
            VStack{
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                
                    
                firstNameTextField(firstName: $firstName)
                lastNameTextField(lastName: $lastName)
                submitButton(loggedIn: $loggedIn)
        
            
                
            }
            
            
        }
    }
    
}

struct firstNameTextField: View {
    @Binding var firstName: String
    var body: some View {
        TextField("First Name", text: $firstName)
            .padding()
            .frame(width: 370, height: 50)
            .foregroundColor(.black)
            .background(Color.init(white: 0.85))
            .cornerRadius(5.0)
            .padding(.bottom, 20)
        
    }
}

struct lastNameTextField: View {
    @Binding var lastName: String
    var body: some View {
        TextField("Last Name", text: $lastName)
            .padding()
            .frame(width: 370, height: 50)
            .foregroundColor(.black)
            .background(Color.init(white: 0.85))
            .cornerRadius(5.0)
            .padding(.bottom, 20)
    }
}



struct submitButton: View {
    @Binding var loggedIn: Bool
    var body: some View {
        Button(action: {print("Submit button pressed!")
            loggedIn = true
            
        
            
            
        }) {
            Text("Sign-Up")
                .padding()
                .frame(width: 220, height: 60)
                .foregroundColor(.black)
                .background(Color.init(white: 0.85))
                .cornerRadius(5.0)
        }
    }
}
