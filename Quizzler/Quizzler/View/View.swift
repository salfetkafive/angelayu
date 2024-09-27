//
//  View.swift
//  Quizzler
//
//  Created by salfetkafive on 27.09.2024.
//

import UIKit

class View: UIView {
    
    // MARK: - UI Elements
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.text = "Label"
        label.font = .systemFont(ofSize: 20)
        label.textColor = .white
        label.numberOfLines = 1
        return label
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.text = "Question Text"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    let choiceOne: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Choice 1", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = UIColor(patternImage: UIImage(named: "Rectangle")!) 
        return button
    }()
    
    let choiceTwo: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Choice 2", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = UIColor(patternImage: UIImage(named: "Rectangle")!)
        return button
    }()
    
    let choiceThree: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Choice 3", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
//        button.backgroundColor = UIColor(patternImage: UIImage(named: "Rectangle")!)
        
        return button
    }()
    
    let progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.progress = 0.0
        progressView.tintColor = UIColor(red: 1, green: 0.46, blue: 0.66, alpha: 1)
        return progressView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        return stackView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Layout Setup
    private func setupLayout() {
        
        addSubview(stackView)
        
         
        stackView.addArrangedSubview(scoreLabel)
        stackView.addArrangedSubview(questionLabel)
        stackView.addArrangedSubview(choiceOne)
        stackView.addArrangedSubview(choiceTwo)
        stackView.addArrangedSubview(choiceThree)
        stackView.addArrangedSubview(progressBar)
        
       
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
 
        choiceOne.heightAnchor.constraint(equalToConstant: 80).isActive = true
        choiceTwo.heightAnchor.constraint(equalToConstant: 80).isActive = true
        choiceThree.heightAnchor.constraint(equalToConstant: 80).isActive = true
        progressBar.heightAnchor.constraint(equalToConstant: 10).isActive = true
    }

}

