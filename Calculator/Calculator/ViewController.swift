//
//  ViewController.swift
//  Calculator
//
//  Created by salfetkafive on 12.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let displayView = UIView()
    
    private let displayLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 50, weight: .thin)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mainStack: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 1
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private let stackViewOne = UIStackView()
    private let stackViewTwo = UIStackView()
    private let stackViewThird = UIStackView()
    private let stackViewFour = UIStackView()
    private let stackViewFive = UIStackView()
    
    private lazy var zeroButton = createButton(title: "0")
    private lazy var dotButton = createButton(title: ".")
    private lazy var equalButton = createButton(title: "=", color: .orange)
    private lazy var acButton = createButton(title: "AC", color: .darkGray)
    private lazy var plusMinusButton = createButton(title: "+/-", color: .darkGray)
    private lazy var percentButton = createButton(title: "%", color: .darkGray)
    private lazy var divideButton = createButton(title: "÷", color: .orange)
    
    private lazy var oneButton = createButton(title: "1")
    private lazy var twoButton = createButton(title: "2")
    private lazy var threeButton = createButton(title: "3")
    private lazy var plusButton = createButton(title: "+", color: .orange)
    
    private lazy var fourButton = createButton(title: "4")
    private lazy var fiveButton = createButton(title: "5")
    private lazy var sixButton = createButton(title: "6")
    private lazy var minusButton = createButton(title: "-", color: .orange)
    
    
    private lazy var sevenButton = createButton(title: "7")
    private lazy var eightButton = createButton(title: "8")
    private lazy var nineButton = createButton(title: "9")
    private lazy var multiplyButton = createButton(title: "×", color: .orange)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .black
        view.addSubview(mainStack)
        displayView.addSubview(displayLabel)
        mainStack.addArrangedSubviews(displayView, stackViewOne, stackViewTwo, stackViewThird, stackViewFour, stackViewFive)
        addRows()
        layoutConstraint()
    }
    
}

// MARK: - extension

// MARK: AutoLayout
extension ViewController {
    
    private func layoutConstraint() {
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            displayLabel.topAnchor.constraint(equalTo: displayView.topAnchor),
            displayLabel.leadingAnchor.constraint(equalTo: displayView.leadingAnchor, constant: 20),
            displayLabel.trailingAnchor.constraint(equalTo: displayView.trailingAnchor, constant: -20),
            displayLabel.bottomAnchor.constraint(equalTo: displayView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            zeroButton.widthAnchor.constraint(equalTo: stackViewFive.widthAnchor, multiplier: 0.5),
            dotButton.widthAnchor.constraint(equalTo: stackViewFive.widthAnchor, multiplier: 0.25)
        ])
    }
}

// MARK: createButton() & @objc
extension ViewController {
    
    private
    func createButton(title: String, color: UIColor = UIColor(red: 0.11, green: 0.61, blue: 0.96, alpha: 1)) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = color
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }
    
    @objc
    private
    func buttonTapped(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else { return }
        print("Button tapped: \(buttonText)")
    }
}

// MARK: Rows
extension ViewController {
    
    private func rowOne(){
        // Row 1
        
        stackViewOne.distribution = .fillEqually
        stackViewOne.spacing = 1
        stackViewOne.addArrangedSubview(acButton)
        stackViewOne.addArrangedSubview(plusMinusButton)
        stackViewOne.addArrangedSubview(percentButton)
        stackViewOne.addArrangedSubview(divideButton)
    }
    
    private func rowTwo(){
        // Row 2
        
        stackViewTwo.distribution = .fillEqually
        stackViewTwo.spacing = 1
        stackViewTwo.addArrangedSubview(sevenButton)
        stackViewTwo.addArrangedSubview(eightButton)
        stackViewTwo.addArrangedSubview(nineButton)
        stackViewTwo.addArrangedSubview(multiplyButton)
    }
    
    private func rowThird(){
        // Row 3
        
        stackViewThird.distribution = .fillEqually
        stackViewThird.spacing = 1
        stackViewThird.addArrangedSubview(fourButton)
        stackViewThird.addArrangedSubview(fiveButton)
        stackViewThird.addArrangedSubview(sixButton)
        stackViewThird.addArrangedSubview(minusButton)
    }
    
    private func rowFour(){
        // Row 4
        
        stackViewFour.distribution = .fillEqually
        stackViewFour.spacing = 1
        stackViewFour.addArrangedSubview(oneButton)
        stackViewFour.addArrangedSubview(twoButton)
        stackViewFour.addArrangedSubview(threeButton)
        stackViewFour.addArrangedSubview(plusButton)
    }
    
    private func rowFive(){
        // Row 5
        stackViewFive.distribution = .fillProportionally
        stackViewFive.spacing = 1
        stackViewFive.addArrangedSubview(zeroButton)
        stackViewFive.addArrangedSubview(dotButton)
        stackViewFive.addArrangedSubview(equalButton)
    }
    
    private func addRows() {
        rowOne()
        rowTwo()
        rowThird()
        rowFour()
        rowFive()
    }
}

#Preview {
    ViewController()
}


