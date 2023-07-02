//
//  LoadingView.swift
//  WeatherSwiftUI
//
//  Created by Elif Bilge Parlak on 2.07.2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
       ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
