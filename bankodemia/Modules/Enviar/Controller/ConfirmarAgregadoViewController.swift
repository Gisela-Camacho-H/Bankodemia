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
        NSLayoutConstraint.activate([clientsImage.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height / 3.5),
        clientsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        clientsImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        clientsImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
        clientsImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.22),
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
    
    
    @objc func tapToBackToMain(){
        backToMain()
    }
    
    func backToMain() {
        let inicioViewController = InicioViewController()
        inicioViewController.modalPresentationStyle = .fullScreen
        self.present(inicioViewController, animated: true, completion: nil)
    }
    
}
