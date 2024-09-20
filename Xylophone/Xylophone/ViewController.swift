//
//  ViewController.swift
//  Xylophone
//
//  Created by salfetkafive on 20.09.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer!
    let cKeyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemRed
        button.setTitle("C", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.tag = 1
        button.addTarget(self, action: #selector(keyPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    let dKeyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemOrange
        button.setTitle("D", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.tag = 2
        button.addTarget(self, action: #selector(keyPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    let eKeyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemYellow
        button.setTitle("E", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.tag = 3
        button.addTarget(self, action: #selector(keyPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    let fKeyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.setTitle("F", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.tag = 4
        button.addTarget(self, action: #selector(keyPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    let gKeyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemIndigo
        button.setTitle("G", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.tag = 5
        button.addTarget(self, action: #selector(keyPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    let aKeyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemBlue
        button.setTitle("A", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.tag = 6
        button.addTarget(self, action: #selector(keyPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    let bKeyButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemPurple
        button.setTitle("B", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.tag = 7
        button.addTarget(self, action: #selector(keyPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        let stackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [cKeyButton, dKeyButton, eKeyButton, fKeyButton, gKeyButton, aKeyButton, bKeyButton])
            stack.axis = .vertical
            stack.distribution = .fillEqually
            stack.spacing = 8
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        
        view.addSubview(stackView)
         
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 2),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -2),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            
            dKeyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            dKeyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            eKeyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            eKeyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            fKeyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            fKeyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            gKeyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            gKeyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            aKeyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            aKeyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            bKeyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            bKeyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
    }
    
    @objc func keyPressed(_ sender: UIButton) {
        playSound(soundName: sender.currentTitle!)
        print(sender.currentTitle!)
        print("Start")
        sender.alpha = 0.5
         
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            sender.alpha = 1.0
            print("End")
        }
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

#Preview {
    ViewController()
}
