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
    
    var body: some View {
        PageViewController(viewController: subViews).frame(height: 600)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
