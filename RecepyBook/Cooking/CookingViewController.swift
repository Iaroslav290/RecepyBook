//
//  CookingViewController.swift
//  RecepyBook
//
//  Created by Ярослав Вербило on 2023-08-16.
//

import UIKit
import FirebaseStorage

var numberOfRecept: Int = 0

class CookingViewController: UIViewController {
    
   
    var selectedProduct: Product?
    var isActionInProgress = false
    var buttonEnableTimer: Timer?
    private var remainingTime = 300 // 5 minutes in seconds
    private var timer: Timer?
    
    private var isTimerRunning = false
    private var isTimerPaused = false
    private var buttonTitle: String {
        if isTimerRunning {
            return isTimerPaused ? "Continue" : "Pause"
        } else {
            return "Start"
        }
    }
    private var pausedRemainingTime: Int = 0

    
    init(selectedProduct: Product) {
        self.selectedProduct = selectedProduct
        numberOfRecept = 0

    
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(red: 27/255, green: 34/255, blue: 35/255, alpha: 1)
        configureElements()
        updateUI()
//        startOrResetTimer()
        resetTimer()
        startTimerButton.setTitle(buttonTitle, for: .normal)
    }
    
    
    func configureElements() {
        [stepLabel, numberOfStepLabel, whatToDoLabel, nextButton, previousButton, homeButton, startTimerButton, resetTimerButton, timeLabel, timerLabel].forEach{
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        nextButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
        
        homeButton.addTarget(self, action: #selector(homeAction), for: .touchUpInside)
        
        previousButton.addTarget(self, action: #selector(previousAction), for: .touchUpInside)
        
        startTimerButton.addTarget(self, action: #selector(startButtonPressed), for: .touchUpInside)
        startTimerButton.setTitle(buttonTitle, for: .normal)
        
        resetTimerButton.addTarget(self, action: #selector(resetTimerAction), for: .touchUpInside)
        
        stopTimerButton.isHidden = true
        resetTimerButton.isHidden = true
        
        NSLayoutConstraint.activate([
            
            
            
            
            stepLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stepLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (screenSize.width / 10)),
            
            numberOfStepLabel.leadingAnchor.constraint(equalTo: stepLabel.trailingAnchor, constant: 5),
            numberOfStepLabel.topAnchor.constraint(equalTo: stepLabel.topAnchor),
            
            whatToDoLabel.topAnchor.constraint(equalTo: stepLabel.bottomAnchor, constant: 10),
            whatToDoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: (screenSize.width / 10)),
            whatToDoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -(screenSize.width / 10)),
            
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.heightAnchor.constraint(equalToConstant: 100),
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            nextButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            
            previousButton.widthAnchor.constraint(equalToConstant: 100),
            previousButton.heightAnchor.constraint(equalToConstant: 100),
            previousButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            previousButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30),
            
            homeButton.widthAnchor.constraint(equalToConstant: 50),
            homeButton.heightAnchor.constraint(equalToConstant: 50),
            homeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            homeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            
            startTimerButton.widthAnchor.constraint(equalToConstant: 50),
            startTimerButton.heightAnchor.constraint(equalToConstant: 50),
            startTimerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startTimerButton.bottomAnchor.constraint(equalTo: timerLabel.topAnchor, constant: -30),
            
            
            resetTimerButton.widthAnchor.constraint(equalToConstant: 50),
            resetTimerButton.heightAnchor.constraint(equalToConstant: 50),
            resetTimerButton.leadingAnchor.constraint(equalTo: startTimerButton.trailingAnchor, constant: 16),
            resetTimerButton.topAnchor.constraint(equalTo: startTimerButton.topAnchor, constant: 0),
            
//            stopTimerButton.widthAnchor.constraint(equalToConstant: 50),
//            stopTimerButton.heightAnchor.constraint(equalToConstant: 50),
//            stopTimerButton.topAnchor.constraint(equalTo: startTimerButton.topAnchor),
//            stopTimerButton.leadingAnchor.constraint(equalTo: startTimerButton.leadingAnchor),
            
            timeLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15),
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            timerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timerLabel.bottomAnchor.constraint(equalTo: timeLabel.topAnchor, constant: -15),
            
        ])
    }
    
    
    
    @objc private func startButtonPressed() {
        
        performAction(button: startTimerButton, action: {
            if self.isTimerRunning {
                if self.isTimerPaused {
                    self.continueTimer()
                } else {
                    self.pauseTimer()
                }
            } else {
                self.startTimer()
            }
            

            resetTimerButton.isHidden = false
            startTimerButton.setTitle(self.buttonTitle, for: .normal) // Update button title after the action
                })
        
       
    }
    
    private func pauseTimer() {
        timer?.invalidate()
        isTimerPaused = true
        pausedRemainingTime = remainingTime
    }

    private func continueTimer() {
        isTimerPaused = false
        startTimer()
    }

    
    private func updateTimeLabel() {
        let minutes = remainingTime / 60
        let seconds = remainingTime % 60
        let cookTime = selectedProduct!.cookTimes[numberOfRecept]
        if cookTime == 0 {
            timeLabel.text = ""
            timerLabel.text = ""
            startTimerButton.isHidden = true
            
        } else {
            timeLabel.text = String(format: "%02d:%02d", minutes, seconds)
            timerLabel.text = "Timer"
            startTimerButton.isHidden = false
        }
        
    }
    
    
    private func startTimer() {
        timer?.invalidate()

        if let product = selectedProduct, numberOfRecept < product.cookTimes.count {
            let cookTime = product.cookTimes[numberOfRecept]
            if cookTime == 0 {
                timeLabel.text = "Start"
            } else {
                if !isTimerPaused {
                    remainingTime = pausedRemainingTime > 0 ? pausedRemainingTime : cookTime * 60
                }
                updateTimeLabel()

                timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
                    guard let self = self else { return }
                    if self.isTimerPaused {
                        return
                    }

                    self.remainingTime -= 1

                    if self.remainingTime <= 0 {
                        self.timer?.invalidate()
                        timeLabel.text = "Time's up!"
                    } else {
                        self.updateTimeLabel()
                    }
                }
            }
        }
        isTimerRunning = true
    }


    
    private func resetTimer() {
        timer?.invalidate() // Invalidate the existing timer if any
        if let product = selectedProduct, numberOfRecept < product.cookTimes.count {
            let cookTime = product.cookTimes[numberOfRecept]
            remainingTime = cookTime * 60
        }
        updateTimeLabel()
        isTimerRunning = false
           isTimerPaused = false
        pausedRemainingTime = 0
    }
    
    func updateUI() {
        if let product = selectedProduct {
            numberOfStepLabel.text = "\(numberOfRecept + 1) of \(product.recept.count)"
            whatToDoLabel.text = product.recept[numberOfRecept]
            updateTimeLabel() // Add this line

        }
    }
    
    func performAction(button: UIButton, action: @escaping () -> Void) {
            guard !isActionInProgress else {
                return
            }

            isActionInProgress = true
            button.isEnabled = false

            action()

            buttonEnableTimer?.invalidate()
            buttonEnableTimer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: false) { _ in
                self.isActionInProgress = false
                button.isEnabled = true
            }
        }
    
    @objc func homeAction() {
        
        performAction(button: homeButton, action: {
//                    let homeVC = ContainerViewController()
//            self.navigationController?.setViewControllers([homeVC], animated: true)
            if let containerViewController = self.navigationController?.viewControllers.first(where: { $0 is ContainerViewController }) {
                self.navigationController?.popToViewController(containerViewController, animated: true)
               }
            self.resetTimer()
            self.buttonEnableTimer?.invalidate()
            self.updateUI()
            startTimerButton.setTitle(self.buttonTitle, for: .normal)
                })
    }
        
    
    
    
    @objc func nextAction() {
        
        performAction(button: nextButton, action: { [self] in
                   numberOfRecept += 1
            self.updateUI()
            resetTimer()
            startTimerButton.setTitle(buttonTitle, for: .normal)
            resetTimerButton.isHidden = true

               })
    }
    
    @objc func previousAction() {
        
        performAction(button: previousButton, action: { [self] in
                   numberOfRecept -= 1
            self.updateUI()
            resetTimer()
            startTimerButton.setTitle(buttonTitle, for: .normal)
            resetTimerButton.isHidden = true

               })
    }
    
    @objc func startTimerAction() {
        
        if remainingTime > 0 {
                startTimer()
            }
        
    }
    
    @objc func resetTimerAction() {
        
//        resetTimer()
//        startTimerButton.setTitle(buttonTitle, for: .normal)
//        resetTimerButton.isHidden = true
//        isTimerRunning = false
//        isTimerPaused = false
        
        resetTimer()
        startTimerButton.setTitle(buttonTitle, for: .normal) // Update the button title
        resetTimerButton.isHidden = true

    }
    
    
    

    
    // Invalidate the timer if the view controller is about to be deallocated
    deinit {
//        timer?.invalidate()
        buttonEnableTimer?.invalidate()
    }
    
}
