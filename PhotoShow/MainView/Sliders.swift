//
//  Sliders.swift
//  PhotoShow
//
//  Created by Nathanael Mukyanga on 2023-12-12.
//

import SwiftUI



extension MainView{
    var sliders:some View {
        VStack{
            switch  object.model.adjusts {
            case .hue: Slider(value:$object.model.hue,in: -360...360)
            case .sat:Slider(value:$object.model.sat,in: 0.0...2.0)
            case .bri:Slider(value:$object.model.bri,in: -0.1...1)
            case .gra: Slider(value:$object.model.gra,in: -0.1...1.0)
            case .opa:Slider(value:$object.model.opa,in: 0.1...1)
            case .sha:Slider(value:$object.model.sha,in: 00...100.0)
            case .con: Slider(value:$object.model.con,in: 0.0...1.0)
            case .blu: Slider(value:$object.model.blu,in: 0.0...30.0)
            case .none:Text("None")
            
            }
        }
        .padding(.trailing)
    }
    public func buttonTapped(_ index: String) {
        self.object.model.selectedButtonIndex = index
    }
    func share(){
        let photo =  ImageRenderer(content:
                                    ZStack{
          
                
                                    shareImages
            .mask{
                if object.model.shape == "circle.slash.fill" {
                   Rectangle()
                    
                } else {
                    Image(systemName:object.model.shape)
                        .font(.system(size: 355))
                    
                }
                
            }
                                   }
        )
        
        if let uiImage = photo.uiImage {
          
            self.shareImage = Image(uiImage: uiImage)
          
            self.object.model.saveImage = uiImage
         
            
        }
    }
  
    
}


