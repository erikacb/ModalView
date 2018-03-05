//
//  ModalView.swift
//  ModalView
//
//  Created by Erika Bueno on 05/03/18.
//  Copyright © 2018 Erika Bueno. All rights reserved.
//

import UIKit

class ModalView: UIView {
    
    static let WIDTH = UIScreen.main.bounds.width
    static let HEIGHT = UIScreen.main.bounds.height
    static let BOUNDS = CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT)
    
    open var nib: String!
    open var padding: Float!
    
    init(nib: String, frame: CGRect? = BOUNDS, bgColor: UIColor? = .black, modalAlpha: CGFloat? = 0.85, padding: Float = 60.0) {
        super.init(frame: frame!)
        backgroundColor = bgColor?.withAlphaComponent(modalAlpha!)
        self.nib = nib
        self.padding = padding
        tag = 123
        showInternalContent()
        addDismissButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func showInternalContent() {
        if let customView = Bundle.main.loadNibNamed(self.nib, owner: self, options: nil)?.first as? UIView {
            customView.frame = CGRect(x: CGFloat(self.padding), y: CGFloat(self.padding), width: ModalView.WIDTH-CGFloat(self.padding)*2, height: ModalView.HEIGHT-CGFloat(self.padding)*2)
            customView.alpha = 1.0
            self.addSubview(customView)
        }
    }
    
    func addDismissButton() {
        let button = UIButton()
        button.frame = CGRect(x: ModalView.WIDTH-80.0, y: 20.0, width: 70.0, height: 70.0)
        button.setTitle(" X ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 30)
        button.backgroundColor = .clear
        button.isUserInteractionEnabled = true
        button.addTarget(self, action: #selector(self.dismiss), for: .touchUpInside)
        self.addSubview(button)
    }
    
    @objc func dismiss() {
        self.viewWithTag(123)?.removeFromSuperview()
    }
    
}


extension UIView {
    @objc func removeAllSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
}

