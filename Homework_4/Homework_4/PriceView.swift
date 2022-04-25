//
//  PriceView.swift
//  Homework_4
//
//  Created by Ismayil Ismayilov on 24.04.22.
//

import UIKit
import SnapKit

class PriceView : UIView {
    
    private lazy var priceLabel : UILabel = {
        let label = UILabel()
        
        label.text = "10.00"
        
        guard let customFont = UIFont(name: "Mulish-ExtraBold", size: 24) else {
            fatalError("""
                   Failed to load the "Mulish-SemiBold" font.
                   Make sure the font file is included in the project and the font name is spelled correctly.
                   """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#FF7B2C")
        label.backgroundColor = .systemGray6
        label.textAlignment = .right
        return label
    }()
    
    private lazy var dollarIcon : UIImageView = {
        let image = UIImageView(image: UIImage(named: "$"))
        return image
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    private func setupUI() {
        self.addSubview(self.priceLabel)
        self.addSubview(self.dollarIcon)
        
        self.snp.makeConstraints { make in
            make.width.equalTo(74)
            make.height.equalTo(20)
        }
        
        self.dollarIcon.snp.makeConstraints { make in
            make.width.equalTo(8)
            make.height.equalTo(15)
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        self.priceLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-2)
            
        }
    }
}
