//
//  Extension+UIStackView.swift
//  app-LocalStore
//
//  Created by Walter Luis Deonísio Junior on 18/10/20.
//

import UIKit

class VerticalStackView: UIStackView {
    
    init(arrangedSubviews: [UIView], spacing: CGFloat = 0) {
        super.init(frame: .zero)
        
        arrangedSubviews.forEach({addArrangedSubview($0)})
        self.spacing = spacing
        self.axis = .vertical
        self.distribution = .equalCentering
        self.backgroundColor = .white
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
