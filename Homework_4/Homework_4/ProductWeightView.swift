//
//  ProductWeightView.swift
//  Homework_4
//
//  Created by Ismayil Ismayilov on 24.04.22.
//

import UIKit
import SnapKit

class ProductWeightView : UIView {

    private lazy var numberLabel : UILabel = {
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

        label.textColor = hexStringToUIColor(hex: "#3A2D78")

        return label
    }()

    private lazy var typeLabel : UILabel = {
        let label = UILabel()

        guard let customFont = UIFont(name: "Mulish-SemiBold", size: 12) else {
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
        self.setupUI()
    }

    private func setupUI() {

        self.addSubview(self.numberLabel)
        self.addSubview(self.typeLabel)
        self.backgroundColor = .white

        self.snp.makeConstraints { make in
            make.width.equalTo(53.4)
            make.height.equalTo(38)
        }

        self.numberLabel.snp.makeConstraints { make in
            make.height.equalTo(20)
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
        }

        self.typeLabel.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-10)
            make.centerX.equalToSuperview()
            make.top.equalTo(self.numberLabel.snp.bottom).offset(2)
        }
    }

    func setup (instance: ProductWeight ) {
        self.numberLabel.text = "\(instance.number)"
        self.typeLabel.text = instance.type
    }
}
