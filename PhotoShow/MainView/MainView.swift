//
//  MainView.swift
//  PhotoShow
//
//  Created by Nathanael Mukyanga on 2023-12-15.

import Foundation
import SwiftUI
import PhotosUI

struct MainView: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    
    @EnvironmentObject public var object:ViewModel
    
    @State public var shareImage = Image(systemName: "")
  
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea(.all)
        GeometryReader{ geo in
            Button(
                action: {
                    Task{
                        try! await self.object.save()
                    }
                },
                label: {
                    VStack{
                        Image(systemName: object.model.save ? "checkmark":"square.and.arrow.down.fill")
                        Text("Save")
                    }
                    .foregroundColor(object.model.save ? .green:.gray)
                }
            )
            .contentTransition(.symbolEffect(.replace))
            .frame(width:geo.size.width * 0.3,height:geo.size.height  * 0.1)
            
            
            Button(
                action: {
                    self.object.model.crop.toggle()
                },
                label: {
                    VStack{
                        Image(systemName: "crop")
                        Text("crop")
                    }
                    .foregroundStyle(.gray)
                    
                }
            )
            .frame(width:geo.size.width * 1.0,height:geo.size.height  * 0.1)
            
            
            
            
            
            VStack{
                
                Image(systemName: "square.and.arrow.up.fill")
                    .foregroundStyle(.gray)
                ShareLink("Share", item:shareImage, preview: SharePreview(Text("Shared image"), image:shareImage))
                    .tint(.gray)
                
                
            }
            .labelStyle(.titleOnly)
            
            .frame(width:geo.size.width * 1.7,height:geo.size.height  * 0.1)
            
            ZStack{
                
                
                shareImage
                    .resizable()
                    .frame(width:geo.size.width / 1.1 ,height:geo.size.height / 1.7)
                    .gesture(object.dragGestures())
                    .gesture(object.magnificationGestures())
                    .overlay{
                        if object.model.crop == true && object.model.sel != nil  {
                            
                            CropView()
                                .frame(width:geo.size.width / 1.1,height:geo.size.height / 1.7)
                            
                        }
                        
                    }
                
                PhotosPicker(
                    selection: $selectedItem,
                    matching: .images,
                    photoLibrary: .shared()) {
                        
                        Image(systemName:object.model.sel == nil  ? "plus.app.fill":"")
                            .foregroundStyle(.blue)
                            .font(.system(size: 80))
                    }
                
                    .frame(width:geo.size.width * 1.0,height:geo.size.height  * 0.95)
                
                    .onChange(of: selectedItem) { _,oldItem in
                        Task {
                            
                            await  object.selectPhoto(selectedItem:oldItem)
                        }
                    }
                
                
                
                
            }
            
            .onChange(of:object.model){ _,_ in
                
                share()
                
                
            }
            
            
            
            
            if object.model.tabView == "Filter" {
                
                if UIDevice.current.userInterfaceIdiom == .pad {
                    
                    ForIpad()
                        .frame(width:geo.size.width * 1.0,height:geo.size.height  * 0.90)
                        .padding(.horizontal)
                } else {
                    
                    FiltersView()
                    
                        .frame(width:geo.size.width * 0.9,height:geo.size.height  * 0.90)
                        .padding(.horizontal)
                }
                
                
            } else if object.model.tabView == "Shape" {
                
                if UIDevice.current.userInterfaceIdiom == .pad {
                    IpadShapeView()
                        .frame(width:geo.size.width * 1.0,height:geo.size.height  * 0.92)
                    
                    
                } else {
                    ShapeView()
                        .frame(width:geo.size.width * 1.0,height:geo.size.height  * 0.92)
                    
                    
                }
                
            } else if object.model.tabView == "Angle" {
                
                AngleView()
                    .frame(width:geo.size.width * 1.0,height:geo.size.height  * 1.7)
                
                
            } else {
                if UIDevice.current.userInterfaceIdiom == .pad {
                    VStack{
                     
                        HStack(spacing:20){
                            ForEach(AdMl.adlabels,id:\.self){ index in
                                VStack(spacing:10){
                                    Button {
                                        self.object.model.adjust.sfsymbols = index.sfsymbols
                                        self.object.adjust()
                                        self.buttonTapped(index.sfsymbols)
                                    } label: {
                                        Image(systemName:index.sfsymbols)
                                            .foregroundStyle(object.model.selectedButtonIndex == index.sfsymbols ? .blue:.gray)
                                            .font(.system(size: 20))
                                        
                                    }
                                    Text(index.labels)
                                        .foregroundStyle(.white)
                                }
                            } // End of ForEach
                        }
                        // End of ScrollView
                        sliders
                            .frame(width: 550)
                            .padding(.horizontal)
                        
                    
                    }
                    
                    .frame(width:geo.size.width * 0.9,height:geo.size.height  * 1.70)
                    .padding(.horizontal)
                    
                }  else {
                    VStack{
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack(spacing:20){
                                ForEach(AdMl.adlabels,id:\.self){ index in
                                    VStack(spacing:10){
                                        Button {
                                            self.object.model.adjust.sfsymbols = index.sfsymbols
                                            self.object.adjust()
                                            self.buttonTapped(index.sfsymbols)
                                        } label: {
                                            Image(systemName:index.sfsymbols)
                                                .foregroundStyle(object.model.selectedButtonIndex == index.sfsymbols ? .blue:.gray)
                                                .font(.system(size: 20))
                                            
                                        }
                                        Text(index.labels)
                                            .foregroundStyle(.white)
                                    }
                                } // End of ForEach
                            }
                        } // End of ScrollView
                        sliders
                            .frame(width: 300)
                         
                        
                        
                    }
                    
                    .frame(width:geo.size.width * 0.89,height:geo.size.height  * 1.70)
                   .padding(.horizontal)
                }
                
                
                
            }
            
            
            
            Button(
                action: {
                    self.object.model.tabView = "Adjust"
                },
                label: {
                    VStack{
                        Image(systemName: "leaf.circle.fill")
                        
                        
                        Text("Adjust")
                    }
                    .foregroundStyle(object.model.tabView == "Adjust" ? .blue:.gray)
                }
            )
            
            
            
            
            
            
            .frame(width:geo.size.width * 0.3,height:geo.size.height  * 1.9)
            
            
            
            Button(
                action: {
                    self.object.model.tabView = "Filter"
                    
                },
                label: {
                    VStack{
                        Image(systemName: "camera.filters")
                        
                        
                        Text("Filter")
                    }
                    
                    .foregroundStyle(object.model.tabView == "Filter" ? .blue:.gray)
                }
            )
            
            .frame(width:geo.size.width * 0.8,height:geo.size.height  * 1.9)
            
            Button(
                action: {
                    self.object.model.tabView = "Shape"
                },
                label: {
                    VStack{
                        Image(systemName: "square.on.square.fill")
                        
                        Text("Shape")
                    }
                    
                    .foregroundStyle(object.model.tabView == "Shape" ? .blue:.gray)
                    
                }
            )
            
            .frame(width:geo.size.width * 1.2,height:geo.size.height  * 1.9)
            
            
            
            Button(
                action: {
                    self.object.model.tabView = "Angle"
                },
                label: {
                    VStack{
                        Image(systemName: "compass.drawing")
                        
                        Text("Angle")
                    }
                    .foregroundStyle(object.model.tabView == "Angle" ? .blue:.gray)
                }
            )
            
            
            .frame(width:geo.size.width * 1.7,height:geo.size.height  * 1.9)
            
            
            
            
        }}
      //  .padding(.horizontal,10)
    }
    var shareImages:some View {
        VStack{
            
            if let selectedImageData = object.model.sel,
               let uiImage = UIImage(data: selectedImageData) {
                ZStack{
                    //  MyView{
                    
                    Image(uiImage: uiImage)
                    
                    
                    
                    // 380 450
                        .frame(width:380,height:450)
                        .offset(x:object.model.dragGesture.width,y: object.model.dragGesture.height)
                        .gesture(object.dragGestures())
                        .scaleEffect(object.model.scale)
                        .gesture(object.magnificationGestures())
                    
                    
                    
                    
                    
                    // Filters
                        .colorMultiply( Color(red:object.model.filter.red,green:object.model.filter.green,blue:object.model.filter.blue))
                        .blur(radius:object.model.blu)
                        .saturation(object.model.sat)
                        .brightness(object.model.bri)
                        .grayscale(object.model.gra)
                        .opacity(object.model.opa)
                        .contrast(object.model.con)
                        .hueRotation(.degrees(object.model.hue))
                    
                    
                        .overlay{
                            Rectangle()
                                .foregroundStyle( RadialGradient(
                                    gradient:Gradient(colors: [Color.clear,Color.clear,Color.clear,Color.black]),
                                    center:.center,
                                    startRadius: object.model.sha * 2,
                                    endRadius:object.model.sha * 23
                                )
                                )
                        }
                    
                        .rotation3DEffect(.degrees(45), axis: (x: object.model.x, y:object.model.y, z:object.model.z))
                    
                    
                    
                }
            }
                // End of View Stack Display
}
        
    
        
    }
    
  
    
}



struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewModel())
    }
}
