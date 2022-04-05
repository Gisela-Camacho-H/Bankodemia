//
//  ConfirmarAgregadoViewController.swift
//  bankodemia
//
//  Created by Adriana Limon on 3/24/22.
//

import UIKit

class ConfirmarAgregadoViewController: UIViewController {
    
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    lazy var backToMainButton: UIView.cyanButton = UIView.cyanButton()
    lazy var clientsImage: UIImageView = UIImageView()
    lazy var successLabel: UILabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        
        initUI()
    }
    
    func initUI(){
        
        view.applyWhiteBackgroundColor()
        
        self.view.addSubview(bankodemiaLogo)
        bankodemiaLogo.translatesAutoresizingMaskIntoConstraints = false
        bankodemiaLogo.image = UIImage(named: "bigLogo")
        NSLayoutConstraint.activate([bankodemiaLogo.topAnchor.constraint(equalTo:
                view.topAnchor, constant: Constants.height / 14),
        bankodemiaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bankodemiaLogo.widthAnchor.constraint(equalToConstant: 70),
        bankodemiaLogo.heightAnchor.constraint(equalToConstant: 42.5),
        ])
        
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
        
        self.view.addSubview(clientsImage)
        clientsImage.translatesAutoresizingMaskIntoConstraints = false
        clientsImage.image = UIImage(named: "clientsBankodemia")
        clientsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        clientsImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        clientsImage.widthAnchor.constraint(equalToConstant: 240).isActive = true
        clientsImage.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        self.view.addSubview(successLabel)
        successLabel.textColor = UIColor.bankodemiaBlack
        successLabel.backgroundColor = .clear
        successLabel.font = UIFont(name: "Poppins-Medium", size: 16)
        successLabel.textAlignment = .center
        successLabel.attributedText = NSMutableAttributedString(string: "Tu contacto fue agregado con éxito", attributes: [NSAttributedString.Key.kern: 0.7])
        successLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        view.addSubview(successLabel)
        successLabel.translatesAutoresizingMaskIntoConstraints = false
        successLabel.widthAnchor.constraint(equalToConstant: 328).isActive = true
        successLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        successLabel.bottomAnchor.constraint(equalTo: clientsImage.bottomAnchor, constant: 32).isActive = true
    }
    
    //MARK: Funcionalidad Botones
    
    @objc func tapToBackToMain(){
        backToMain()
    }
    
    func backToMain() {
        let backViewController: EnviarViewController = EnviarViewController()
        backViewController.modalPresentationStyle = .fullScreen
        self.present(backViewController, animated: true, completion: nil)
    }
    
}
