//
//  WaitViewController.swift
//  bankodemia
//
//  Created by Adriana Limon on 4/3/22.
//

import UIKit

class EsperaViewController: UIViewController {
    
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    lazy var processingTransactionLabel: UILabel = UILabel()
    var processTimer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        processTimer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(timeaction), userInfo: nil, repeats: false)
        
        initUI()
    }
    
    @objc func timeaction(){

        //code for move next VC
        let vc = TransaccionFinalizadaViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
        processTimer.invalidate()//after that timer invalid

    }
    
    func initUI(){
        
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
        processingTransactionLabel.text = "Espera un momento, estamos procesando tu transacción"
        processingTransactionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        processingTransactionLabel.topAnchor.constraint(equalTo: bankodemiaLogo.bottomAnchor, constant: 4).isActive = true
        processingTransactionLabel.widthAnchor.constraint(equalToConstant: 280).isActive = true
        processingTransactionLabel.heightAnchor.constraint(equalToConstant: 48).isActive = true
        
    }
}
