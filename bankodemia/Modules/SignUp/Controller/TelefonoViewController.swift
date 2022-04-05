//
//  TelefonoViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 14/03/22.
//

import UIKit

class TelefonoViewController: UIViewController {
    
    var telefonoViewModel: TelefonoViewModel?
    
    // labels
    lazy var bottomLabel: UILabel = UILabel()
    lazy var subtitleLabel: UIView.textFieldLabel = UIView.textFieldLabel()
    lazy var mainLabel: UIView.mainTextLabel = UIView.mainTextLabel()
    lazy var titleLable: UIView.titleButtonLabel = UIView.titleButtonLabel()
    lazy var validacionTextFieldLabel: UIView.validacionLabel = UIView.validacionLabel()
    
    // buttons
    private lazy var backButton: UIView.backArrowButton = UIView.backArrowButton()
    private lazy var continuarButton: UIView.cyanButton = UIView.cyanButton()
    
    lazy var telefonoTextField: UIView.mainTextField = UIView.mainTextField()
    lazy var numberTextField: UITextField = UITextField()
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    
    let countryCode = ["+01","+52", "+44", "+91", "+86", "+31"]
    let countryName = [ "United States", "México", "United Kingdom", "India", "China", "Netherlands"]
    
    var pickerView = UIPickerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        //create the UITextfield to present the Date Picker
        initializeHideKeyboard()
        pickerView.delegate = self
        pickerView.dataSource = self
        numberTextField.delegate = self
        telefonoTextField.delegate = self

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
        
        self.view.addSubview(titleLable)
        titleLable.text = "INGRESA TU TELÉFONO"
        NSLayoutConstraint.activate([titleLable.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLable.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
        self.view.addSubview(mainLabel)
        mainLabel.text = "Lo usarás para iniciar sesión"
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.height/15),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
       
        self.view.addSubview(subtitleLabel)
        subtitleLabel.text = "Tu número de celular"
        subtitleLabel.textColor = UIColor.labelDarkGray
        NSLayoutConstraint.activate([subtitleLabel.topAnchor.constraint(equalTo: mainLabel.topAnchor, constant: Constants.height/15),
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        subtitleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])

        self.view.addSubview(telefonoTextField)
        telefonoTextField.placeholder = "+52  |"
        telefonoTextField.layer.borderColor = UIColor.bankodemiaCyan.cgColor
        NSLayoutConstraint.activate([telefonoTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10),
            telefonoTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            telefonoTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        
        self.view.addSubview(numberTextField)
        
        numberTextField.heightAnchor.constraint(equalToConstant: Constants.height/20).isActive = true
        numberTextField.backgroundColor = .clear
        numberTextField.textAlignment = NSTextAlignment.left
        numberTextField.placeholder = "   5540160405"
        numberTextField.keyboardType = UIKeyboardType.default
        numberTextField.keyboardType = .numberPad
        numberTextField.textColor = UIColor.bankodemiaBlack
        numberTextField.autocorrectionType = UITextAutocorrectionType.no
        numberTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        numberTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([numberTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 10),
            numberTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberTextField.leftAnchor.constraint(equalTo: telefonoTextField.leftAnchor, constant: 70),
                                     numberTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
        
        self.view.addSubview(validacionTextFieldLabel)
        validacionTextFieldLabel.text = ""
        NSLayoutConstraint.activate([validacionTextFieldLabel.topAnchor.constraint(equalTo: numberTextField.bottomAnchor, constant: Constants.padding),
        validacionTextFieldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        validacionTextFieldLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        telefonoTextField.inputView = pickerView
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.bankodemiaCyan
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Aceptar", style: UIBarButtonItem.Style.plain , target: self, action: #selector(dismissMyKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        telefonoTextField.inputAccessoryView = toolBar
        
        
        view.addSubview(continuarButton)
        continuarButton.setTitle("Continuar", for: .normal)
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
        bottomLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
    }
    
    @objc func onSignUpButtonTap(){
        didPressedContinueButton()
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
    
    func didPressedContinueButton() {
        guard let code = telefonoTextField.text,
              let telefono = numberTextField.text else { return }
            telefonoViewModel?.validateAndProcessInputData(phone: code + telefono)
        }

    
    func continueToNextView(withData registerData: RegisterData) {
        let nextViewModel: VerificarViewModel = VerificarViewModel()
        nextViewModel.registerData = registerData
        let nextViewController: VerificarViewController = VerificarViewController()
        nextViewController.verificarViewModel = nextViewModel
        nextViewModel.verificarViewController = nextViewController
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true, completion: nil)
    }
    
}

extension TelefonoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryCode.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(countryCode[row])  \(countryName[row])"
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        telefonoTextField.text = "\(countryCode[row])"
    }
}

extension TelefonoViewController: UITextFieldDelegate {
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

