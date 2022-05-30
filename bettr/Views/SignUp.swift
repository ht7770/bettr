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
   @State var DOB = Date()
    
    var body: some View {
        ZStack{
            backgroundColour()
            
            VStack{
                
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                
                
                TextField("First Name", text: $firstName)
                    .padding()
                    .frame(width: 370, height: 50)
                    .foregroundColor(.black)
                    .background(Color.init(white: 0.85))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                TextField("Last Name", text: $lastName)
                    .padding()
                    .frame(width: 370, height: 50)
                    .foregroundColor(.black)
                    .background(Color.init(white: 0.85))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                DatePicker("Date of Birth", selection: $DOB,in: ...Date(), displayedComponents: .date)
                    .padding()
                    .foregroundColor(.black)
                    .frame(width: 370, height: 50)
                    .background(Color.init(white: 0.85))
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                Button(action: {
                    var newUser = users(firstName: firstName, lastName: lastName, DOB: DOB)
                }) {
                    Text("Submit")
                        .padding()
                        .cornerRadius(5.0)
                        .frame(width: 220, height: 60)
                        .foregroundColor(.black)
                        .background(Color.init(white: 0.85))
                }
            
                
            }
            
            
        }
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
 
