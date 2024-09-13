//
//  ViewController.swift
//  MagicBallCode
//
//  Created by salfetkafive on 13.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Ask Me Anything..."
        titleLabel.font = .systemFont(ofSize: 30)
        titleLabel.textColor = .white
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 1
        titleLabel.adjustsFontSizeToFitWidth = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var askButton: UIButton = {
        let askButton = UIButton()
        askButton.setTitle("Ask", for: .normal)
        askButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        askButton.backgroundColor = UIColor.white
        askButton.setTitleColor(UIColor.systemBlue, for: .normal)
        askButton.layer.cornerRadius = 10
        askButton.translatesAutoresizingMaskIntoConstraints = false
        askButton.addTarget(self, action: #selector(askButtonPressed), for: .touchUpInside)
        return askButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI() 
    }

    private func setupUI() {
        view.backgroundColor = .systemTeal
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(askButton)
        setupConstraints()
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
 
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 240),
            imageView.heightAnchor.constraint(equalToConstant: 209),
 
            askButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            askButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -50),
            askButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            askButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    @objc private func askButtonPressed() {
        updateBallImageAndLabel()
        print("Ask button pressed")
    }
    
    private func updateBallImageAndLabel() {
        let ballArray: [UIImage] = [.ball1, .ball2, .ball3, .ball4, .ball5]
        let selectedBall = ballArray.randomElement()!
        
        imageView.image = selectedBall
        
        switch selectedBall {
        case .ball1:
            titleLabel.text = "YES"
        case .ball2:
            titleLabel.text = "NO"
        case .ball3:
            titleLabel.text = "ASK AGAIN LATER"
        case .ball4:
            titleLabel.text = "THE ANSWER IS YES"
        case .ball5:
            titleLabel.text = "I HAVE NO IDEA"
        default:
            titleLabel.text = "Unknown"
        }
    }
}
