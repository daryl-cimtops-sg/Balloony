//
//  MenuStoryboardPreview.swift
//  Balloony
//
//  Created by Daryl Gialolo on 21/8/24.
//

import SwiftUI

@available(iOS 17, *)
#Preview {
    let storyboard = UIStoryboard(name: "MenuStoryboard", bundle: nil)
    var vc = storyboard.instantiateViewController(withIdentifier: "MenuViewController")
    return vc
}
