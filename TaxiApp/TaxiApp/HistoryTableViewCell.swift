//
//  HistoryTableViewCell.swift
//  TaxiApp
//
//  Created by Ismayil Ismayilov on 03.05.22.
//

import Foundation
import UIKit
import SnapKit

class HistoryTableViewCell : UITableViewCell {
    
    private lazy var locationImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var mainLocationLabel : UILabel = {
        let label = UILabel()
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: 16) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#19104E")
        
        return label
    }()
    
    private lazy var secondaryLocationLabel : UILabel = {
        let label = UILabel()
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: 14) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#A9A9AA")
        
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    private func setupUI () {
        
        self.contentView.addSubview(self.locationImage)
        self.contentView.addSubview(self.mainLocationLabel)
        self.contentView.addSubview(self.secondaryLocationLabel)
        
        self.locationImage.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        self.mainLocationLabel.snp.makeConstraints { make in
            make.left.equalTo(self.locationImage.snp.right).offset(16)
            make.top.equalTo(self.locationImage.snp.top)
        }
        
        self.secondaryLocationLabel.snp.makeConstraints { make in
            make.left.equalTo(self.locationImage.snp.right).offset(16)
            make.bottom.equalTo(self.locationImage.snp.bottom)
        }
    }
    
    func setup( item: History) {
        self.mainLocationLabel.text = item.mainLocation
        self.secondaryLocationLabel.text = item.secondaryLocation
        self.locationImage.image = item.locationImage.image
    }
}
