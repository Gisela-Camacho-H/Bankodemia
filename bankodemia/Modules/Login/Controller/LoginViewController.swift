
import UIKit

class LoginViewController: UIViewController {
    
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
        

        
        
//        self.view.addSubview(emailLabel)
//        emailLabel.text = "Escribe tu correo"
//        emailLabel.applyTitleFont()
//        emailLabel.textColor = UIColor.gray
//        emailLabel.textAlignment = .left
//        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        
//        NSLayoutConstraint.activate([emailLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.height / 14),
//                                     view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                                     view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
//                                    ])
       
        
        //MARK: Text Fields
        
//        self.view.addSubview(emailTextField)
//        emailTextField.placeholder = "mels@gmail.com"
//        emailTextField.backgroundColor = .purple
//        emailLabel.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([emailTextField.topAnchor.constraint(equalTo: emailLabel.topAnchor, constant: Constants.height / 2),
//                                     view.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//                                     view.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
//                                    ])
        
        view.addSubview(iniciarSesionButton)
        iniciarSesionButton.setTitle("Iniciar Sesión", for: .normal)
        iniciarSesionButton.backgroundColor = UIColor.bankodemiaCyan
        iniciarSesionButton.setTitleColor(.white, for: .normal)
        iniciarSesionButton.addTarget(self, action: #selector(onSignUpButtonTap), for: .touchUpInside)
        
        iniciarSesionButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([iniciarSesionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -100),
        iniciarSesionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        iniciarSesionButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
    }

    @objc func onSignUpButtonTap(){
        goToSignUp()
    }
    
    func goToSignUp() {
        let loginViewController: TabBarViewController = TabBarViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
}
