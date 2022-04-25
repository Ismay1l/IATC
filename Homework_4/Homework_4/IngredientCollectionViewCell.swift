//
//  IngredientCollectionViewCell.swift
//  Homework_4
//
//  Created by Ismayil Ismayilov on 24.04.22.
//

import UIKit
import SnapKit

class IngredientCollectionViewCell : UICollectionViewCell {
    
    
    private lazy var itemImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var itemName : UILabel = {
        let label = UILabel()
        
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
        
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    private func setupUI () {
        
        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 16
        self.contentView.clipsToBounds = true
        
        self.contentView.addSubview(self.itemImage)
        self.contentView.addSubview(self.itemName)
        
        self.contentView.snp.makeConstraints { make in
            make.width.equalTo(92)
            make.height.equalTo(74)
        }
        
        self.itemImage.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.top.equalToSuperview().offset(12)
            make.centerX.equalToSuperview()
        }
        
        self.itemName.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.bottom.equalToSuperview().offset(-12)
            make.centerX.equalToSuperview()
        }
    }
    
    func setup( ingredient: IngredientCellItems) {
        self.itemImage.image = ingredient.image.image
        self.itemName.text = ingredient.name
    }
}
