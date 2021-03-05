//
//  LocalizableStrings.swift
//  app-LocalStore
//
//  Created by Walter Luis Deonísio Junior on 20/10/20.
//


import UIKit

enum LocalizableStrings: String {
    case homeTitlePrincipal = "Home"
    case homeTitleLocation = "Location"
    case homeTitleProfile = "Profile"

    func localized() -> String { rawValue.localized() }
}

extension String {
    func localized() -> String { NSLocalizedString(self, comment: "Localizable") }
}

