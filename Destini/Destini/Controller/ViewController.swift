//
//  ViewController.swift
//  Destini
//
//  Created by salfetkafive on 27.09.2024.
//

import UIKit

class ViewController: UIViewController {
     
    private var storyBrain = StoryBrain()
    private var views = View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        views.frame = UIScreen.main.bounds
        view.addSubview(views)
        updateUI()
        views.choice1Button.addTarget(self, action: #selector(choiceMade(_:)), for: .touchUpInside)
        views.choice2Button.addTarget(self, action: #selector(choiceMade(_:)), for: .touchUpInside)
    }
    
    
    
    @objc private func choiceMade(_ sender: UIButton) {
        storyBrain.nextStory(userChoice: sender.currentTitle!)
        updateUI()
    }
    
    
    private func updateUI() {
        views.storyLabel.text = storyBrain.getStoryTitle()
        views.choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        views.choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
    }
}
