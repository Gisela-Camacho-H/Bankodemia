//
//  EnviarViewController.swift
//  bankodemia
//
//  Created by Itzel Ibanez on 17/03/22.
//

import UIKit

class EnviarViewController: UIViewController {
    
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    lazy var backButton: UIView.backArrowButton = UIView.backArrowButton()
    lazy var titleLabel: UIView.titleButtonLabel = UIView.titleButtonLabel()
    lazy var addAccountButton: UIView.addAccountButton = UIView.addAccountButton()
    var dataSource: Account?

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
        
        self.view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(tapToGoBack), for: .touchUpInside)
        NSLayoutConstraint.activate([
        backButton.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        self.view.addSubview(titleLabel)
        titleLabel.text = "ENVIAR DINERO"
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLabel.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
        self.view.addSubview(addAccountButton)
        addAccountButton.addTarget(self, action: #selector(tapToAddAccount), for: .touchUpInside)
        NSLayoutConstraint.activate([addAccountButton.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/11.5), addAccountButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
        addAccountButton.translatesAutoresizingMaskIntoConstraints = false
        addAccountButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        addAccountButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
    }
    
    //MARK: Funcionalidad Botones
    
    @objc func tapToGoBack(){
        toGoBack()
    }
    
    func toGoBack() {
        let inicioViewController = InicioViewController()
        inicioViewController.modalPresentationStyle = .fullScreen
        self.present(inicioViewController, animated: true, completion: nil)
    }
    
    
    @objc func tapToAddAccount(){
        toAddAccount()
    }
    
    func toAddAccount() {
        let agregarTarjetaViewController = AgregarTarjetaViewController()
        agregarTarjetaViewController.modalPresentationStyle = .fullScreen
        self.present(agregarTarjetaViewController, animated: true, completion: nil)
    }
    
}
