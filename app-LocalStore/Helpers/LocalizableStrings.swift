//
//  LocalizableStrings.swift
//  app-LocalStore
//
//  Created by Walter Luis Deonísio Junior on 20/10/20.
//


import UIKit

enum LocalizableStrings: String {
    case homeTitlePrincipal = "home.principal"
    case homeTitleLocation = "home.location"
    case homeTitleProfile = "home.profile"

    func localized() -> String { rawValue.localized() }
}

extension String {
    func localized() -> String { NSLocalizedString(self, comment: "Localizable") }
}

