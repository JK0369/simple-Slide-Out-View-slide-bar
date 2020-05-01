//
//  ViewController.swift
//  TmpTestCGAffine
//
//  Created by 김종권 on 2020/05/01.
//  Copyright © 2020 mustang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var btn: UIButton!
    var vc: ViewController2!
    var width: CGFloat!
    var isOpen: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        isOpen = false
        
        btn = UIButton()
        btn.setTitle("slide btn", for: .normal)
        btn.backgroundColor = .black
        btn.frame = CGRect(x: 50, y: 30, width: 100, height: 30)
        view.addSubview(btn)
        
        vc = ViewController2()
        vc.view.backgroundColor = .blue
        width = view.frame.width
        let height = view.frame.height
        
        vc.view.frame = CGRect(x: -width, y: 0, width: width, height: height)
        view.addSubview(vc.view)
        
        btn.addTarget(self, action: #selector(toggle(_:)), for: .touchUpInside)
    }

    @objc func toggle(_ sender: Any) {
        if isOpen == false {
            isOpen = true
            view.transform = CGAffineTransform(translationX: 50, y: 0)
            vc.view.transform = CGAffineTransform(translationX: 50, y: 0)
        } else {
            isOpen = false
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            
                self.view.transform = .identity
                self.vc.view.transform = .identity
                
            }, completion: nil)
            
        }
    }
}
