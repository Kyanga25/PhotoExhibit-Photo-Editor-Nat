//
//  ViewModel.swift
//  PhotoShow
//
//  Created by Nathanael Mukyanga on 2023-12-05.
//
import Foundation
import SwiftUI
import PhotosUI

class ViewModel:ObservableObject {
    
    @Published var model = Model(adjust:AdMl(), filter: CLModel(), angle:
                                    Angles(), adjusts:.hue)
    
    let shapes:[String] = ["circle.slash.fill",
        "squareshape.fill","circle.fill","square.fill",
        "square.fill.on.square.fill","suit.heart.fill",
        "triangle.fill","star.fill","pentagon.fill","fanblades.fill"
    ]
    func selectPhoto(selectedItem: PhotosPickerItem?) async {
        guard let selectedItem = selectedItem else { return }
        
        do {
            let data = try await selectedItem.loadTransferable(type: Data.self)
            DispatchQueue.main.async {
                self.model.sel = data
            }
        } catch {
            print("Error loading selected photo: \(error)")
        }
    }
    
    func dragGestures()-> some Gesture {
          DragGesture()
            .onChanged{ [self] value in
                if model.crop == true {
                    self.model.dragGesture = value.translation
                }
                
                
            }
            
    }
    
    func magnificationGestures()-> some Gesture {
        MagnificationGesture()
            .onChanged { [self] value in
                if model.crop == true {
                    self.model.scale = value.magnitude
                }
            }
            
    }
    func filters() {
        switch model.filter.filters {
        case "Original":
            model.filter.blue = 1.0
            model.filter.red = 1.0
            model.filter.green = 1.0
            
        case "Vintage":
            model.filter.blue = 0.2
            model.filter.red = 0.3
            model.filter.green = 0.2
            
        case "Sepia":
            model.filter.blue = 0.18
            model.filter.red = 0.48
            model.filter.green = 0.3
            
            
        case "Vivid":
            model.filter.blue = 1.2
            model.filter.red = 1.2
            model.filter.green = 1.2
       
        case "Cool":
            model.filter.blue = 0.8
            model.filter.red = 0.3
            model.filter.green = 0.6
            
        case "Warm":
            model.filter.blue = 0.3
            model.filter.red = 1.1
            model.filter.green = 0.6
            
        case "Lomo":
            model.filter.blue = 0.4
            model.filter.red = 1.0
            model.filter.green = 0.7
            
        case "Retro":
            model.filter.blue = 0.3
            model.filter.red = 0.5
            model.filter.green = 0.4
            
        case "Cinematic":
            model.filter.blue = 0.3
            model.filter.red = 0.4
            model.filter.green = 0.3
            
        case "Classic":
            model.filter.blue = 0.5
            model.filter.red = 0.6
            model.filter.green = 0.55
            
        case "Dramatic":
            model.filter.blue = 0.4
            model.filter.red = 0.4
            model.filter.green = 0.4
            
        case "Sunset":
            model.filter.blue = 0.3
            model.filter.red = 1.1
            model.filter.green = 0.5
            
        case "Pastel":
            model.filter.blue = 0.7
            model.filter.red = 0.9
            model.filter.green = 0.8
            
        case "High Contrast":
            model.filter.blue = 1.3
            model.filter.red = 1.3
            model.filter.green = 1.3
            
        case "Matte":
            model.filter.blue = 0.5
            model.filter.red = 0.7
            model.filter.green = 0.6
            
        case "Pop Art":
            model.filter.blue = 0.2
            model.filter.red = 0.9
            model.filter.green = 0.2
            
        case "Grunge":
            model.filter.blue = 0.4
            model.filter.red = 0.4
            model.filter.green = 0.4
            
        case "Urban":
            model.filter.blue = 0.5
            model.filter.red = 0.5
            model.filter.green = 0.5
            
        case "Nature":
            model.filter.blue = 0.4
            model.filter.red = 0.6
            model.filter.green = 0.8
            
        default:
            break
        }
    }

    
    
    
    
    
    func adjust(){
        switch model.adjust.sfsymbols {
        case"circle.fill":self.model.adjusts = .hue
        case"circle.inset.filled":self.model.adjusts = .sat
        case"sun.max.fill":self.model.adjusts = .bri
        case "rectangle.fill":self.model.adjusts = .gra
        case"slider.horizontal.3":self.model.adjusts = .opa
        case"shadow":self.model.adjusts = .sha
        case "dial.max.fill":self.model.adjusts = .con
        case"slider.horizontal.below.rectangle":self.model.adjusts = .blu
        case "circle.slash.fill":self.model.adjusts = .none
        default:self.model.adjusts = .none
         
            
        }
        
        if model.adjusts == .none {
            self.model.hue = 0.0
            self.model.sat = 1.0
            self.model.bri = 0.0
            self.model.gra = 0.0
            self.model.opa = 1.0
            self.model.sha = 0.0
            self.model.con = 1.0
            self.model.blu = 0.0
  
        }
   
    }
    @MainActor
    func save () async throws {
        
        if model.sel != nil {
            guard let save = model.saveImage else {return}
            
            UIImageWriteToSavedPhotosAlbum(save, nil, nil, nil)
       
            withAnimation {
                self.model.save.toggle()   
            }
            try await Task.sleep(nanoseconds: 1_000_000_000)
            self.model.save.toggle()
        
    }
    }
    
     
}


