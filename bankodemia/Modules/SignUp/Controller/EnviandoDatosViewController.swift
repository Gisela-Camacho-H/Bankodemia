//
//  EnviandoDatosViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 17/03/22.
//

import UIKit

class EnviandoDatosViewController: UIViewController {
    
    var enviandoDatosViewModel: EnviandoDatosViewModel?
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    lazy var processingTransactionLabel: UILabel = UILabel()
    
    var processTimer: Timer!

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        enviandoDatosViewModel?.performRequest()
        processTimer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(timeaction), userInfo: nil, repeats: false)
    }
    
    func initUI(){
        view.applyWhiteBackgroundColor()
        
        view.addSubview(bankodemiaLogo)
        bankodemiaLogo.translatesAutoresizingMaskIntoConstraints = false
        bankodemiaLogo.image = UIImage(named: "bigLogo")
        bankodemiaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bankodemiaLogo.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
       // bankodemiaLogo.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        bankodemiaLogo.widthAnchor.constraint(equalToConstant: 190).isActive = true
        bankodemiaLogo.heightAnchor.constraint(equalToConstant: 120).isActive = true
        
        view.addSubview(processingTransactionLabel)
        processingTransactionLabel.textColor = UIColor.bankodemiaBlack
        processingTransactionLabel.numberOfLines = 2
        processingTransactionLabel.translatesAutoresizingMaskIntoConstraints = false
        processingTransactionLabel.backgroundColor = .clear
        processingTransactionLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        processingTransactionLabel.textAlignment = .center
        processingTransactionLabel.text = "Espera un momento, estamos enviando tus datos"
        processingTransactionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        processingTransactionLabel.topAnchor.constraint(equalTo: bankodemiaLogo.bottomAnchor, constant: 4).isActive = true
        processingTransactionLabel.widthAnchor.constraint(equalToConstant: 280).isActive = true
        processingTransactionLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
    }
    
    
    @objc func timeaction(){
        let vc = ConfirmacionViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

