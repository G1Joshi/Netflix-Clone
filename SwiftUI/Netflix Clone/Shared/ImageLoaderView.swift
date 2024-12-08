//
//  ImageLoaderView.swift
//  Netflix Clone
//
//  Created by Jeevan Chandra Joshi on 08/12/24.
//

import SDWebImageSwiftUI
import SwiftUI

struct ImageLoaderView: View {
    var imageUrl: String = Constants.randomImage
    var contentMode: ContentMode = .fill

    var body: some View {
        Rectangle()
            .opacity(0.001)
            .overlay {
                WebImage(url: .init(string: imageUrl))
                    .resizable()
                    .indicator(.activity)
                    .aspectRatio(contentMode: contentMode)
                    .allowsHitTesting(false)
            }
            .clipped()
    }
}

#Preview {
    ImageLoaderView()
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding(40)
        .padding(.vertical, 60)
}
