//
//  CropView.swift
//  PhotoShow
//
//  Created by Nathanael Mukyanga on 2023-12-05.
//

import SwiftUI

struct CropView: View {
   
    @EnvironmentObject var object:ViewModel
       var body: some View {
          
           VStack(spacing:0){
                   HStack(spacing:0){
                       Rectangle()
                           .stroke(.white,lineWidth: 0.3)
                       Rectangle()
                           .stroke(.white,lineWidth: 0.3)
                       Rectangle()
                           .stroke(.white,lineWidth: 0.3)
                   }
                   HStack(spacing:0){
                       Rectangle()
                           .stroke(.white,lineWidth: 0.3)
                       Rectangle()
                           .stroke(.white,lineWidth: 0.3)
                       Rectangle()
                           .stroke(.white,lineWidth: 0.3)
                   }
                   HStack(spacing:0){
                       Rectangle()
                           .stroke(.white,lineWidth: 0.3)
                       Rectangle()
                           .stroke(.white,lineWidth: 0.3)
                       Rectangle()
                           .stroke(.white,lineWidth: 0.3)
                   }
                   HStack(spacing:0){
                       Rectangle()
                           .stroke(.white,lineWidth: 0.3)
                       Rectangle()
                           .stroke(.white,lineWidth: 0.3)
                       Rectangle()
                           .stroke(.white,lineWidth: 0.3)
                   }
               }
                  
           
               
           .border(.gray,width: 3)
     
        
           
       }
    
}



