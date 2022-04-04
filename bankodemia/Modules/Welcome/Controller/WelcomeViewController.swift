

import UIKit

class WelcomeViewController: UIViewController {
    
    private lazy var buttonStackView: UIStackView = UIStackView()
    private lazy var fraseStackView: UIStackView = UIStackView()
    // Buttons
    private lazy var crearCuentaButton: UIView.cyanButton = UIView.cyanButton()
    private lazy var iniciarSesionButton: UIView.clearButton = UIView.clearButton()
    // Images
    private lazy var welcomeImage: UIImageView = UIImageView()
    private lazy var bankodemiaImage: UIImageView = UIImageView()
    // Labels
    private lazy var adiosLabel: UILabel = UILabel()
    private lazy var usaLabel: UILabel = UILabel()
    private lazy var tuLabel: UILabel = UILabel()
    private lazy var maneraLabel: UILabel = UILabel()
    
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
        NSLayoutConstraint.activate([bankodemiaImage.topAnchor.constraint(equalTo:
                view.topAnchor, constant: Constants.height / 14),
                bankodemiaImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     bankodemiaImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion),
                bankodemiaImage.heightAnchor.constraint(equalToConstant: Constants.height / 10),
                ])
        
    

//MARK: - Labels
        self.view.addSubview(adiosLabel)
        adiosLabel.text = "¡Adiós a las complicaciones!"
        adiosLabel.applyTitleFont()
        adiosLabel.textColor = UIColor.white
        adiosLabel.textAlignment = .center
        adiosLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([adiosLabel.topAnchor.constraint(equalTo: bankodemiaImage.topAnchor, constant: Constants.height / 6),
        adiosLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        adiosLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        self.view.addSubview(usaLabel)
        usaLabel.translatesAutoresizingMaskIntoConstraints = false
        usaLabel.text = "Usa el dinero a "
        usaLabel.textColor = UIColor.white
        
        self.view.addSubview(tuLabel)
        tuLabel.translatesAutoresizingMaskIntoConstraints = false
        tuLabel.text = " TU "
        tuLabel.textColor = UIColor.bankodemiaCyan
        
        self.view.addSubview(maneraLabel)
        maneraLabel.translatesAutoresizingMaskIntoConstraints = false
        maneraLabel.text = " manera"
        maneraLabel.textColor = UIColor.white
        
        let fraseArray = [usaLabel, tuLabel, maneraLabel]
        
        fraseStackView.axis = .horizontal
        fraseStackView.alignment = .fill
        fraseStackView.distribution = .equalSpacing
        fraseArray.forEach {label in
            fraseStackView.addArrangedSubview(label)
        }
        view.addSubview(fraseStackView)
        
        fraseArray.forEach {frase in
            frase.heightAnchor.constraint(equalToConstant: 20).isActive = true
            frase.textAlignment = .center
            frase.applyTitleFont()
        }
        fraseStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([fraseStackView.bottomAnchor.constraint(equalTo: adiosLabel.bottomAnchor, constant: 30),
        fraseStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])

//MARK: - Welcome Image
        self.view.addSubview(welcomeImage)
        welcomeImage.translatesAutoresizingMaskIntoConstraints = false
        welcomeImage.image = UIImage(named: "welcomeImage")
        NSLayoutConstraint.activate([welcomeImage.topAnchor.constraint(equalTo:
                fraseStackView.bottomAnchor, constant: Constants.height / 14),
                welcomeImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                welcomeImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
                                             welcomeImage.heightAnchor.constraint(equalToConstant: Constants.height / 3),
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
        
        NSLayoutConstraint.activate([buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant:  -Constants.height / 15),
        buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: Constants.widthProportion)
        ])
        
//MARK: - Crear Cuenta
        crearCuentaButton.setTitle("Crear Cuenta", for: .normal)
        crearCuentaButton.addTarget(self, action: #selector(onSignUpButtonTap), for: .touchUpInside)
        
//MARK: - Iniciar Sesion
        iniciarSesionButton.setTitle("Iniciar Sesión", for: .normal)
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
        let loginViewModel: LoginViewModel = LoginViewModel()
        let loginViewController: LoginViewController = LoginViewController()
        loginViewController.loginViewModel = loginViewModel
        loginViewModel.loginViewController = loginViewController
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }
    func goToSignUp() {
        let signUpViewController: SignUpViewController = SignUpViewController()
        let signupViewModel: SignUpViewModel = SignUpViewModel()
        signupViewModel.viewController = signUpViewController
        signUpViewController.signUpViewModel = signupViewModel
        signUpViewController.modalPresentationStyle = .fullScreen
        self.present(signUpViewController, animated: true, completion: nil)
        
    }
    
}
