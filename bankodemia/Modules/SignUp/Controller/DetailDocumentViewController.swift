//
//  DetailDocumentViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 16/03/22.
//

import UIKit

class DetailDocumentViewController: UIViewController {
    
    // labels
    lazy var mainLabel: UILabel = UILabel()
    lazy var documentoImageText: UILabel = UILabel()
    
    // buttons
    lazy var backButton: UIButton = UIButton()
    lazy var continuarButton: UIButton = UIButton()
    
    lazy var documentoImage: UIImageView = UIImageView()

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
        mainLabel.text = "Dale permiso a Bankodemia para utilizar la cámara. Asegñurate de tener buena luz y enfocar bien tu documento de frente"
        mainLabel.apply16Font()
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .left
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
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

