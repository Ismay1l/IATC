//
//  HeaderPictureView.swift
//  Homework_4
//
//  Created by Ismayil Ismayilov on 24.04.22.
//

import UIKit
import SnapKit

class HeaderPictureView : UIView {
    
    private lazy var imageView : UIImageView = {
        let image = UIImageView(image: UIImage(named: "avocado"))
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
        
        self.addSubview(imageView)
        self.backgroundColor = .systemGray6
        
        self.snp.makeConstraints { make in
            make.height.width.equalTo(170)
        }
        
        self.imageView.snp.makeConstraints { make in
            make.top.equalTo(self.snp.top)
            make.left.equalTo(self.snp.left)
            make.right.equalTo(self.snp.right)
            make.bottom.equalTo(self.snp.bottom)
        }
    }
}

