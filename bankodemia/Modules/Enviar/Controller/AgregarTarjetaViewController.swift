//
//  AgregarContactoTarjetaViewController.swift
//  bankodemia
//
//  Created by Adriana Limon on 3/24/22.
//

import UIKit

class AgregarTarjetaViewController: UIViewController {
    
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    lazy var backButton: UIView.backArrowButton = UIView.backArrowButton()
    lazy var titleLabel: UIView.titleButtonLabel = UIView.titleButtonLabel()
    lazy var addContactButton: UIView.cyanButton = UIView.cyanButton()
    
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
        bankodemiaLogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
        bankodemiaLogo.heightAnchor.constraint(equalToConstant: Constants.height / 14),
        ])
        
        self.view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(tapToGoBack), for: .touchUpInside)
        NSLayoutConstraint.activate([
        backButton.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        self.view.addSubview(titleLabel)
        titleLabel.text = "AGREGAR CONTACTO"
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLabel.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
        view.addSubview(addContactButton)
        addContactButton.addTarget(self, action: #selector(tapToAddAccount), for: .touchUpInside)
        addContactButton.setTitle("Agregar Contacto", for: .normal)
        addContactButton.backgroundColor = UIColor.bankodemiaCyan
        addContactButton.setTitleColor(.white, for: .normal)
        addContactButton.layer.cornerRadius = 5
        addContactButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([addContactButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -50),
        addContactButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        addContactButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
    }
    
    //MARK: Funcionalidad Botones
    
    @objc func tapToGoBack(){
        toGoBack()
    }
    
    func toGoBack() {
        let enviarViewController = EnviarViewController()
        enviarViewController.modalPresentationStyle = .fullScreen
        self.present(enviarViewController, animated: true, completion: nil)
    }
    
    @objc func tapToAddAccount(){
        toAddAccount()
    }
    
    func toAddAccount() {
        let confirmarAgregadoViewController = ConfirmarAgregadoViewController()
        confirmarAgregadoViewController.modalPresentationStyle = .fullScreen
        self.present(confirmarAgregadoViewController, animated: true, completion: nil)
    }
    
}
