//
//  TelefonoViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 14/03/22.
//

import UIKit

class TelefonoViewController: UIViewController {
    
    // labels
    lazy var mainLabel: UILabel = UILabel()
    lazy var bottomLabel: UILabel = UILabel()
    lazy var subtitleLabel: UILabel = UILabel()
    lazy var titleLable: UILabel = UILabel()
    
    // buttons
    private lazy var backButton: UIButton = UIButton()
    private lazy var continuarButton: UIButton = UIButton()
    
    lazy var telefonoTextField: UITextField = UITextField()
    lazy var bankodemiaLogo: UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
        //create the UITextfield to present the Date Picker
        initializeHideKeyboard()

    }
    
    
    func initUI(){
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
        backButton.backgroundColor = .clear
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        backButton.tintColor = UIColor.labelDarkGray
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.addTarget(self, action: #selector(tapToGoBack), for: .touchUpInside)
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        self.view.addSubview(titleLable)
        titleLable.text = "INGRESA TU TELÉFONO"
        self.titleLable.adjustsFontSizeToFitWidth = true
        titleLable.apply14Font()
        titleLable.textColor = UIColor.labelDarkGray
        titleLable.textAlignment = .left
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([titleLable.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLable.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
        self.view.addSubview(mainLabel)
        mainLabel.text = "Lo usarás para iniciar sesión"
        self.mainLabel.adjustsFontSizeToFitWidth = true
        mainLabel.apply16Font()
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .left
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.height/15),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90)
        ])
       
        self.view.addSubview(subtitleLabel)
        subtitleLabel.text = "Tu número de celular"
        subtitleLabel.apply14Font()
        subtitleLabel.textAlignment = .left
        subtitleLabel.textColor = UIColor.labelDarkGray
    
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textColor = UIColor.labelDarkGray
        NSLayoutConstraint.activate([subtitleLabel.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: Constants.height/15),
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        subtitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90)
        ])
        
        self.view.addSubview(telefonoTextField)
        telefonoTextField.layer.borderColor = UIColor.bankodemiaCyan.cgColor
        telefonoTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        telefonoTextField.layer.cornerRadius = 7
        telefonoTextField.layer.borderWidth = 1
        telefonoTextField.backgroundColor = .clear
        telefonoTextField.placeholder = "+52  |    5540160405"
        telefonoTextField.textAlignment = NSTextAlignment.left
        telefonoTextField.keyboardType = UIKeyboardType.default
        telefonoTextField.autocorrectionType = UITextAutocorrectionType.no
        telefonoTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: telefonoTextField.frame.height))
        telefonoTextField.leftView = paddingView
        telefonoTextField.leftViewMode = UITextField.ViewMode.always
        telefonoTextField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([telefonoTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10),
            telefonoTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            telefonoTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        
        
        view.addSubview(continuarButton)
        continuarButton.setTitle("Continuar", for: .normal)
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
        
        self.view.addSubview(bottomLabel)
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.text = "Para proteger tu cuenta, te envíaremos un código vía SMS."
        bottomLabel.numberOfLines = 0
        bottomLabel.textAlignment = .center
        bottomLabel.textColor = UIColor.bankodemiaBlack
        
        NSLayoutConstraint.activate([bottomLabel.bottomAnchor.constraint(equalTo: continuarButton.topAnchor, constant: -20),
        bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bottomLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90)
        ])
        
    }
    
    @objc func onSignUpButtonTap(){
        goToSignUp()
    }
    
    func goToSignUp() {
        let loginViewController = VerificarViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))

        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){

        view.endEditing(true)
    }

    
    

    @objc func tapToGoBack(){
        goBack()
    }
    
    func goBack() {
        dismiss(animated: true)
    }
}

    
