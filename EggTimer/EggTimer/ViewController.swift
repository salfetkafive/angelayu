//
//  ViewController.swift
//  EggTimer
//
//  Created by salfetkafive on 20.09.2024.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let softTime = 5
    let mediumTime = 7
    let hardTime = 12
    
    let eggTimes = ["Soft": 5, "Medium": 7, "Hard": 8]
    
    var totalTime = 60
    var secondsPassed = 0
    
    var timer = Timer()
    var player: AVAudioPlayer!
    
    private let labelTop: UILabel = {
        let label = UILabel()
        label.text = "How do you like your eggs?"
        label.font = UIFont.systemFont(ofSize: 30)
        label.textColor = UIColor(white: 0.33, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var softEggButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Soft", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .black)
        button.setImage(UIImage(named: "soft_egg"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(hardnessSelected(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
     
    
    
    private lazy var mediumEggButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Medium", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .black)
        button.setImage(UIImage(named: "medium_egg"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(hardnessSelected(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var hardEggButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Hard", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .black)
        button.setImage(UIImage(named: "hard_egg"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(hardnessSelected(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let progressBar: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .bar)
        progressView.progress = 0.5
        progressView.progressTintColor = .systemYellow
        progressView.trackTintColor = .systemGray
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
     
    private func setupUI() {
        view.backgroundColor = UIColor(red: 0.8, green: 0.95, blue: 0.99, alpha: 1)
         
        let eggStackView = UIStackView(arrangedSubviews: [softEggButton, mediumEggButton, hardEggButton])
        eggStackView.axis = .horizontal
        eggStackView.distribution = .fillEqually
        eggStackView.spacing = 20
        eggStackView.translatesAutoresizingMaskIntoConstraints = false
         
        let mainStackView = UIStackView(arrangedSubviews: [labelTop, eggStackView, progressBar])
        mainStackView.axis = .vertical
        mainStackView.spacing = 39
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainStackView)
         
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
         
        progressBar.heightAnchor.constraint(equalToConstant: 6).isActive = true
    }
     
    @objc private func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        let hardness = sender.currentTitle!
        
        totalTime = eggTimes[hardness]!
        
        progressBar.progress = 0
        secondsPassed = 0
        labelTop.text = hardness
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @objc func updateCounter() {
        if secondsPassed < totalTime  {
            secondsPassed += 1
            let percentage: Float = Float(secondsPassed) / Float(totalTime)
            
            progressBar.progress = Float(percentage)
            
        } else {
            timer.invalidate()
            labelTop.text = "DONE!"
            playSound(soundName: "alarm_sound")
        }
        
    }
    
    func playSound(soundName: String) {
        let url = Bundle.main.url(forResource: soundName, withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
    
}


#Preview {
    ViewController()
}
