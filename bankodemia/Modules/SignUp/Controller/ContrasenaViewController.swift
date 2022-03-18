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
    lazy var titleLabel: UILabel = UILabel()
    lazy var contrasenaLabel: UILabel = UILabel()
    lazy var confirmarLabel: UILabel = UILabel()
    
    // buttons
    lazy var backButton: UIButton = UIButton()
    private lazy var continuarButton: UIButton = UIButton()
    
    // textFields
    lazy var contrasenaTextField: UITextField = UITextField()
    lazy var confirmarTextField: UITextField = UITextField()
    
    // UIStacks
    lazy var labelStackView: UIStackView = UIStackView()
    lazy var textFieldStackView: UIStackView = UIStackView()
    
    
    lazy var bankodemiaLogo: UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()


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
        
        self.view.addSubview(titleLabel)
        titleLabel.text = "CONTRASEÑA"
        self.titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.apply14Font()
        titleLabel.textColor = UIColor.labelDarkGray
        titleLabel.textAlignment = .left
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLabel.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
        self.view.addSubview(mainLabel)
        mainLabel.text = "Crea una contraseña segura"
        mainLabel.apply16Font()
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .left
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90)
        ])
        
        self.view.addSubview(subtitleLabel)
        subtitleLabel.text = "La usarás para entrar a la app y confirmar tus transacciones"
        self.subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.apply14Font()
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .left
    
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.textColor = UIColor.labelDarkGray
        NSLayoutConstraint.activate([subtitleLabel.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: Constants.buttonSize),
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        subtitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90)
        ])
        
        self.view.addSubview(subtitle2Label)
        subtitle2Label.text = "Usa al menos 6 caracteres alfanuméricos, no consecutivos ni repetidos"
        self.subtitle2Label.adjustsFontSizeToFitWidth = true
        subtitle2Label.apply14Font()
        subtitle2Label.numberOfLines = 0
        subtitle2Label.textAlignment = .left
    
        subtitle2Label.translatesAutoresizingMaskIntoConstraints = false
        subtitle2Label.textColor = UIColor.labelDarkGray
        NSLayoutConstraint.activate([subtitle2Label.topAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: Constants.height/15),
        subtitle2Label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        subtitle2Label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90)
        ])
        
        // label stack
        self.view.addSubview(contrasenaLabel)
        self.view.addSubview(confirmarLabel)
        contrasenaLabel.text = "Contraseña"
        confirmarLabel.text = "Confirmar tu contraseña"
        
        let labelArray: [UILabel] = [contrasenaLabel, confirmarLabel]
        
        labelStackView.axis = .vertical
        labelStackView.spacing = Constants.height/13
        labelStackView.alignment = .fill
        labelStackView.distribution = .fillEqually
        labelArray.forEach {label in
            labelStackView.addArrangedSubview(label)
        }
        view.addSubview(labelStackView)
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([labelStackView.topAnchor.constraint(equalTo: subtitle2Label.bottomAnchor, constant: Constants.buttonSize),
        labelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        labelStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        labelArray.forEach {label in
            label.heightAnchor.constraint(equalToConstant: 20).isActive = true
            label.backgroundColor = .white
            label.apply14Font()
            label.textColor = UIColor.labelDarkGray
            label.textAlignment = .left
        }
        
        // TextField stack
        self.view.addSubview(contrasenaTextField)
        self.view.addSubview(confirmarTextField)
        
        let textFieldArray: [UITextField] = [contrasenaTextField, confirmarTextField]
        
        textFieldStackView.axis = .vertical
        textFieldStackView.spacing = Constants.height/20
        textFieldStackView.alignment = .fill
        textFieldStackView.distribution = .fillEqually
        textFieldArray.forEach {textFieldElement in
            textFieldStackView.addArrangedSubview(textFieldElement)
        }
        view.addSubview(textFieldStackView)
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([textFieldStackView.topAnchor.constraint(equalTo: contrasenaLabel.bottomAnchor, constant: 5),
            textFieldStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        ])
        textFieldArray.forEach {textFieldElement in
            textFieldElement.heightAnchor.constraint(equalToConstant: Constants.height/20).isActive = true
            textFieldElement.layer.cornerRadius = 7
            textFieldElement.layer.borderWidth = 1
            textFieldElement.backgroundColor = .clear
            textFieldElement.textAlignment = NSTextAlignment.left
            textFieldElement.keyboardType = UIKeyboardType.default
            textFieldElement.autocorrectionType = UITextAutocorrectionType.no
            textFieldElement.clearButtonMode = UITextField.ViewMode.whileEditing
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textFieldElement.frame.height))
            textFieldElement.leftView = paddingView
            textFieldElement.leftViewMode = UITextField.ViewMode.always
            textFieldElement.layer.borderColor = UIColor.labelDarkGray.cgColor
            
        }
        
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
