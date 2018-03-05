//
//  ModalView.swift
//  ipi-pneoffline-ios
//
//  Created by Erika Bueno on 05/03/18.
//  Copyright © 2018 Radix Eng. All rights reserved.
//

/*
 
 Create a nib (.xib + .swift) and add it as a subview:
 self.view.addSubview(ModalView.init(nib: YOUR_NIB_NAME))
 
 Parameters:
 - nib: Your nib's name (required)
 - frame: overlay's size on screen (optional | default is the same frame as the screen a.k.a bounds)
 - bgColor: overlay's background color (optional | default is black)
 - modalAlpha: overlay's alpha (optional | default is 0.85)
 - padding: space around the overlay layer (optional | default is 60.0)
 - showDismiss: create your modal with a weird dismiss button (optional | default is true)
 
 Yes, the tag is random ;)
 
 */

import UIKit

class ModalView: UIView {
    
    static let WIDTH = UIScreen.main.bounds.width
    static let HEIGHT = UIScreen.main.bounds.height
    static let BOUNDS = CGRect(x: 0, y: 0, width: WIDTH, height: HEIGHT)
    
    open var nib: String!
    open var padding: Float!
    private var showDismiss: Bool!
    
    init(nib: String, frame: CGRect? = BOUNDS, bgColor: UIColor? = .black, modalAlpha: CGFloat? = 0.85, padding: Float = 60.0, showDismiss: Bool = true) {
        super.init(frame: frame!)
        backgroundColor = bgColor?.withAlphaComponent(modalAlpha!)
        self.nib = nib
        self.padding = padding
        self.showDismiss = showDismiss
        tag = 108
        showInternalContent()
        if showDismiss {
            addDismissButton()
        }
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
        self.viewWithTag(108)?.removeFromSuperview()
    }
    
}

extension UIView {
    @objc func removeAllSubviews() {
        for subview in subviews {
            subview.removeFromSuperview()
        }
    }
}
