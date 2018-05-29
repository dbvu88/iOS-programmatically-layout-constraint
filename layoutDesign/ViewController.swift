//
//  ViewController.swift
//  layoutDesign
//
//  Created by Duc Vu on 5/28/18.
//  Copyright © 2018 Duc Vu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let mainView: UIView = {
        let myView = UIView()
        myView.backgroundColor = .yellow
        return myView
    }()
    
    let imageView = UIImageView()
    
    let mySecondView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        view.addSubview(mainView)
        mainView.anchor(top: view.topAnchor, bottom: view.bottomAnchor, leading: view.leadingAnchor, trailing: view.trailingAnchor, padding: .init(top: 10, left: 10, bottom: -10, right: -10))
        
        view.addSubview(imageView)
        imageView.backgroundColor = .green
        imageView.anchor(top: mainView.topAnchor, bottom: nil, leading: nil, trailing: nil, padding: .init(top: view.frame.height/10, left: 0, bottom: 0, right: 0 ))
        imageView.anchorSize(width: mainView.widthAnchor, height: mainView.heightAnchor, multipliers: (0.5, 0.3))
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(mySecondView)
        mySecondView.backgroundColor = .purple
        mySecondView.anchor(top: imageView.bottomAnchor, bottom: nil, leading: mainView.leadingAnchor, trailing: nil)
        mySecondView.translatesAutoresizingMaskIntoConstraints = false
        mySecondView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        mySecondView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension UIView {
    
    // customizable anchor size
    func anchorSize( width: NSLayoutDimension?, height: NSLayoutDimension? , multipliers: (width: CGFloat, height: CGFloat) = (1,1)){
        translatesAutoresizingMaskIntoConstraints = false

        if let width = width {
            widthAnchor.constraint(equalTo: width, multiplier: multipliers.width).isActive = true
        }
        
        
        
        if let height = height {
            heightAnchor.constraint(equalTo: height, multiplier: multipliers.height).isActive = true
        }
        
        
        
    }
    
    // size customization
    
    
    
    //customizeable anchor constraint with padding
    func anchor(top: NSLayoutYAxisAnchor?, bottom: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: padding.bottom).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: padding.right).isActive = true
        }
        
        
        
    }
}
