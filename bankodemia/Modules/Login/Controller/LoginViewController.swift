
import UIKit

class LoginViewController: UIViewController {
    
    var loginViewModel: LoginViewModelProtocol?
    
    // stackView
    private lazy var textFieldStack: UIStackView = UIStackView()
    private lazy var labelStackView: UIStackView = UIStackView()
    
    // ImageView
    lazy var bankodemiaLogo: UIImageView = UIImageView()
    
    // UIButtons
    lazy var backButton: UIView.backArrowButton = UIView.backArrowButton()
    private lazy var contactButton: UIButton = UIButton()
    private lazy var loginButton: UIButton = UIButton()
    lazy var continuarButton: UIView.cyanButton = UIView.cyanButton()
    
    // UILabel
    lazy var titleLabel: UIView.titleButtonLabel = UIView.titleButtonLabel()
    lazy var mainLabel: UIView.mainTextLabel = UIView.mainTextLabel()
    private lazy var emailLabel: UILabel = UILabel()
    private lazy var passwordLabel: UILabel = UILabel()
    lazy var bottomLabel: UILabel = UILabel()
    lazy var linkLabel: UILabel = UILabel()
    
    // textFields
    private lazy var emailTextField: UIView.mainTextField = UIView.mainTextField()
    private lazy var passwordTextField: UIView.mainTextField = UIView.mainTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        initializeHideKeyboard()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func initUI(){
        
        view.applyWhiteBackgroundColor()
        //MARK: Imagen de icono
        self.view.addSubview(bankodemiaLogo)
        bankodemiaLogo.translatesAutoresizingMaskIntoConstraints = false
        bankodemiaLogo.image = UIImage(named: "smallLogo")
        NSLayoutConstraint.activate([bankodemiaLogo.topAnchor.constraint(equalTo:
                view.topAnchor, constant: Constants.height / 14),
        bankodemiaLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bankodemiaLogo.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2),
        bankodemiaLogo.heightAnchor.constraint(equalToConstant: Constants.height / 20),
        ])
        
        //MARK: Buttons
        self.view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(tapToGoBack), for: .touchUpInside)
        NSLayoutConstraint.activate([
        backButton.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20)
        ])

        
    // MARK: Labels
        self.view.addSubview(titleLabel)
        titleLabel.text = "Iniciar Sesión"
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: bankodemiaLogo.topAnchor, constant: Constants.height/10),
        titleLabel.leftAnchor.constraint(equalTo: backButton.leftAnchor, constant: Constants.padding)
        ])
        
    
        self.view.addSubview(mainLabel)
        mainLabel.text = "Escribe el correo y teléfono con el que te registraste, a través de estos te enviaremos el acceso"
        NSLayoutConstraint.activate([mainLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.buttonSize),
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        
        // label stack
        self.view.addSubview(emailLabel)
        self.view.addSubview(passwordLabel)
        emailLabel.text = "Escribe tu correo"
        passwordLabel.text = "Escribe tu contraseña"
        
        let labelArray: [UILabel] = [emailLabel, passwordLabel]
        
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
        
        // correo electronico
            self.view.addSubview(emailTextField)
            emailTextField.placeholder = "mels@gmail.com"
            emailTextField.keyboardType = UIKeyboardType.emailAddress
            emailTextField.autocapitalizationType = .none
        // contraseña
                self.view.addSubview(passwordTextField)
                passwordTextField.placeholder = "*******"
                passwordTextField.isSecureTextEntry = true
        
        // MARK: TEXT Field Stack
        
        let textFieldArray: [UIView.mainTextField] = [emailTextField, passwordTextField]
        textFieldStack.axis = .vertical
        textFieldStack.spacing = Constants.height/20
        textFieldStack.alignment = .fill
        textFieldStack.distribution = .fillEqually
        textFieldArray.forEach {button in
            textFieldStack.addArrangedSubview(button)
                }
        view.addSubview(textFieldStack)
        textFieldStack.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([textFieldStack.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 5),
//          escribeLabel.bottomAnchor, constant:  Constants.height / 30)
            textFieldStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
                ])
            textFieldArray.forEach {textField in
                    textField.layer.borderColor = UIColor.bankodemiaCyan.cgColor
                }
           
  // MARK: Botones
        
        view.addSubview(continuarButton)
        continuarButton.setTitle("Iniciar Sesión", for: .normal)
        continuarButton.addTarget(self, action: #selector(onSignUpButtonTap), for: .touchUpInside)
        
        continuarButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([continuarButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -50),
        continuarButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     continuarButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        self.view.addSubview(linkLabel)
        linkLabel.translatesAutoresizingMaskIntoConstraints = false
        linkLabel.text = "bankodemia@com.mx"
        linkLabel.textAlignment = .center
        linkLabel.textColor = UIColor.bankodemiaBlue
        
        NSLayoutConstraint.activate([linkLabel.bottomAnchor.constraint(equalTo: continuarButton.topAnchor, constant: -20),
        linkLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        linkLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
        self.view.addSubview(bottomLabel)
        bottomLabel.translatesAutoresizingMaskIntoConstraints = false
        bottomLabel.text = "¿Necesitas ayuda? Escribenos a"
        bottomLabel.numberOfLines = 0
        bottomLabel.textAlignment = .center
        bottomLabel.textColor = UIColor.bankodemiaBlack
        
        NSLayoutConstraint.activate([bottomLabel.bottomAnchor.constraint(equalTo: linkLabel.topAnchor, constant: -5),
        bottomLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bottomLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
    }
    
    // MARK: Funcionalidad Botones

    @objc func onSignUpButtonTap(){
        goToSignUp()
    }
    
    func goToSignUp() {
        let user: String? = emailTextField.text
        let countersign: String? = passwordTextField.text
        loginViewModel?.tapOnLoginButtonWithInputs(countersign: countersign, userEmail: user)
        
    }
    
    
    @objc func tapToGoBack(){
        goBack()
    }
    
    func goBack() {
        dismiss(animated: true)
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
    
}

extension LoginViewController : LoginViewControllerProtocol {
    
    func setViewModelConnection(viewModel: LoginViewModelProtocol) {
        loginViewModel = viewModel
    }
    
    func continueToUserDetailView() {
        let viewModel: UserDetailViewModel = UserDetailViewModel()
        let userViewController : InicioViewController = InicioViewController()
        userViewController.viewModel = viewModel
        viewModel.viewController = userViewController
        userViewController.modalPresentationStyle = .fullScreen
        let tabBarViewController: TabBarViewController = TabBarViewController()
        self.present(tabBarViewController, animated: true, completion: nil)

    }
    
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}

