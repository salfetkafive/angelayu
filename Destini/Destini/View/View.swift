//
//  View.swift
//  Destini
//
//  Created by salfetkafive on 27.09.2024.
//

import UIKit

class View: UIView {
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "background")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let storyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let choice1Button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Choice 1", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 23)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "choice1Background"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let choice2Button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Choice 2", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 23)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "choice2Background"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout() {
        addSubview(backgroundImageView)
        addSubview(stackView)
        
        stackView.addArrangedSubview(storyLabel)
        stackView.addArrangedSubview(choice1Button)
        stackView.addArrangedSubview(choice2Button)
         
        NSLayoutConstraint.activate([
   
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
             
            stackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
             
            choice1Button.heightAnchor.constraint(equalToConstant: 100),
            choice2Button.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
