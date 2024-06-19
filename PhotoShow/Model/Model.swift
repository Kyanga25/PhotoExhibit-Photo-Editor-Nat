//
//  Model.swift
//  PhotoShow
//
//  Created by Nathanael Mukyanga on 2023-12-05.
//
import Foundation
import SwiftUI 
struct AdMl:Codable,Hashable {
    var sfsymbols:String = ""
    var labels:String = ""
    static var adlabels: [AdMl] = [
        AdMl(sfsymbols: "circle.slash.fill", labels: "None"),
        AdMl(sfsymbols: "circle.fill", labels: "Hue"), // Replace with the actual SF Symbol name
        AdMl(sfsymbols: "circle.inset.filled", labels: "Saturation"),
        AdMl(sfsymbols: "sun.max.fill", labels: "Brightness"),
        AdMl(sfsymbols: "rectangle.fill", labels: "Grayscale"), // Replace with the actual SF Symbol name
        AdMl(sfsymbols: "slider.horizontal.3", labels: "Opacity"), // Replace with the actual SF Symbol name
        AdMl(sfsymbols: "shadow", labels: "Shadow"),
        AdMl(sfsymbols: "dial.max.fill", labels: "Contrast"), // Replace with the actual SF Symbol name
        AdMl(sfsymbols: "slider.horizontal.below.rectangle", labels: "Blur") // Replace with the actual SF Symbol name
       ]
}






// Filter
struct CLModel: Codable,Hashable {
    var filters: String = ""
    var red: Double = 1.0
    var green: Double = 1.0
    var blue: Double = 1.0

   static var  clmodels: [CLModel] = [
    CLModel(filters: "Original", red: 1.0, green: 1.0, blue: 1.0),
        CLModel(filters: "Vintage", red: 0.24, green: 0.12, blue: 0.07),
        CLModel(filters: "Sepia", red: 0.44, green: 0.26, blue: 0.14),
        CLModel(filters: "Vivid", red: 1.1, green: 1.1, blue: 1.1),
        CLModel(filters: "Cool", red: 0.2, green: 0.5, blue: 0.7),
        CLModel(filters: "Warm", red: 1.0, green: 0.5, blue: 0.2),
        CLModel(filters: "Lomo", red: 0.9, green: 0.6, blue: 0.3),
        CLModel(filters: "Retro", red: 0.4, green: 0.3, blue: 0.2),
        CLModel(filters: "Cinematic", red: 0.35, green: 0.27, blue: 0.21),
        CLModel(filters: "Classic", red: 0.5, green: 0.45, blue: 0.4),
        CLModel(filters: "Dramatic", red: 0.3, green: 0.3, blue: 0.3),
        CLModel(filters: "Sunset", red: 1.0, green: 0.4, blue: 0.2),
        CLModel(filters: "Pastel", red: 0.8, green: 0.7, blue: 0.6),
        CLModel(filters: "High Contrast", red: 1.2, green: 1.2, blue: 1.2),
        CLModel(filters: "Matte", red: 0.6, green: 0.5, blue: 0.4),
        CLModel(filters: "Pop Art", red: 0.8, green: 0.1, blue: 0.1),
        CLModel(filters: "Grunge", red: 0.3, green: 0.3, blue: 0.3),
        CLModel(filters: "Urban", red: 0.4, green: 0.4, blue: 0.4),
        CLModel(filters: "Nature", red: 0.5, green: 0.7, blue: 0.3)
    ]
    
 
 
}


struct Model:Equatable {
    // Adjust
    var adjust:AdMl
    var hue:Double = 0.0
    var sat:Double = 1.0
    var bri:Double = 0.0
    var gra:Double = 0.0
    var opa:Double = 1.0
    var sha:Double = 0.0
    var con:Double = 1.0
    var blu:Double = 0.0
    
    
    // Filters
    var filter:CLModel
    
    
  // SelectedImage
    var sel: Data? = nil
    
    var x:Double = 0.0
    var y:Double = 0.0
    var z:Double = 0.0
   
    
   // Shape
    
    var shape:String = "circle.slash.fill"
   
    // Angle
    var angle:Angles
    var dragGesture:CGSize = .zero
    var scale:CGFloat = 1.0
    var selectedButtonIndex: String?
   
    
    
    
    
    // Main View
    var delete:Bool = false
    var crop:Bool = false
   

    
    
    var tabView:String = "Adjust"
    var adjusts:Adjust
    var save:Bool = false
   
    
    var saveImage:UIImage?
   
   
    
    
}

enum Adjust{
    case hue,sat,bri,gra,opa,sha,con,blu,none
}

struct Angles:Codable,Hashable {
    var icons:String = ""
    var labels:String = ""
    var values:Double = 0.0
    
    
    static var all:[Angles] = [
        Angles(icons:"triangle.righthalf.fill", labels:"Vertical",values: 0.0),
        Angles(icons:"arrowtriangle.left.fill", labels:"Horizontal",values: 0.0 ),
        Angles(icons: "circle.slash.fill", labels:"Staight",values: 0.0)
    ]
    
    
}


