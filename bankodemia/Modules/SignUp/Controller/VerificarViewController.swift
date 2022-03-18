//
//  VerificarViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 16/03/22.
//

import UIKit

class VerificarViewController: UIViewController {

    // labels
    lazy var mainLabel: UILabel = UILabel()
    lazy var subtitleLabel: UILabel = UILabel()

    // buttons
    private lazy var backButton: UIButton = UIButton()
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
        mainLabel.text = "Ahora, vamos a verificar tu identidad para proteger tu cuenta."
        self.mainLabel.adjustsFontSizeToFitWidth = true
        mainLabel.apply16Font()
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .left
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.80)
        ])
       
        self.view.addSubview(subtitleLabel)
        subtitleLabel.text = "Deberás subir una fotografía de tu INE o pasaporte vigente y tormarte una selfie. Si eres extranjero necesitarás una fotografía de tu documentos migratorio (FM3)"
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
        
        
        view.addSubview(continuarButton)
        continuarButton.setTitle("Entendido", for: .normal)
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
        let loginViewController = VerificarTableViewController()
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
