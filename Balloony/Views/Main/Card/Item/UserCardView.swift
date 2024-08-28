//
//  UserCardView.swift
//  Balloony
//
//  Created by Daryl Gialolo on 26/8/24.
//

import SwiftUI

struct UserCardView: View {
    // MARK: - Properties
    var displayName: String

    // MARK: - Body
    var body: some View {
        Text("Hello \(displayName))")
    }
}

// MARK: - Preview
#Preview {
    UserCardView(displayName: "John")
}

//import SwiftUI
//import FirebaseAuth
//
//struct UserCardView: View {
//    // MARK: - Props
//    var user: FirebaseAuth.User
//
//    // MARK: - UI
//    var body: some View {
//        Text("Hello \(user.displayName ?? "")")
//    }
//}
//
//// MARK: - Preview
//#Preview {
//    Text("")
//}

