//
//  OnBoardingView.swift
//  SwiftUI.OnBoardingApp
//
//  Created by jc on 2020-06-24.
//  Copyright © 2020 jc. All rights reserved.
//

import SwiftUI

struct OnBoardingView: View {
    
    var subViews = [
        UIHostingController(rootView: SubView(imageString: "meditating")),
        UIHostingController(rootView: SubView(imageString: "skydiving")),
        UIHostingController(rootView: SubView(imageString: "sitting"))
    ]
    
    var titles = ["Take some time out",
                  "Conquer personal hindrances",
                  "Create a peaceful mind"]
    var captions = ["Take your time out and bring awareness into your everyday life",
                    "Meditating helps you dealing with anxiety and other psychic problems",
                    "Regular medidation sessions creates a peaceful inner mind"]
    
    @State var currentPageIndex = 0
    
    
    var body: some View {
        VStack {
            PageViewController(viewController: subViews).frame(height: 600)
            Button(action: {
                if self.currentPageIndex+1 == self.subViews.count {
                    self.currentPageIndex = 0
                } else {
                    self.currentPageIndex += 1
                }
            }) {
                Image(systemName: "arrow.right")
                    .resizable()
                    .foregroundColor(.white)
                    .frame(width: 30, height: 30)
                    .padding()
                    .background(Color.orange)
                    .cornerRadius(30)
            }
            Text(titles[currentPageIndex])
                .font(.title)
            .frame(width: 300, alignment: .center)
            Text(captions[currentPageIndex])
                .font(.subheadline)
                .foregroundColor(.gray)
                .frame(width: 300, height: 50, alignment: .center)
                .lineLimit(nil)
            
        }
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
