//
//  RatingView.swift
//  Homework_4
//
//  Created by Ismayil Ismayilov on 24.04.22.
//

import UIKit
import SnapKit

class RatingView : UIView {
    
    private lazy var ratingLabel : UILabel = {
        let label = UILabel()
        
        guard let customFont = UIFont(name: "Mulish-SemiBold", size: 14) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#8E8EA9")
        label.text = "5.0"
        return label
    }()
    
    private  lazy var starIcon : UIImageView = {
        let icon = UIImageView(image: UIImage(named: "star"))
        return icon
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    private func setupUI() {
        
        self.addSubview(ratingLabel)
        self.addSubview(starIcon)
        
        self.layer.cornerRadius = 14
        self.backgroundColor = .white
        
        self.snp.makeConstraints { make in
            make.height.equalTo(24)
            make.width.equalTo(52)
        }
        
        self.ratingLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-8)
        }

        self.starIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(self.ratingLabel.snp.left).offset(-3.98)
            make.width.height.equalTo(10)
        }
    }
}


