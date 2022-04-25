//
//  DishView.swift
//  Homework_4
//
//  Created by Ismayil Ismayilov on 24.04.22.
//

import UIKit
import SnapKit

class DishView : UIView {
    
    private lazy var label1 : UILabel = {
        let label = UILabel()
        
        label.text = "Avocado and Egg Toast"
        
        guard let customFont = UIFont(name: "Mulish-Bold", size: 20) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#32324D")
        label.backgroundColor = .systemGray6
        label.numberOfLines = 0
        
        label.textAlignment = .left
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
        
        self.addSubview(label1)
        
        self.snp.makeConstraints { make in
            make.width.equalTo(160)
            make.height.equalTo(60)
        }
        
        self.label1.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(160)
        }
    }
}
