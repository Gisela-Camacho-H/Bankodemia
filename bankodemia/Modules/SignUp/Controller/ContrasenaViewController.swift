//
//  ContraseñaViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 16/03/22.
//

import UIKit

class ContrasenaViewController: UIViewController {
    
    // labels
    lazy var mainLabel: UILabel = UILabel()
    lazy var subtitleLabel: UILabel = UILabel()
    lazy var subtitle2Label: UILabel = UILabel()
    
    // buttons
    lazy var backButton: UIButton = UIButton()
    private lazy var continuarButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()


    }
    
    func initUI(){
        self.view.addSubview(backButton)
        backButton.backgroundColor = .clear
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        backButton.tintColor = UIColor.labelDarkGray
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(tapToGoBack), for: .touchUpInside)
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.height / 6),
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.padding)
        ])
        
        self.view.addSubview(mainLabel)
        mainLabel.text = "Crea una contraseña segura"
        mainLabel.apply16Font()
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .left
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
        ])
        
        self.view.addSubview(subtitleLabel)
        subtitleLabel.text = "La usarás para entrar a la app y confirmar tus transacciones"
        self.subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.apply14Font()
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .left
    
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textColor = UIColor.labelDarkGray
        NSLayoutConstraint.activate([subtitleLabel.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: Constants.buttonSize + 30),
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        subtitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
        ])
        
        self.view.addSubview(subtitle2Label)
        subtitle2Label.text = "Usa al menos 6 caracteres alfanuméricos, no consecutivos ni repetidos"
        self.subtitle2Label.adjustsFontSizeToFitWidth = true
        subtitle2Label.apply14Font()
        subtitle2Label.numberOfLines = 0
        subtitle2Label.textAlignment = .left
    
        subtitle2Label.translatesAutoresizingMaskIntoConstraints = false
        subtitle2Label.textColor = UIColor.labelDarkGray
        NSLayoutConstraint.activate([subtitle2Label.topAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: Constants.buttonSize + 30),
        subtitle2Label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        subtitle2Label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
        ])
        
        view.addSubview(continuarButton)
        continuarButton.setTitle("Crear contraseña", for: .normal)
        continuarButton.backgroundColor = UIColor.bankodemiaCyan
        continuarButton.setTitleColor(.white, for: .normal)
        continuarButton.layer.cornerRadius = Constants.cornerRadius
        continuarButton.heightAnchor.constraint(equalToConstant: Constants.buttonSize).isActive = true
        continuarButton.addTarget(self, action: #selector(onSignUpButtonTap), for: .touchUpInside)
        
        continuarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([continuarButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -50),
        continuarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        continuarButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
    }
    
    @objc func onSignUpButtonTap(){
        goToSignUp()
    }
    
    func goToSignUp() {
        let loginViewController = Confirmacio_nViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    @objc func tapToGoBack(){
        goBack()
    }
    
    func goBack() {
        dismiss(animated: true)
    }
    
}
