//
//  TransaccionFinalizadaViewController.swift
//  bankodemia
//
//  Created by Adriana Limon on 4/3/22.
//

import UIKit

class TransaccionFinalizadaViewController: UIViewController {
    
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    lazy var confirmationImage: UIImageView = UIImageView()
    lazy var confirmationLabel: UILabel = UILabel()
    lazy var backToMainButton: UIView.cyanButton = UIView.cyanButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initUI()
    }
    
    func initUI() {
        
        self.view.addSubview(bankodemiaLogo)
        bankodemiaLogo.translatesAutoresizingMaskIntoConstraints = false
        bankodemiaLogo.image = UIImage(named: "bigLogo")
        NSLayoutConstraint.activate([bankodemiaLogo.topAnchor.constraint(equalTo:
                view.topAnchor, constant: Constants.height / 14),
        bankodemiaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bankodemiaLogo.widthAnchor.constraint(equalToConstant: 70),
        bankodemiaLogo.heightAnchor.constraint(equalToConstant: 42.5),
        ])
        
        view.addSubview(confirmationImage)
        confirmationImage.translatesAutoresizingMaskIntoConstraints = false
        confirmationImage.image = UIImage(named: "confirmationImage")
        confirmationImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmationImage.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: 120).isActive = true
        confirmationImage.widthAnchor.constraint(equalToConstant: 180).isActive = true
        confirmationImage.heightAnchor.constraint(equalToConstant: 180).isActive = true
        
        view.addSubview(confirmationLabel)
        confirmationLabel.textColor = UIColor.bankodemiaBlack
        confirmationLabel.translatesAutoresizingMaskIntoConstraints = false
        confirmationLabel.backgroundColor = .clear
        confirmationLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        confirmationLabel.textAlignment = .center
        confirmationLabel.text = "Tu transacción ha sido finalizada"
        confirmationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        confirmationLabel.topAnchor.constraint(equalTo: confirmationImage.bottomAnchor, constant: 12).isActive = true
        confirmationLabel.widthAnchor.constraint(equalToConstant: 280).isActive = true
        confirmationLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        view.addSubview(backToMainButton)
        backToMainButton.addTarget(self, action: #selector(tapToBackToMain), for: .touchUpInside)
        backToMainButton.setTitle("Volver a Inicio", for: .normal)
        backToMainButton.backgroundColor = UIColor.bankodemiaCyan
        backToMainButton.setTitleColor(.white, for: .normal)
        backToMainButton.layer.cornerRadius = 5
        backToMainButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([backToMainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -50),
        backToMainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        backToMainButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
    }
    
    //MARK: Funcionalidad Botones
    
    @objc func tapToBackToMain(){
        backToMain()
    }
    
    func backToMain() {
        if let first = presentingViewController,
                let second = first.presentingViewController{
                  first.view.isHidden = true
                  second.dismiss(animated: true)
             }
    }
    
}
