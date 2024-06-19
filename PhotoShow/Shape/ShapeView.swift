//
//  ShapeView.swift
//  PhotoShow
//
//  Created by Nathanael Mukyanga on 2023-12-05.
//

import SwiftUI

struct ShapeView:View  {

    @EnvironmentObject public var object:ViewModel
    @State private var selectedButtonIndex: String = ""
    var body: some View {
        VStack{
        //    Adjust()
            Spacer()
            
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(self.object.shapes,id: \.self){ index in
                        
                      
                        Button(
                            action: {
                                // To upDate Tapped Button color
                                self.buttonTapped(index)
                                // To Replace Shape
                                self.object.model.shape = index
                                
                                
                                
                            },
                            label: {
                                // Icons
                                Image(systemName:index)
                                    .font(.system(size: 40))
                                    .foregroundStyle(selectedButtonIndex == index ? .blue:.gray)
                            }
                        )
                        
                    }
                }
                
            }
           
            .padding()
            
        }
    }
    
    // To Change color of every Clicked Button
    private func buttonTapped(_ index: String) {
        selectedButtonIndex = index
    }
}






struct IpadShapeView:View  {

    @EnvironmentObject public var object:ViewModel
    @State private var selectedButtonIndex: String = ""
    var body: some View {
        VStack{
       
            Spacer()
            
           
                HStack{
                    ForEach(self.object.shapes,id: \.self){ index in
                        
                      
                        Button(
                            action: {
                                // To upDate Tapped Button color
                                self.buttonTapped(index)
                                // To Replace Shape
                                self.object.model.shape = index
                                
                                
                                
                            },
                            label: {
                                // Icons
                                Image(systemName:index)
                                    .font(.system(size: 40))
                                    .foregroundStyle(selectedButtonIndex == index ? .blue:.gray)
                            }
                        )
                        
                    }
                }
                
            
           
            .padding()
            
        }
    }
    
    // To Change color of every Clicked Button
    private func buttonTapped(_ index: String) {
        selectedButtonIndex = index
    }
}

