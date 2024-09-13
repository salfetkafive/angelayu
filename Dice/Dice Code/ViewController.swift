//
//  ViewController.swift
//  Dice Code
//
//  Created by salfetkafive on 13.09.2024.
//

import UIKit

class ViewController: UIViewController {
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .greenBackground
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let diceImageView1: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let diceImageView2: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var rollButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Roll", for: .normal)
        button.tintColor = .black
        button.layer.cornerRadius = 15
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.backgroundColor = UIColor(red: 0.91, green: 0.30, blue: 0.24, alpha: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(rollButtonPressed), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(backgroundImageView)
        
        let topView = UIView()
        let logoImageView = UIImageView(image: UIImage(named: "DiceeLogo"))
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        topView.addSubview(logoImageView)
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            logoImageView.centerYAnchor.constraint(equalTo: topView.centerYAnchor)
        ])
        
        let dicesView = UIView()
        let stackView = UIStackView(arrangedSubviews: [diceImageView1, diceImageView2])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 50
        stackView.translatesAutoresizingMaskIntoConstraints = false
        dicesView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: dicesView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: dicesView.centerYAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 280),
            stackView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        let buttonView = UIView()
        buttonView.addSubview(rollButton)
        NSLayoutConstraint.activate([
            rollButton.centerXAnchor.constraint(equalTo: buttonView.centerXAnchor),
            rollButton.centerYAnchor.constraint(equalTo: buttonView.centerYAnchor),
            rollButton.widthAnchor.constraint(greaterThanOrEqualToConstant: 300),
            rollButton.heightAnchor.constraint(equalToConstant: 50)
        ])

        let stackViewContainer = UIStackView(
            arrangedSubviews: [topView, dicesView, buttonView]
        )
        stackViewContainer.axis = .vertical
        stackViewContainer.distribution = .fillEqually
        stackViewContainer.spacing = 1
        stackViewContainer.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackViewContainer)

        NSLayoutConstraint.activate([
            stackViewContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackViewContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            stackViewContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackViewContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    @objc private func rollButtonPressed() {
        let diceArray: [UIImage] = [.diceOne, .diceTwo, .diceThree, .diceFour, .diceFive]
        diceImageView1.image = diceArray.randomElement()
        diceImageView2.image = diceArray.randomElement()
    }
}

#Preview {
    ViewController()
}
