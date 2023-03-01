//
//  DefaultBackground.swift
//  ClimaSwiftUI
//
//  Created by Abhishek Babladi on 2023-02-26.
//

import SwiftUI

struct DefaultBackground <Content: View>: View {
    let content: Content

    init(@ViewBuilder contentBuilder: () -> Content) {
        self.content = contentBuilder()
    }

    // 1. Our contextually limited init function
        init() where Content == Color {
            self.init {
                Color.white
            }
        }
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            content
        }
    }
}

struct DefaultBackground_Previews: PreviewProvider {
    static var previews: some View {
        DefaultBackground {

        }
    }
}
