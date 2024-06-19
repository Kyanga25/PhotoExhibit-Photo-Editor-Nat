//
//  FiltersView.swift
//  PhotoShow
//
//  Created by Nathanael Mukyanga on 2023-12-05.
//

import SwiftUI

struct FiltersView: View {
    @EnvironmentObject var object:ViewModel
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        VStack{
            Spacer()
            ScrollView(.horizontal,showsIndicators: false){
                HStack(spacing:20){
                    ForEach(CLModel.clmodels,id:\.self){ index in
                        VStack{
                            Button {
                                // To switch Color Datas
                                self.object.model.filter.filters = index.filters
                                self.object.filters()
                              
                            } label: {
                                if object.model.sel != nil  {
                                    if let images = object.model.sel ,
                                       let uiImage = UIImage(data:images){
                                        // Images
                                        Image(uiImage:uiImage)
                                            .resizable()
                                            .frame(width: 50,height: 50)
                                            .colorMultiply(Color(red:index.red,green: index.green,blue:index.blue))
                                            .clipShape(RoundedRectangle(cornerRadius: 5))
                                    }
                                }
                            }
                            
                            
                            if object.model.sel == nil {
                                VStack{
                                    Rectangle().frame(width: 50,height: 50)
                                        .foregroundStyle(.gray)
                                    
                                    
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                    
                                    Text(index.filters)
                                  //      .foregroundStyle(colorScheme == .dark ? .white:.black)
                                        .foregroundStyle(.white)
                                }
                            } else {
                                Text(index.filters)
                                    .foregroundStyle(.white)
                            }
                            
                            
                            
                            
                        }
                        
                    }
                }
            }
        }
    }
}



struct FiltersView_Previews: PreviewProvider {
    static var previews: some View {
       FiltersView()
            .environmentObject(ViewModel())
    }
}

struct ForIpad:View {
    @EnvironmentObject var object:ViewModel
    @Environment(\.colorScheme) private var colorScheme
 
    var body: some View{
        
        VStack{
            Spacer()
            Spacer()
            ScrollView(.horizontal,showsIndicators: false){
            HStack(spacing:20){
                ForEach(CLModel.clmodels,id:\.self){ index in
                    VStack{
                        Button {
                            // To switch Color Datas
                            self.object.model.filter.filters = index.filters
                            self.object.filters()
                            
                        } label: {
                            if object.model.sel != nil  {
                                if let images = object.model.sel ,
                                   let uiImage = UIImage(data:images){
                                    // Images
                                    Image(uiImage:uiImage)
                                        .resizable()
                                        .frame(width: 50,height: 50)
                                        .colorMultiply(Color(red:index.red,green: index.green,blue:index.blue))
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                }
                            }
                        }
                        
                        
                        if object.model.sel == nil {
                            VStack{
                                Rectangle().frame(width: 50,height: 50)
                                    .foregroundStyle(.gray)
                                
                                
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                                
                                Text(index.filters)
                                //      .foregroundStyle(colorScheme == .dark ? .white:.black)
                                    .foregroundStyle(.white)
                            }
                        } else {
                            Text(index.filters)
                                .foregroundStyle(.white)
                        }
                        
                        
                        
                        
                    }
                    
                }
            } }
            
        }
        
        
    }
}

struct ForIpad_Previews: PreviewProvider {
    static var previews: some View {
       ForIpad()
            .environmentObject(ViewModel())
    }
}
