//
//  ContraseñaViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 16/03/22.
//

import UIKit

class ContrasenaViewController: UIViewController {
    
    var contrasenaViewModel: ContrasenaViewModel?
    
    // labels
    lazy var contrasenaLabel: UILabel = UILabel()
    lazy var confirmarLabel: UILabel = UILabel()
    lazy var mainLabel: UIView.mainTextLabel = UIView.mainTextLabel()
    lazy var titleLabel: UIView.titleButtonLabel = UIView.titleButtonLabel()
    lazy var subtitleLabel: UIView.textFieldLabel = UIView.textFieldLabel()
    lazy var subtitle2Label: UIView.textFieldLabel = UIView.textFieldLabel()
    lazy var validacionTextFieldLabel: UIView.validacionLabel = UIView.validacionLabel()
    
    // buttons
    lazy var backButton: UIView.backArrowButton = UIView.backArrowButton()
    private lazy var continuarButton: UIView.cyanButton = UIView.cyanButton()
    lazy var mostrarContrasenaButton: UIButton = UIButton()
    lazy var mostrarConfirmarButton: UIButton = UIButton()
    
    // textFields
    lazy var contrasenaTextField: UIView.mainTextField = UIView.mainTextField()
    lazy var confirmarTextField: UIView.mainTextField = UIView.mainTextField()
    
    // UIStacks
    lazy var labelStackView: UIStackView = UIStackView()
    lazy var textFieldStackView: UIStackView = UIStackView()
    
    
    lazy var bankodemiaLogo: UIImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        contrasenaTextField.delegate = self
        confirmarTextField.delegate = self


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
        backButton.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        self.view.addSubview(titleLabel)
        titleLabel.text = "CONTRASEÑA"
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLabel.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
        self.view.addSubview(mainLabel)
        mainLabel.text = "Crea una contraseña segura"
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        self.view.addSubview(subtitleLabel)
        subtitleLabel.text = "La usarás para entrar a la app y confirmar tus transacciones"
        NSLayoutConstraint.activate([subtitleLabel.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: Constants.buttonSize),
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        subtitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90)
        ])
        
        self.view.addSubview(subtitle2Label)
        subtitle2Label.text = "Usa al menos 6 caracteres alfanuméricos, no consecutivos ni repetidos"
        NSLayoutConstraint.activate([subtitle2Label.topAnchor.constraint(equalTo: subtitleLabel.topAnchor, constant: Constants.height/15),
        subtitle2Label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        subtitle2Label.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
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
        labelStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
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
        contrasenaTextField.isSecureTextEntry = true
        confirmarTextField.isSecureTextEntry = true
        
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
            textFieldStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        textFieldArray.forEach {textFieldElement in
            textFieldElement.layer.borderColor = UIColor.labelDarkGray.cgColor
            
        }
        
        self.view.addSubview(validacionTextFieldLabel)
        validacionTextFieldLabel.text = ""
        NSLayoutConstraint.activate([validacionTextFieldLabel.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: Constants.padding),
        validacionTextFieldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        validacionTextFieldLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        view.addSubview(continuarButton)
        continuarButton.setTitle("Crear contraseña", for: .normal)
        continuarButton.addTarget(self, action: #selector(onSignUpButtonTap), for: .touchUpInside)
        
        continuarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([continuarButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -50),
        continuarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        continuarButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        mostrarContrasenaButton = UIButton()
        view.addSubview(mostrarContrasenaButton)
        mostrarContrasenaButton.setImage(UIImage(systemName: "eye.fill" ), for: .normal)
        mostrarContrasenaButton.tintColor = UIColor.labelDarkGray
        mostrarContrasenaButton.addTarget(self, action: #selector(contrasenaVerpass), for: .touchUpInside)
        mostrarContrasenaButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([mostrarContrasenaButton.topAnchor.constraint(equalTo: contrasenaTextField.topAnchor, constant: 10),
        mostrarContrasenaButton.rightAnchor.constraint(equalTo: contrasenaTextField.rightAnchor, constant: -20)
        ])
        
        mostrarConfirmarButton = UIButton()
        view.addSubview(mostrarConfirmarButton)
        mostrarConfirmarButton.setImage(UIImage(systemName: "eye.fill" ), for: .normal)
        mostrarConfirmarButton.tintColor = UIColor.labelDarkGray
        mostrarConfirmarButton.addTarget(self, action: #selector(confirmarVerpass), for: .touchUpInside)
        mostrarConfirmarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([mostrarConfirmarButton.topAnchor.constraint(equalTo: confirmarTextField.topAnchor, constant: 10),
        mostrarConfirmarButton.rightAnchor.constraint(equalTo: confirmarTextField.rightAnchor, constant: -20)
        ])
        
    }
    
    @objc func onSignUpButtonTap(){
        didPressedContinueButton()
    }
    
    func goToSignUp() {
        let loginViewController = ConfirmacionViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    
    @objc func contrasenaVerpass(){
        contrasenaTextField.isSecureTextEntry.toggle()
        mostrarContrasenaButton.setImage(UIImage(systemName: "eye.slash.fill" ), for: .normal)
    }
    
    @objc func confirmarVerpass(){
        confirmarTextField.isSecureTextEntry.toggle()
        mostrarConfirmarButton.setImage(UIImage(systemName: "eye.slash.fill" ), for: .normal)
    }
    
    @objc func tapToGoBack(){
        goBack()
    }
    
    func goBack() {
        dismiss(animated: true)
    }
    
    func didPressedContinueButton() {
        contrasenaViewModel?.validateAndProcessInputData(countersign: contrasenaTextField.text ?? "")
        }

    
    func continueToNextView(withData registerData: RegisterData) {
        if contrasenaTextField.text == confirmarTextField.text {
        let nextViewModel: EnviandoDatosViewModel = EnviandoDatosViewModel()
        nextViewModel.registerData = registerData
        let nextViewController: EnviandoDatosViewController = EnviandoDatosViewController()
        nextViewController.enviandoDatosViewModel = nextViewModel
        nextViewModel.enviandoDatosViewController = nextViewController
        nextViewController.modalPresentationStyle = .fullScreen
            present(nextViewController, animated: true, completion: nil)
            
        }else {
            validacionTextFieldLabel.text = "Las contraseñas deben coincidir"
        }
        
    }
    
}
extension ContrasenaViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let textFieldText = textField.text {
            if let rangeOfTextToReplace = Range(range, in: textFieldText){
                let substringToReplace = textFieldText[rangeOfTextToReplace]
                let count = textFieldText.count - substringToReplace.count + string.count
                return count <= 10
            }
        }
        return false
    }
}
