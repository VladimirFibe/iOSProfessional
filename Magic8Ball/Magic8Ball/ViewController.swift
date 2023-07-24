import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var answerImageView: UIImageView!
//    @IBOutlet weak var askButton: UIButton!
    let answers = [#imageLiteral(resourceName: "no"), #imageLiteral(resourceName: "yes"), #imageLiteral(resourceName: "the-answer-is-yes"), #imageLiteral(resourceName: "ask-again-later"), #imageLiteral(resourceName: "i-have-no-idea")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAnswerImageView()
    }
}
extension ViewController {
    @IBAction func askButtonTapped(_ sender: UIButton) {
        answerImageView.image = answers.randomElement()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.answerImageView.image = UIImage(named: "8ball")
        }
    }
}
extension ViewController {
    private func setupAnswerImageView() {
        answerImageView.image = UIImage(named: "8ball")
    }
}
