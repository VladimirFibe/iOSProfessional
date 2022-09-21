import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let onboardingViewController = OnboardingContainerViewController()
    let loginViewController = LoginViewController()
    let mainViewController = MainViewController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        onboardingViewController.delegate = self
        loginViewController.delegate = self
        mainViewController.selectedIndex = 0
        regitsterForNotifivations()
        mainViewController.setStatusBar()
        displayLogin()
        return true
    }
    
    private func regitsterForNotifivations() {
        NotificationCenter.default.addObserver(self, selector: #selector(didLogout), name: .logout, object: nil)
    }
    
    @objc func didLogout() {
        setRootViewController(loginViewController)
    }
    private func displayLogin() {
        setRootViewController(loginViewController)
    }
    
    private func displayNextScreen() {
        if LocalState.hasOnboarded {
            prepMainView()
            setRootViewController(mainViewController)
        } else {
            setRootViewController(onboardingViewController)
        }
    }
    
    private func prepMainView() {
        
        mainViewController.setStatusBar()
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().backgroundColor = .appColor
    }
}

extension AppDelegate: LoginViewControllerDelegate {
    func didLogin(_ sender: LoginViewController) {
        displayNextScreen()
    }
}

extension AppDelegate: OnboardingContainerViewDelegate {
    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        prepMainView()
        setRootViewController(mainViewController)
    }
}

extension AppDelegate: DummyViewControllerDelegate {
    func logout() {
        setRootViewController(loginViewController)
    }
}
extension AppDelegate {
    func setRootViewController(_ viewcontroller: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = viewcontroller
            self.window?.makeKeyAndVisible()
            return
        }
        window.backgroundColor = .systemBackground
        window.rootViewController = viewcontroller
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil
        )
    }
}
