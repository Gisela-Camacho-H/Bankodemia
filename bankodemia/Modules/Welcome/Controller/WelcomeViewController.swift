

import UIKit

class WelcomeViewController: UIViewController {
    
    private lazy var buttonStackView: UIStackView = UIStackView()
    // Buttons
    private lazy var crearCuentaButton: UIButton = UIButton()
    private lazy var iniciarSesionButton: UIButton = UIButton()
    // Images
    private lazy var welcomeImage: UIImageView = UIImageView()
    private lazy var bankodemiaImage: UIImageView = UIImageView()
    // Labels
    private lazy var adiosLabel: UILabel = UILabel()
    private lazy var usaLabel: UILabel = UILabel()
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    func initUI(){
        self.view.applyBlackBackgroundColor()
        
//MARK: - Bankodemia Image
        self.view.addSubview(bankodemiaImage)
        bankodemiaImage.translatesAutoresizingMaskIntoConstraints = false
        bankodemiaImage.image = UIImage(named: "whiteLogo")
        NSLayoutConstraint.activate([bankodemiaImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
        bankodemiaImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        bankodemiaImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9),
        bankodemiaImage.heightAnchor.constraint(equalToConstant: 80),
        ])
//MARK: - Labels
        self.view.addSubview(adiosLabel)
        adiosLabel.translatesAutoresizingMaskIntoConstraints = false
        adiosLabel.text = "¡Adiós a las complicaciones!"
        adiosLabel.font = .boldSystemFont(ofSize: 22)
        adiosLabel.textColor = UIColor.white
        adiosLabel.textAlignment = .center
        NSLayoutConstraint.activate([adiosLabel.topAnchor.constraint(equalTo: bankodemiaImage.topAnchor, constant: 100),
        adiosLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     adiosLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion),
        adiosLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
        
        self.view.addSubview(usaLabel)
        usaLabel.translatesAutoresizingMaskIntoConstraints = false
        usaLabel.text = "Usa el dinero a TU manera"
        usaLabel.font = .boldSystemFont(ofSize: 20)
        usaLabel.textColor = UIColor.white
        usaLabel.textAlignment = .center
        NSLayoutConstraint.activate([usaLabel.topAnchor.constraint(equalTo: adiosLabel.topAnchor, constant: 30),
        usaLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        usaLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion),
        usaLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
//MARK: - Welcome Image
        self.view.addSubview(welcomeImage)
        welcomeImage.translatesAutoresizingMaskIntoConstraints = false
        welcomeImage.image = UIImage(named: "welcomeImage")
        NSLayoutConstraint.activate([welcomeImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -width/2 - 10),
        welcomeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        welcomeImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
        welcomeImage.heightAnchor.constraint(equalToConstant: 250),
        ])
        
        
//MARK: - Button Stack
        let buttonArray: [UIButton] = [crearCuentaButton, iniciarSesionButton]
        
        buttonStackView.axis = .vertical
        buttonStackView.spacing = Constants.padding
        buttonStackView.alignment = .fill
        buttonStackView.distribution = .fillEqually
        buttonArray.forEach {button in
            buttonStackView.addArrangedSubview(button)
        }
        view.addSubview(buttonStackView)
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
        buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        buttonArray.forEach {button in
            button.heightAnchor.constraint(equalToConstant: Constants.buttonSize).isActive = true
            button.layer.cornerRadius = Constants.cornerRadius
        }
        
//MARK: - Crear Cuenta
        crearCuentaButton.setTitle("Crear Cuenta", for: .normal)
        crearCuentaButton.backgroundColor = UIColor.bankodemiaCyan
        crearCuentaButton.setTitleColor(.white, for: .normal)
        crearCuentaButton.addTarget(self, action: #selector(onSignUpButtonTap), for: .touchUpInside)
//MARK: - Iniciar Sesion
        iniciarSesionButton.setTitle("Iniciar Sesión", for: .normal)
        iniciarSesionButton.layer.borderColor = UIColor.bankodemiaCyan.cgColor
        iniciarSesionButton.layer.borderWidth = Constants.borderWidth
        iniciarSesionButton.setTitleColor(.bankodemiaCyan, for: .normal)
        iniciarSesionButton.addTarget(self, action: #selector(onloginButtonTap), for: .touchUpInside)
    }

//MARK: - Button Functions
    @objc func onloginButtonTap(){
        goToLogin()
    }
    @objc func onSignUpButtonTap(){
        goToSignUp()
    }
    
    func goToLogin() {
        let loginViewController: LoginViewController = LoginViewController()
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    func goToSignUp() {
        let signUpViewController: SingUpViewController = SingUpViewController()
        signUpViewController.modalPresentationStyle = .fullScreen
        self.present(signUpViewController, animated: true, completion: nil)
    }
    
}
