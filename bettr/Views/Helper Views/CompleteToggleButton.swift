//
//  CompleteToggleButton.swift
//  bettr
//
//  Created by Henry Thomas on 27/09/2022.
//

import SwiftUI

struct CompleteToggleButton: View {
    
    @Binding var isComplete: Bool
    
    
    var body: some View {
        
        Button(action: {}){
        label: do {
                switch isComplete{
                case true:
                    Image(systemName: "circlebadge.fill")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
                default:
                    Image(systemName: "circlebadge")
                        .resizable()
                        .frame(width: 20, height: 20)
                }
        }
        
                
        }
        .onTapGesture {
            isComplete.toggle()
        }
    }
}

struct CompleteToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        CompleteToggleButton(isComplete: .constant(true))
    }
}
