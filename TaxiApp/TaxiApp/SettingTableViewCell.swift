//
//  SettingTableViewCell.swift
//  TaxiApp
//
//  Created by Ismayil Ismayilov on 02.05.22.
//

import Foundation
import UIKit
import SnapKit

class SettingTableViewCell : UITableViewCell {
    
    private lazy var circleImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: "circle"))
        return image
    }()
    
    private lazy var circleIcon : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var optionLabel : UILabel = {
        let label = UILabel()
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: 16) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#19104E")
        label.textAlignment = .center
        
        return label
    }()
    
    private lazy var arrowIcon : UIImageView = {
        let image = UIImageView(image: UIImage(named: "arrow"))
        return image
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    private func setupUI () {
        self.backgroundColor = .white
        self.contentView.addSubview(self.circleImage)
        self.contentView.addSubview(self.circleIcon)
        self.contentView.addSubview(self.optionLabel)
        self.contentView.addSubview(self.arrowIcon)
        
        
        self.circleImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(28)
            make.top.equalToSuperview().offset(20)
            make.bottom.equalToSuperview().offset(-20)
            make.width.height.equalTo(36)
        }
        
        self.circleIcon.snp.makeConstraints { make in
            make.center.equalTo(self.circleImage.snp.center)
            make.width.height.equalTo(16)
        }
        
        self.optionLabel.snp.makeConstraints { make in
            make.left.equalTo(self.circleImage.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }
        
        self.arrowIcon.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-28)
            make.centerY.equalToSuperview()
        }
    }
    
    func  setup (option : Option) {
        self.circleIcon.image = option.circleIcon.image
        self.optionLabel.text = option.optionText
    }
}
