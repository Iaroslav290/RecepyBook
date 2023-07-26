//
//  CookingElements.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-08-16.
//

import UIKit


let stepLabel: UILabel = {
   let label = UILabel()
    label.text = "Step "
    label.font = UIFont(name: "JetBrainsMono-Regular", size: 40)
    label.textColor = .white
    label.numberOfLines = 0
    return label
}()

let numberOfStepLabel: UILabel = {
   let label = UILabel()
    label.text = "Step"
    label.font = UIFont(name: "JetBrainsMono-Regular", size: 40)
    label.textColor = .white
    label.numberOfLines = 0
    return label
}()

let whatToDoLabel: UILabel = {
    let label = UILabel()
     label.text = "What to do"
     label.font = UIFont(name: "JetBrainsMono-Regular", size: 30)
     label.textColor = .white
     label.numberOfLines = 0
     return label
 }()

let nextButton: UIButton = {
    let button = UIButton()
    button.setTitle("Next", for: .normal)
    button.backgroundColor = .green
    button.setTitleColor(.black, for: .normal)
    return button
}()

let previousButton: UIButton = {
    let button = UIButton()
    button.setTitle("Previous", for: .normal)
    button.backgroundColor = .yellow
    button.setTitleColor(.black, for: .normal)
    return button
}()


let homeButton: UIButton = {
    let button = UIButton()
    button.setTitle("Home", for: .normal)
    button.backgroundColor = .red
    button.setTitleColor(.black, for: .normal)
    return button
}()


let timeLabel: UILabel = {
    let label = UILabel()
     label.text = "00:00"
     label.font = UIFont(name: "JetBrainsMono-Regular", size: 40)
     label.textColor = .white
     label.numberOfLines = 0
     return label
 }()

let timerLabel: UILabel = {
    let label = UILabel()
     label.text = "Timer"
     label.font = UIFont(name: "JetBrainsMono-Regular", size: 40)
     label.textColor = .white
     label.numberOfLines = 0
     return label
 }()

let startTimerButton: UIButton = {
    let button = UIButton()
    button.setTitle("Start", for: .normal)
    button.backgroundColor = .cyan
    button.setTitleColor(.black, for: .normal)
    return button
}()

let stopTimerButton: UIButton = {
    let button = UIButton()
    button.setTitle("Stop", for: .normal)
    button.backgroundColor = .red
    button.setTitleColor(.black, for: .normal)
    return button
}()

let resetTimerButton: UIButton = {
    let button = UIButton()
    button.setTitle("Reset", for: .normal)
    button.backgroundColor = .orange
    button.setTitleColor(.black, for: .normal)
    return button
}()
