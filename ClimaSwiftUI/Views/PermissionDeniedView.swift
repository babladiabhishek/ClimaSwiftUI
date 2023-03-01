//
//  PermissionDeniedView.swift
//  ClimaSwiftUI
//
//  Created by Abhishek Babladi on 2023-02-26.
//

import SwiftUI

struct PermissionDeniedView: View {
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea()
            Text("Permission Denied")
                .foregroundColor(.white)
        }
    }
}

struct PermissionDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        PermissionDeniedView()
    }
}
