//
//  DetailDocumentViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 16/03/22.
//

import UIKit

class DetailDocumentViewController: UIViewController {
    
    // labels
    lazy var mainLabel: UIView.mainTextLabel = UIView.mainTextLabel()
    lazy var titleLable: UIView.titleButtonLabel = UIView.titleButtonLabel()
    lazy var documentoImageText: UILabel = UILabel()
    
    // buttons
    lazy var backButton: UIView.backArrowButton = UIView.backArrowButton()
    lazy var continuarButton: UIView.cyanButton = UIView.cyanButton()
    
    lazy var documentoImage: UIImageView = UIImageView()
    lazy var bankodemiaLogo: UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI(){
        
        view.applyWhiteBackgroundColor()
        
        self.view.addSubview(bankodemiaLogo)
        bankodemiaLogo.translatesAutoresizingMaskIntoConstraints = false
        bankodemiaLogo.image = UIImage(named: "smallLogo")
        NSLayoutConstraint.activate([bankodemiaLogo.topAnchor.constraint(equalTo:
                view.topAnchor, constant: Constants.height / 14),
        bankodemiaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bankodemiaLogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
        bankodemiaLogo.heightAnchor.constraint(equalToConstant: Constants.height / 20),
        ])
        
        self.view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(tapToGoBack), for: .touchUpInside)
        NSLayoutConstraint.activate([
        backButton.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/15),
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        self.view.addSubview(titleLable)
        titleLable.text = ""
        NSLayoutConstraint.activate([titleLable.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLable.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
        
        self.view.addSubview(mainLabel)
        mainLabel.text = "Dale permiso a Bankodemia para utilizar la cámara. Asegurate de tener buena luz y enfocar bien tu documento de frente"
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        self.view.addSubview(documentoImage)
        documentoImage.backgroundColor = UIColor.lightGrayColor
        documentoImage.layer.borderColor = UIColor.labelDarkGray.cgColor
        documentoImage.layer.borderWidth = 1
        documentoImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([documentoImage.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: Constants.buttonSize),
        documentoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        documentoImage.heightAnchor.constraint(equalToConstant: Constants.height/4),
        documentoImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
        ])
        
        self.view.addSubview(documentoImageText)
        documentoImageText.text = "Arrastra tu archivo aquí o subelo desde tu ORDENADOR"
        documentoImageText.apply14Font()
        documentoImageText.numberOfLines = 0
        documentoImageText.textAlignment = .center
        documentoImageText.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([documentoImageText.topAnchor.constraint(equalTo: documentoImage.topAnchor, constant: Constants.buttonSize + 50),
        documentoImageText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        documentoImageText.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.60)
        ])
        
        
        view.addSubview(continuarButton)
        continuarButton.setTitle("Subir Información", for: .normal)
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
        let loginViewController = ContrasenaViewController()
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

