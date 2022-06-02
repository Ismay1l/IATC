//
//  FirstView.swift
//  TaxiApp
//
//  Created by Ismayil Ismayilov on 03.05.22.
//

import Foundation
import UIKit
import SnapKit

class SecondView : UIView {
    
    //MARK: - UI Components
    private lazy var confirmLabel : UILabel = {
        let label = UILabel()
        label.text = "Confirm pickup"
        
        guard let customFont = UIFont(name: "Montserrat-SemiBold", size: 22) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#000000")
        
        return label
    }()
    
    private lazy var optionView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var lineImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: "line"))
        return image
    }()
    
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
    
    lazy var confirmButton : UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.setTitle("Confirm ride", for: .normal)
        button.backgroundColor = hexStringToUIColor(hex: "#5256E8")
        button.setTitleColor(UIColor.white, for: .normal)
        return button
    }()
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupUI()
    }
    
    //MARK: - Parent Delegate
    private func setupUI() {
        
        self.backgroundColor = .white
        
        self.addSubview(self.lineImage)
        self.addSubview(self.confirmLabel)
        self.addSubview(self.optionView)
        self.optionView.addSubview(self.locationImage)
        self.optionView.addSubview(self.mainLocationLabel)
        self.optionView.addSubview(self.secondaryLocationLabel)
        self.addSubview(self.confirmButton)
        
        //MARK: - Constraints
        self.lineImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(63)
            make.height.equalTo(4)
        }
        
        self.confirmLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(28)
            make.top.equalTo(self.lineImage.snp.bottom).offset(24)
        }
        
        self.optionView.snp.makeConstraints { make in
            make.top.equalTo(self.confirmLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(28)
            make.right.equalToSuperview().offset(-28)
            make.height.equalTo(60)
        }
        
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
        
        self.confirmButton.snp.makeConstraints { make in
            make.top.equalTo(self.optionView.snp.bottom).offset(32)
            make.left.equalToSuperview().offset(28)
            make.right.equalToSuperview().offset(-28)
            make.height.equalTo(65)
        }
    }
    
    func setup(locationImage: UIImageView, mainLcation: String, secondaryLocation: String) {
        self.locationImage.image = locationImage.image
        self.mainLocationLabel.text = mainLcation
        self.secondaryLocationLabel.text = secondaryLocation
    }
}
