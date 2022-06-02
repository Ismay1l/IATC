//
//  FirstView.swift
//  TaxiApp
//
//  Created by Ismayil Ismayilov on 03.05.22.
//

import Foundation
import UIKit
import SnapKit

class ThirdView : UIView {
    
    //MARK: - UI Components
    private lazy var lineImage : UIImageView = {
        let image = UIImageView(image: UIImage(named: "line"))
        return image
    }()
    
    private lazy var headerLabel : UILabel = {
        let label = UILabel()
        label.text = "Driver is on the way"
        
        guard let customFont = UIFont(name: "Montserrat-SemiBold", size: 22) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#000000")
        
        return label
    }()
    
    private lazy var profileImage : UIImageView = {
        let view = UIImageView(image: UIImage(named: "boy"))
        return view
    }()
    
    private lazy var driverImage : UIImageView = {
        let view = UIImageView(image: UIImage(named: "driver"))
        return view
    }()
    
    private lazy var driverLabel : UILabel = {
        let label = UILabel()
        label.text = "Your captain"
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: 14) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#A9A9AA")
        
        return label
    }()
    
    private lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.text = "Abdulmalik Qasim"
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: 16) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#19104E")
        
        return label
    }()
    
    private lazy var phoneImage : UIImageView = {
        let view = UIImageView(image: UIImage(named: "phone"))
        return view
    }()
    
    private lazy var letterImage : UIImageView = {
        let view = UIImageView(image: UIImage(named: "letter"))
        return view
    }()
    
    private lazy var straightLine1Image : UIImageView = {
        let view = UIImageView(image: UIImage(named: "line1"))
        return view
    }()
    
    private lazy var pickupLocationLabel : UILabel = {
        let label = UILabel()
        label.text = "Pickup location"
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: 14) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#A9A9AA")
        
        return label
    }()
    
    private lazy var pickupAddressLabel : UILabel = {
        let label = UILabel()
        label.text = "Internet city - Business tower"
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: 16) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#19104E")
        
        return label
    }()
    
    private lazy var circleImage : UIImageView = {
        let view = UIImageView(image: UIImage(named: "circle-1"))
        return view
    }()
    
    private lazy var qiriqLine1Image : UIImageView = {
        let view = UIImageView(image: UIImage(named: "line2"))
        return view
    }()
    
    private lazy var qiriqLine2Image : UIImageView = {
        let view = UIImageView(image: UIImage(named: "line2-2"))
        return view
    }()
    
    private lazy var taxiImage : UIImageView = {
        let view = UIImageView(image: UIImage(named: "taxi"))
        return view
    }()
    
    private lazy var dropOffLocationLabel : UILabel = {
        let label = UILabel()
        label.text = "Drop off"
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: 14) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#A9A9AA")
        
        return label
    }()
    
    private lazy var dropOffAddressLabel : UILabel = {
        let label = UILabel()
        label.text = "Mall of the Emirates Metro"
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: 16) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#19104E")
        
        return label
    }()
    
    private lazy var annotationImage : UIImageView = {
        let view = UIImageView(image: UIImage(named: "annotation"))
        return view
    }()
    
    private lazy var straightLine2Image : UIImageView = {
        let view = UIImageView(image: UIImage(named: "line1-2"))
        return view
    }()
    
    private lazy var paymentLabel : UILabel = {
        let label = UILabel()
        label.text = "Payment"
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: 14) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#A9A9AA")
        
        return label
    }()
    
    private lazy var cardLabel : UILabel = {
        let label = UILabel()
        label.text = "Card:"
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: 16) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#19104E")
        
        return label
    }()
    
    private lazy var code1Label : UILabel = {
        let label = UILabel()
        label.text = ". . . .  . . . ."
        
        guard let customFont = UIFont(name: "Montserrat-Bold", size: 16) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#19104E")
        
        return label
    }()
    
    private lazy var code2Label : UILabel = {
        let label = UILabel()
        label.text = "7846"
        
        guard let customFont = UIFont(name: "Montserrat-Medium", size: 16) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#19104E")
        
        return label
    }()
    
    private lazy var priceLabel : UILabel = {
        let label = UILabel()
        label.text = "$24"
        
        guard let customFont = UIFont(name: "Montserrat-SemiBold", size: 24) else {
            fatalError()
        }
        
        label.font = UIFontMetrics.default.scaledFont(for: customFont)
        label.adjustsFontForContentSizeCategory = true
        
        label.textColor = hexStringToUIColor(hex: "#F26060")
        
        return label
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
        self.addSubview(self.headerLabel)
        self.addSubview(self.profileImage)
        self.addSubview(self.driverImage)
        self.addSubview(self.driverLabel)
        self.addSubview(self.phoneImage)
        self.addSubview(self.letterImage)
        self.addSubview(self.straightLine1Image)
        self.addSubview(self.pickupLocationLabel)
        self.addSubview(self.pickupAddressLabel)
        self.addSubview(self.circleImage)
        self.addSubview(self.qiriqLine1Image)
        self.addSubview(self.qiriqLine2Image)
        self.addSubview(self.dropOffLocationLabel)
        self.addSubview(self.dropOffAddressLabel)
        self.addSubview(self.annotationImage)
        self.addSubview(self.straightLine2Image)
        self.addSubview(self.paymentLabel)
        self.addSubview(self.cardLabel)
        self.addSubview(self.code1Label)
        self.addSubview(self.code2Label)
        self.addSubview(self.priceLabel)
        self.addSubview(self.nameLabel)
        self.addSubview(self.taxiImage)
        
        //MARK: - Constraints
        self.lineImage.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(16)
            make.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            make.width.equalTo(63)
            make.height.equalTo(4)
        }
        
        self.headerLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(28)
            make.top.equalTo(self.lineImage.snp.bottom).offset(24)
        }
        
        self.profileImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(28)
            make.top.equalTo(self.headerLabel.snp.bottom).offset(28)
            make.width.height.equalTo(40)
        }
        
        self.driverImage.snp.makeConstraints { make in
            make.top.equalTo(self.profileImage.snp.top)
            make.left.equalTo(self.profileImage.snp.right).offset(17)
            make.width.height.equalTo(14)
        }
        
        self.driverLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.driverImage.snp.centerY)
            make.left.equalTo(self.driverImage.snp.right).offset(6)
        }
        
        self.nameLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self.profileImage.snp.bottom)
            make.left.equalTo(self.profileImage.snp.right).offset(17)
        }
        
        self.letterImage.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-28)
            make.centerY.equalTo(self.profileImage.snp.centerY)
            make.width.height.equalTo(44)
        }
        
        self.phoneImage.snp.makeConstraints { make in
            make.right.equalTo(self.letterImage.snp.left).offset(-16)
            make.centerY.equalTo(self.profileImage.snp.centerY)
            make.width.height.equalTo(44)
        }
        
        self.straightLine1Image.snp.makeConstraints { make in
            make.top.equalTo(self.nameLabel.snp.bottom).offset(33)
            make.left.equalToSuperview().offset(28)
            make.right.equalToSuperview().offset(-28)
            make.height.equalTo(1)
        }
        
        self.pickupLocationLabel.snp.makeConstraints { make in
            make.top.equalTo(self.straightLine1Image.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(65)
        }
        
        self.pickupAddressLabel.snp.makeConstraints { make in
            make.top.equalTo(self.pickupLocationLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(65)
        }
        
        self.circleImage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(28)
            make.top.equalTo(self.straightLine1Image.snp.bottom).offset(33)
            make.width.height.equalTo(22)
        }
        
        self.taxiImage.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-22)
            make.top.equalTo(self.straightLine1Image.snp.bottom).offset(77)
            make.width.height.equalTo(60)
        }
        
        self.qiriqLine1Image.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(39)
            make.right.equalTo(self.taxiImage.snp.left).offset(6)
            make.height.equalTo(1)
            make.centerY.equalTo(self.taxiImage.snp.centerY).offset(-10)
        }
        
        self.dropOffLocationLabel.snp.makeConstraints { make in
            make.top.equalTo(self.qiriqLine1Image.snp.bottom).offset(26)
            make.left.equalTo(self.pickupLocationLabel.snp.left)
        }
        
        self.dropOffAddressLabel.snp.makeConstraints { make in
            make.top.equalTo(self.dropOffLocationLabel.snp.bottom).offset(4)
            make.left.equalTo(self.pickupLocationLabel.snp.left)
        }
        
        self.annotationImage.snp.makeConstraints { make in
            make.top.equalTo(self.qiriqLine1Image.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(28)
            make.width.equalTo(20)
            make.height.equalTo(23)
        }
        
        self.qiriqLine2Image.snp.makeConstraints { make in
            make.top.equalTo(self.circleImage.snp.bottom)
            make.bottom.equalTo(self.annotationImage.snp.top)
            make.centerX.equalTo(self.circleImage.snp.centerX)
            make.width.equalTo(1)
        }
        
        self.straightLine2Image.snp.makeConstraints { make in
            make.top.equalTo(self.dropOffAddressLabel.snp.bottom).offset(17)
            make.left.equalToSuperview().offset(28)
            make.right.equalToSuperview().offset(-28)
            make.height.equalTo(1)
        }
        
        self.paymentLabel.snp.makeConstraints { make in
            make.top.equalTo(self.straightLine2Image.snp.bottom).offset(24)
            make.left.equalToSuperview().offset(28)
        }
        
        self.cardLabel.snp.makeConstraints { make in
            make.top.equalTo(self.paymentLabel.snp.bottom).offset(4)
            make.left.equalToSuperview().offset(28)
        }
        
        self.code1Label.snp.makeConstraints { make in
            make.left.equalTo(self.cardLabel.snp.right).offset(14)
            make.centerY.equalTo(self.cardLabel.snp.centerY).offset(-3)
        }
        
        self.code2Label.snp.makeConstraints { make in
            make.left.equalTo(self.code1Label.snp.right).offset(8)
            make.centerY.equalTo(self.cardLabel.snp.centerY)
        }
        
        self.priceLabel.snp.makeConstraints { make in
            make.right.equalToSuperview().offset(-28)
            make.top.equalTo(self.straightLine2Image.snp.bottom).offset(39)
        }
    }
}
