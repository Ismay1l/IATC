//
//  ToppingsTableViewCell.swift
//  Homework_4
//
//  Created by Ismayil Ismayilov on 24.04.22.
//

import UIKit
import SnapKit

class ToppingsTableViewcell : UITableViewCell {
    
    var flag = true
    
    private lazy var emptyView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.viewtapped))
        view.addGestureRecognizer(gestureRecognizer)
        return view
    }()
    
    private lazy var nameLabel : UILabel = {
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
        
        label.textColor = hexStringToUIColor(hex: "#666687")
        
        return label
    }()
    
    private lazy var priceLabel : UILabel = {
        let label = UILabel()
        
        guard let customFont = UIFont(name: "Mulish-Bold", size: 14) else {
            fatalError("""
                Failed to load the "Mulish-SemiBold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#FF7B2C")
        
        return label
    }()
    
    private lazy var dollarIcon : UIImageView = {
        let image = UIImageView(image: UIImage(named: "$"))
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setupUI() {
        
        self.contentView.addSubview(self.emptyView)
        self.contentView.addSubview(self.nameLabel)
        self.contentView.addSubview(self.priceLabel)
        self.contentView.addSubview(self.dollarIcon)
        
        self.contentView.backgroundColor = .white
        
        self.contentView.layer.cornerRadius = 16
       
        
        
        self.contentView.snp.makeConstraints { make in
            make.width.equalTo(366)
            make.height.equalTo(48)
        }
        
        self.emptyView.snp.makeConstraints { make in
            make.width.height.equalTo(20)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
        }
        
        self.nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(self.emptyView.snp.right).offset(10)
        }
        
        self.dollarIcon.snp.makeConstraints { make in
            make.width.equalTo(5)
            make.height.equalTo(8)
            make.top.equalToSuperview().offset(16)
            make.right.equalTo(self.priceLabel.snp.left).offset(-2)
        }
        
        self.priceLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(14)
            make.right.equalToSuperview().offset(-16)
        }
    }
    
    func setup ( topping: Topping) {
        self.priceLabel.text = "\(topping.price)"
        self.nameLabel.text = topping.name
    }
    
    @objc func viewtapped () {
        if flag {
            self.emptyView.backgroundColor = .systemGreen
            flag = false
        }else {
            self.emptyView.backgroundColor = .white
            flag = true
        }
    }
}
