//
//  DatosViewController.swift
//  bankodemia
//
//  Created by GiselaCamacho on 10/03/22.
//

import UIKit

class DatosViewController: UIViewController {
    
    // labels
    lazy var mainLabel: UILabel = UILabel()
    lazy var nombreLabel: UILabel = UILabel()
    lazy var apellidosLabel: UILabel = UILabel()
    lazy var ocupacionLabel: UILabel = UILabel()
    lazy var fechaLabel: UILabel = UILabel()
    lazy var bottomLabel: UILabel = UILabel()
    
    // buttons
    private lazy var backButton: UIButton = UIButton()
    private lazy var continuarButton: UIButton = UIButton()
    
    // Text Fields
    lazy var nombreTextField : UITextField = UITextField()
    lazy var apellidosTextField : UITextField = UITextField()
    lazy var ocupacionTextField : UITextField = UITextField()
    lazy var dateTextField: UITextField = UITextField()
    
    // Stacks
    lazy var textFieldStackView : UIStackView = UIStackView()
    lazy var labelStackView : UIStackView = UIStackView()
    
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    
    var startDate: Date!
    var endDate: Date!
    var formatter = DateFormatter()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        initUI()
        createUITextField()
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
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.buttonSize + 20),
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])
        
        self.view.addSubview(mainLabel)
        mainLabel.text = "Escríbelos tal como aparecen en tu identificación oficial sin abreviaturas"
        self.mainLabel.adjustsFontSizeToFitWidth = true
        mainLabel.apply16Font()
        mainLabel.numberOfLines = 0
        mainLabel.textAlignment = .left
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.90)
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
            
        }

        let datePicker = MonthYearPickerView()
        datePicker.onDateSelected = { (day: Int, month: Int, year: Int) in
            let string = String(format: "%02d / %02d / %d", day + 1 , month, year)
            self.dateTextField.text = string
            //self.dateTextField.resignFirstResponder()
            //self.view.endEditing(true)
        }
        dateTextField.inputView = datePicker
        
        
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
        bottomLabel.text = "Esta información es necesaria para verificar tu identidad. Nunca la usaremos sin tu consentimiento"
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

    
    func createUITextField(){
           
        dateTextField = UITextField()
        dateTextField.placeholder = "Ingresa tu fecha de nacimiento"
        dateTextField.font = UIFont.systemFont(ofSize: 14.0)
        dateTextField.layer.borderWidth = 2
        dateTextField.layer.cornerRadius = 7
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        dateTextField.textAlignment = NSTextAlignment.left
        dateTextField.keyboardType = UIKeyboardType.default
        dateTextField.autocorrectionType = UITextAutocorrectionType.no
        dateTextField.layer.borderColor = UIColor.labelDarkGray.cgColor
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.dateTextField.frame.height))
        dateTextField.leftView = paddingView
        dateTextField.leftViewMode = UITextField.ViewMode.always
        
           
       }

    @objc func tapToGoBack(){
        goBack()
    }
    
    func goBack() {
        dismiss(animated: true)
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
            //Calendar(identifier: .gregorian).component(.year, from: Date())
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
    
