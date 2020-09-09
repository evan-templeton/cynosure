
import UIKit
import AuthenticationServices

class LoginViewController: UIViewController {
    
    @IBOutlet weak var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        
    }
    
    func setupView() {
        let authorizationButton = ASAuthorizationAppleIDButton(type: .default, style: .white)
        authorizationButton.translatesAutoresizingMaskIntoConstraints = false
        authorizationButton.addTarget(self, action: #selector(handleAuthorizationAppleIDButtonPress), for: .touchUpInside)
        
        view.addSubview(authorizationButton)
        NSLayoutConstraint.activate([
            authorizationButton.heightAnchor.constraint(equalToConstant: 40),
            authorizationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            authorizationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            authorizationButton.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40)
        ])
        self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        navigationController?.navigationBar.barStyle = .black
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainVC = segue.destination as? HomeFeedViewController, let user = sender as? User {
            mainVC.user = user
        }
    }
    
}

//MARK: - Apple Login Authorization

extension LoginViewController: ASAuthorizationControllerDelegate {
    
    @objc
    func handleAuthorizationAppleIDButtonPress() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        
        authorizationController.performRequests()
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let credentials as ASAuthorizationAppleIDCredential:
            let user = User(credentials: credentials)
            performSegue(withIdentifier: "loginSegue", sender: user)
        default:
            break
        }
    }
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("there was an error signing in", error)
    }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return view.window!
    }
}
