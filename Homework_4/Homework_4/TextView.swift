//
//  TextView.swift
//  Homework_4
//
//  Created by Ismayil Ismayilov on 24.04.22.
//

import UIKit
import SnapKit

class TextView : UIView {
    
    private lazy var textLabel : UILabel = {
        let label = UILabel()
        label.text = "You won't skip the most important meal of the day with this avocado toast recipe. Crispy, lacy eggs and creamy avocado top hot buttered toast."
        
        guard let customFont = UIFont(name: "Mulish-Medium", size: 14) else {
            fatalError("""
                   Failed to load the "Mulish-SemiBold" font.
                   Make sure the font file is included in the project and the font name is spelled correctly.
                   """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#8E8EA9")
        label.numberOfLines = 0
        
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    private func setupUI() {
        
        self.addSubview(self.textLabel)
        
        self.snp.makeConstraints { make in
            make.width.equalTo(327)
            make.height.equalTo(72)
        }
        
        self.textLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
}
