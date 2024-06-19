//
//  AngleView.swift
//  PhotoShow
//
//  Created by Nathanael Mukyanga on 2023-12-05.
//

import SwiftUI

struct AngleView: View {
    @EnvironmentObject var object:ViewModel
    @State private var selectedButtonIndex: String?
    @State private var state = ""
   
    var body: some View {
      
        VStack(spacing: 0) {
            
            HStack(spacing:15) {
                ForEach(Angles.all, id: \.self) { index in
                    VStack(spacing:0) {
                        Button(
                            action: {
                                self.buttonTapped(index.icons)
                                self.state = index.icons
                            },
                            label: {
                                Image(systemName: index.icons)
                                    .foregroundStyle(selectedButtonIndex == index.icons ? .blue : .gray)
                            }
                        )
                        Text(index.labels)
                            .foregroundStyle(.white)
                            .padding()
                    }
                }
            }
           
            if state != ""  {
                Slider(value: binding(for: state), in: 0...10)
                    .frame(width: 350)
                
            }
        }
   // }
        
        
        
        
      
    }

    private func buttonTapped(_ index: String) {
        selectedButtonIndex = index
    }

    private func binding(for buttonIndex: String) -> Binding<Double> {
        switch buttonIndex {
        case "triangle.righthalf.fill":
            return $object.model.x
        case "arrowtriangle.left.fill":
            return $object.model.y
        case "circle.slash.fill":
            return $object.model.z
        default:
            return .constant(0)
        }
    }
}

struct AngleView_Previews: PreviewProvider {
    static var previews: some View {
       AngleView()
            .environmentObject(ViewModel())
    }
}




