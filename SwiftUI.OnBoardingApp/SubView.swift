//
//  SubView.swift
//  SwiftUI.OnBoardingApp
//
//  Created by jc on 2020-06-24.
//  Copyright © 2020 jc. All rights reserved.
//

import SwiftUI

struct SubView: View {
    
    var imageString: String
    
    var body: some View {
        Image(imageString)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .clipped()
    }
}

struct SubView_Previews: PreviewProvider {
    static var previews: some View {
        SubView(imageString: "meditating")
    }
}
