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
        
        Button {
            isComplete.toggle()
        } label: {
            Label("Toggle Complete", systemImage: isComplete ? "circlebadge" : "circlebadge.fill")
                .labelStyle(.iconOnly)
        }
    }
}

struct CompleteToggleButton_Previews: PreviewProvider {
    static var previews: some View {
        CompleteToggleButton(isComplete: .constant(true))
    }
}
