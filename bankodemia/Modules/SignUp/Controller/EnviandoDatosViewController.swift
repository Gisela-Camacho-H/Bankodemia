//
//  EnviandoDatosViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 17/03/22.
//

import UIKit

class EnviandoDatosViewController: UIViewController {
    
    var enviandoDatosViewModel: EnviandoDatosViewModel?
    var processTimer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        enviandoDatosViewModel?.performRequest()
        processTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeaction), userInfo: nil, repeats: false)
    }
    
    func initUI(){
        view.applyWhiteBackgroundColor()
    }
    
    
    @objc func timeaction(){
        let vc = ConfirmacionViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

