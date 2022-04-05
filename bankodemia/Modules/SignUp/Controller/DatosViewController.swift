//
//  DatosViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 10/03/22.
//

import UIKit

class DatosViewController: UIViewController {
    
    var datosViewModel: DatosViewModel?
    
    // labels
    lazy var nombreLabel: UILabel = UILabel()
    lazy var apellidosLabel: UILabel = UILabel()
    lazy var ocupacionLabel: UILabel = UILabel()
    lazy var fechaLabel: UILabel = UILabel()
    lazy var bottomLabel: UILabel = UILabel()
    lazy var mainLabel: UIView.mainTextLabel = UIView.mainTextLabel()
    lazy var titleLable: UIView.titleButtonLabel = UIView.titleButtonLabel()
    lazy var validacionTextFieldLabel: UIView.validacionLabel = UIView.validacionLabel()
    
    // buttons
    private lazy var backButton: UIView.backArrowButton = UIView.backArrowButton()
    private lazy var continuarButton: UIView.cyanButton = UIView.cyanButton()
    
    // Text Fields
    lazy var nombreTextField : UIView.mainTextField = UIView.mainTextField()
    lazy var apellidosTextField : UIView.mainTextField = UIView.mainTextField()
    lazy var ocupacionTextField : UIView.mainTextField = UIView.mainTextField()
    lazy var dateTextField: UIView.mainTextField = UIView.mainTextField()
    
    // Stacks
    lazy var textFieldStackView : UIStackView = UIStackView()
    lazy var labelStackView : UIStackView = UIStackView()
    
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    
    var startDate: Date!
    var endDate: Date!
    var formatter = DateFormatter()


    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initializeHideKeyboard()
        nombreTextField.delegate = self
        apellidosTextField.delegate = self
        ocupacionTextField.delegate = self
        dateTextField.delegate = self

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
        titleLable.text = "INGRESA TUS DATOS"
        NSLayoutConstraint.activate([titleLable.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLable.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
        self.view.addSubview(mainLabel)
        mainLabel.text = "Escríbelos tal como aparecen en tu identificación oficial sin abreviaturas"
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
       
        // label stack
        self.view.addSubview(nombreLabel)
        self.view.addSubview(apellidosLabel)
        self.view.addSubview(ocupacionLabel)
        self.view.addSubview(fechaLabel)
        nombreLabel.text = "Nombre(s)"
        apellidosLabel.text = "Apellido(s)"
        ocupacionLabel.text = "Ocupación"
        fechaLabel.text = "Fecha de nacimiento"
        
        let labelArray: [UILabel] = [nombreLabel, apellidosLabel, ocupacionLabel, fechaLabel]
        
        labelStackView.axis = .vertical
        labelStackView.spacing = Constants.height/13
        labelStackView.alignment = .fill
        labelStackView.distribution = .fillEqually
        labelArray.forEach {label in
            labelStackView.addArrangedSubview(label)
        }
        view.addSubview(labelStackView)
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([labelStackView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: Constants.padding),
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
        self.view.addSubview(nombreTextField)
        nombreTextField.layer.borderColor = UIColor.bankodemiaCyan.cgColor
        nombreTextField.placeholder = "Olga Melissa"
        self.view.addSubview(apellidosTextField)
        apellidosTextField.layer.borderColor = UIColor.labelDarkGray.cgColor
        self.view.addSubview(ocupacionTextField)
        ocupacionTextField.layer.borderColor = UIColor.labelDarkGray.cgColor
        self.view.addSubview(dateTextField)
        dateTextField.layer.borderColor = UIColor.labelDarkGray.cgColor
        
        let textFieldArray: [UITextField] = [nombreTextField, apellidosTextField, ocupacionTextField, dateTextField]
        
        textFieldStackView.axis = .vertical
        textFieldStackView.spacing = Constants.height/20
        textFieldStackView.alignment = .fill
        textFieldStackView.distribution = .fillEqually
        textFieldArray.forEach {textFieldElement in
            textFieldStackView.addArrangedSubview(textFieldElement)
        }
        view.addSubview(textFieldStackView)
        textFieldStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([textFieldStackView.topAnchor.constraint(equalTo: nombreLabel.bottomAnchor, constant: 5),
            textFieldStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        self.view.addSubview(validacionTextFieldLabel)
        validacionTextFieldLabel.text = ""
        NSLayoutConstraint.activate([validacionTextFieldLabel.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: Constants.padding),
        validacionTextFieldLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        validacionTextFieldLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])

        let datePicker = MonthYearPickerView()
        datePicker.onDateSelected = { (day: Int, month: Int, year: Int) in
            let string = String(format: "%02d-%02d-%d", year, month, day + 1)
            self.dateTextField.text = string
        }
        dateTextField.inputView = datePicker
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor.bankodemiaCyan
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Aceptar", style: UIBarButtonItem.Style.plain , target: self, action: #selector(dismissMyKeyboard))
        
        toolBar.setItems([doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        dateTextField.inputAccessoryView = toolBar
        
        
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
        bottomLabel.text = "Esta información es necesaria para verificar tu identidad. Nunca la usaremos sin tu consentimiento"
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
        let loginViewController = TelefonoViewController()
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
        datosViewModel?.validateAndProcessInputData(name: nombreTextField.text ?? "", lastName: apellidosTextField.text ?? "", birthDate: dateTextField.text ?? "", ocupation: ocupacionTextField.text ?? "")
    }

    
    func continueToNextView(withData registerData: RegisterData) {
        let nextViewModel: TelefonoViewModel = TelefonoViewModel()
        nextViewModel.registerData = registerData
        let nextViewController: TelefonoViewController = TelefonoViewController()
        nextViewController.telefonoViewModel = nextViewModel
        nextViewModel.telefonoViewController = nextViewController
        nextViewController.modalPresentationStyle = .fullScreen
        present(nextViewController, animated: true, completion: nil)
    }
}

class MonthYearPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var months = [String]()
    var years = [Int]()
    var days = [Int]()
    
    var month = Calendar.current.component(.month, from: Date()) {
        didSet {
            selectRow(month - 1, inComponent: 1, animated: false)
        }
    }
    
    var day = Calendar.current.component(.day, from: Date()) {
        didSet {
            selectRow(day , inComponent: 0, animated: false)
        }
    }
    
    var year = Calendar.current.component(.year, from: Date()) {
        didSet {
                selectRow(year, inComponent: 2, animated: true)
        }
    }
    
    var onDateSelected: ((_ day: Int, _ month: Int, _ year: Int) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonSetup()
    }
    
    func commonSetup() {
        // population years
        var years: [Int] = []
        if years.count == 0 {
            var year = 1922
            for _ in 1...101 {
                years.append(year)
                year += 1
            }
        }
        self.years = years
        
        // population months with localized names
        var months: [String] = []
        var month = 0
        for _ in 1...12 {
            months.append(DateFormatter().monthSymbols[month].capitalized)
            month += 1
        }
        self.months = months
        
        // population years
        var days: [Int] = []
        if days.count == 0 {
            var day = 1
            for _ in 1...31 {
                days.append(day)
                day += 1
            }
        }
        self.days = days
        
        delegate = self
        dataSource = self
    }
    
    // Mark: UIPicker Delegate / Data Source
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(days[row])"
        case 1:
            return months[row]
        case 2:
            return "\(years[row])"
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return days.count
        case 1:
            return months.count
        case 2:
            return years.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let day = selectedRow(inComponent: 0)
        let month = selectedRow(inComponent: 1) + 1
        let year = years[selectedRow(inComponent: 2)]
        if let block = onDateSelected {
            block(day, month, year)
        }
        self.day = day
        self.month = month
        self.year = year
    }
    
}
    
extension DatosViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
