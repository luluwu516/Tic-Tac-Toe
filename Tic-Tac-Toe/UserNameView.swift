//
//  YourNameView.swift
//  Tic-Tac-Toe
//
//  Created by Lulu Wu on 6/20/24.
//

import SwiftUI

struct UserNameView: View {
    @AppStorage("userName") var userName = ""
    @State private var name = ""
    var body: some View {
        VStack {
            Text("This is the name that will be associated with this device.")
            TextField("Your Name", text: $name)
                .textFieldStyle(.roundedBorder)
            Button("Set") {
                userName = name
            }
            .buttonStyle(.borderedProminent)
            .disabled(name.isEmpty)
            Image("LaunchScreen")
            Spacer()
        }
        .padding()
        .navigationTitle("Tic-Tac-Toe")
        .inNavigationStack()
    }
}

struct YourNameView_Previews: PreviewProvider {
    static var previews: some View {
        UserNameView()
    }
}
