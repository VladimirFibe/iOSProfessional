import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    let onboardingViewController = OnboardingContainerViewController()
    let loginViewController = LoginViewController()
    let mainViewController = MainViewController()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        onboardingViewController.delegate = self
        loginViewController.delegate = self
        mainViewController.selectedIndex = 0
        mainViewController.setStatusBar()
        window.backgroundColor = .systemBackground
        window.makeKeyAndVisible()
        self.window = window
        displayLogin()
        return true
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
