
import UIKit

class LoginViewController: UIViewController {
    
    private lazy var iniciarSesionButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    func initUI(){
        
        view.backgroundColor = .white
        
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
