
import UIKit

class LoginViewController: UIViewController {
    
    private lazy var textFieldStack: UIStackView = UIStackView()
    private lazy var labelStackView: UIStackView = UIStackView()
    private lazy var iconImage: UIImageView = UIImageView()
    private lazy var backButton: UIButton = UIButton()
    private lazy var iniciarLabel: UILabel = UILabel()
    private lazy var escribeLabel: UILabel = UILabel()
    private lazy var emailLabel: UILabel = UILabel()
    private lazy var emailTextField: UITextField = UITextField()
    private lazy var passwordLabel: UILabel = UILabel()
    private lazy var passwordTextField: UITextField = UITextField()
    private lazy var finalLabel: UILabel = UILabel()
    private lazy var contactButton: UIButton = UIButton()
    private lazy var loginButton: UIButton = UIButton()
    private lazy var iniciarSesionButton: UIButton = UIButton()


    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        view.backgroundColor = .systemBackground
        
        
    }
    func initUI(){
        //MARK: Imagen de icono
        
        
        iconImage.frame = CGRect(x: 0, y: 0, width: 70, height: 40)
        
        
        
        self.view.addSubview(iconImage)
        iconImage.image = UIImage(named: "smallLogo")
        // Use el asset "big logo" por que siento que con "small logo" la imagen se ve poco nitida
       iconImage.translatesAutoresizingMaskIntoConstraints = false
       NSLayoutConstraint.activate([iconImage.topAnchor.constraint(equalTo:
                view.topAnchor, constant: Constants.height / 24),
                iconImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     iconImage.widthAnchor.constraint(equalToConstant: Constants.width / 4),
                iconImage.heightAnchor.constraint(equalToConstant: Constants.height / 8)
                                     
        ])
        
        //MARK: Buttons
        
        self.view.addSubview(backButton)
  // Falta ponerle la flecha (busca poner un icono
        backButton.backgroundColor = .clear
//        backButton.setTitle("arrow.backward", for: .normal)
        backButton.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: iconImage.topAnchor, constant: Constants.height / 7),
     //
        backButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4)
        ])
        
      
        
        
        // PARA EL LABEL DEL BOTON
        //NSLayoutConstraint.activate([backButton.topAnchor.constraint(equalTo: iconImage.topAnchor, constant: Constants.height / 24)
                                     
                            
        
        
    // MARK: LAbels
        
        
        self.view.addSubview(iniciarLabel)
        iniciarLabel.text = "Iniciar Sesión"
        iniciarLabel.textColor = .black
        iniciarLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([iniciarLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: Constants.height / 98),
            iniciarLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
                                     // Checa el espacio que debe ir a la izquierda
                                    ])
        
        
        
        self.view.addSubview(escribeLabel)
        escribeLabel.text = "Escribe el correo y teléfono con el que te registraste, a través de estos te enviaremos el acceso"
        self.escribeLabel.adjustsFontSizeToFitWidth = true
        escribeLabel.apply16Font()
        escribeLabel.numberOfLines = 0
        escribeLabel.textColor = UIColor.black
        escribeLabel.textAlignment = .left
        escribeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([escribeLabel.topAnchor.constraint(equalTo: iniciarLabel.topAnchor, constant: Constants.height / 11),
                                     escribeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     escribeLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85)
        ])
        
       
        
        //MARK: Placeholders
        
//        correo electronico
        
    self.view.addSubview(emailTextField)
    emailTextField.placeholder = "mels@gmail.com"
    emailTextField.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
    emailTextField.font = UIFont(name: "Poppins-Regular", size: 14)
    emailTextField.textAlignment = .left
    
        
//        contraseña
        
        self.view.addSubview(passwordTextField)
        passwordTextField.placeholder = "*******"
        passwordTextField.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)
        passwordTextField.font = UIFont(name: "Poppins-Regular", size: 14)
        passwordTextField.textAlignment = .left
        passwordTextField.isSecureTextEntry = true
        
        
        //MARK: Labels
        
        self.view.addSubview(emailLabel)
        emailLabel.text = "Escribe tu correo"
        emailLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)

        emailLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        
        
        self.view.addSubview(passwordLabel)
        passwordLabel.text = "Escribe tu contraseña"
        passwordLabel.textColor = UIColor(red: 0.302, green: 0.302, blue: 0.302, alpha: 1)

        passwordLabel.font = UIFont(name: "Poppins-Medium", size: 14)
        
        
        
        // MARK: TEXT Field Stack
        
    let textFieldArray: [UITextField] = [emailTextField, passwordTextField]
                
        textFieldStack.axis = .vertical
        textFieldStack.spacing = Constants.padding
        textFieldStack.alignment = .fill
        textFieldStack.distribution = .fillEqually
        textFieldArray.forEach {button in
            textFieldStack.addArrangedSubview(button)
                }
        view.addSubview(textFieldStack)
        textFieldStack.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([textFieldStack.bottomAnchor.constraint(equalTo: escribeLabel.bottomAnchor, constant: 140),
//          escribeLabel.bottomAnchor, constant:  Constants.height / 30)
            textFieldStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFieldStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
                ])
            textFieldArray.forEach {textField in
            textField.heightAnchor.constraint(equalToConstant: Constants.buttonSize).isActive = true
//                textField.layer.cornerRadius = 4
                textField.layer.borderWidth = 1
                 textField.layer.cornerRadius = Constants.cornerRadius
                textField.layer.borderColor = UIColor(red: 0, green: 0.8, blue: 0.8, alpha: 0.9).cgColor
                }
        
        
        // MARK: Stack de labels
        
        
//        let labelArray = [emailLabel, passwordLabel,]
//
//        labelStackView.axis = .horizontal
//        labelStackView.alignment = .fill
//        textFieldStack.spacing = 1
//        labelStackView.distribution = .equalSpacing
//        labelArray.forEach {label in
//            labelStackView.addArrangedSubview(label)
//        }
//        view.addSubview(labelStackView)
//
//        labelArray.forEach {label in
//            label.heightAnchor.constraint(equalToConstant: 20).isActive = true
//            label.textAlignment = .center
//            label.applyTitleFont()
//        }
//        labelStackView.translatesAutoresizingMaskIntoConstraints = false
//
//        NSLayoutConstraint.activate([labelStackView.bottomAnchor.constraint(equalTo: textFieldStack.bottomAnchor, constant: 30),
//        labelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        ])
  
        
        
        
        
        
        
        
  // MARK: Botones
        
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(tapToGoBack), for: .touchUpInside)
        
        
        view.addSubview(finalLabel)
        finalLabel.textAlignment = .center
        finalLabel.text = "¿Necesitas ayuda? Escríbenos a  bankodemia@com.mx"
        finalLabel.textColor = UIColor(red: 0.087, green: 0.087, blue: 0.087, alpha: 1)
        finalLabel.font = UIFont(name: "Poppins-Regular", size: 14)
        finalLabel.numberOfLines = 0
        finalLabel.lineBreakMode = .byWordWrapping
        
       

        finalLabel.translatesAutoresizingMaskIntoConstraints = false

        finalLabel.widthAnchor.constraint(equalToConstant: 328).isActive = true

        finalLabel.heightAnchor.constraint(equalToConstant: 42).isActive = true

        finalLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true

        finalLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 530).isActive = true
        
        
        view.addSubview(iniciarSesionButton)
        iniciarSesionButton.setTitle("Iniciar Sesión", for: .normal)
        iniciarSesionButton.backgroundColor = UIColor.bankodemiaCyan
        iniciarSesionButton.setTitleColor(.white, for: .normal)
        iniciarSesionButton.addTarget(self, action: #selector(onSignUpButtonTap), for: .touchUpInside)
        
        iniciarSesionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([iniciarSesionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -50),
        iniciarSesionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        iniciarSesionButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
    }
    
    
    
    
    
    
    
    
    // MARK: Funcionalidad Botones

    @objc func onSignUpButtonTap(){
        goToSignUp()
    }
    
    func goToSignUp() {
        let loginViewController: TabBarViewController = TabBarViewController()
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
