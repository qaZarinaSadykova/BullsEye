//
//  ViewController.swift
//  Bullseye
//
//  Created by Zarina Sadykova on 16.09.24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    let gameManager = BullseyeGameManager()
    let maxRounds = 11
    let titleLabel = UILabel()
    let guessingNumberLabel = UILabel()
    let slider = CustomSlider()
    let oneNumberLabel = UILabel()
    let hundredNumberLabel = UILabel()
    let hitMeButton = UIButton()
    let backgraundImage = UIImageView(frame: UIScreen.main.bounds)
    let scoreLabel = UILabel()
    let scoreTextLabel = UILabel()
    let roundLabel = UILabel()
    let roundTextLabel = UILabel()
    let burgerButton = UIButton()
    let stripe1 = UIView()
    let stripe2 = UIView()
    let stripe3 = UIView()
    
    func setupBackgraund() {
        backgraundImage.image = UIImage(named: "background")
        backgraundImage.contentMode = .scaleAspectFit
        self.view.insertSubview(backgraundImage, at: 0)
    }
    
    func setupTitleLabel() {
        titleLabel.text = "Put the BullSEye as close as you can to".uppercased()
        titleLabel.font = .systemFont(ofSize: 14, weight: .bold)
    }
    
    func setupGuessingNumberLabel() {
        guessingNumberLabel.text = "\(gameManager.guessingNumberLabel)"
        guessingNumberLabel.font = .systemFont(ofSize: 36, weight: .bold)
    }
    
    func setupSlider() {
            slider.minimumValue = 1
            slider.maximumValue = 100
            slider.setThumbImage(UIImage(named: "Target"), for: .normal)
            slider.minimumTrackTintColor = UIColor(named: "redSpace")
            slider.maximumTrackTintColor = UIColor(named: "lightlifgh")
        }
    
    func setupOneNumberLabel() {
        oneNumberLabel.text = "1"
        oneNumberLabel.font = .systemFont(ofSize: 18, weight: .medium)
    }
    
    func setupHundredNumberLabel() {
        hundredNumberLabel.text = "100"
        hundredNumberLabel.font = .systemFont(ofSize: 18, weight: .medium)
    }
    
    func setupHitMeButton() {
        let attributedTitle = NSAttributedString(string: "HIT ME", attributes: [
            .font: UIFont.systemFont(ofSize: 21, weight: .bold),
            .kern: 1.0,
            .foregroundColor: UIColor.white
        ])
        hitMeButton.setAttributedTitle(attributedTitle, for: .normal)
        hitMeButton.backgroundColor = UIColor(named: "blueButton")
        hitMeButton.layer.cornerRadius = 21
        hitMeButton.layer.borderWidth = 3
        hitMeButton.layer.borderColor = UIColor.white.cgColor
        hitMeButton.addTarget(self, action: #selector(handleHitMeButtonAction), for: .touchUpInside)
    }
    
    func setupScore() {
        scoreLabel.text = "\(gameManager.score)"
        scoreLabel.backgroundColor = .clear
        scoreLabel.layer.cornerRadius = 21
        scoreLabel.layer.borderWidth = 2
        scoreLabel.layer.borderColor = UIColor(named: "lightlifgh")?.cgColor
        scoreLabel.textAlignment = .center
    }

    func setupScoreText() {
        scoreTextLabel.text = "SCORE"
        scoreTextLabel.font = .systemFont(ofSize: 18, weight: .bold)
        scoreTextLabel.textAlignment = .center
    }
    
    func setupRound() {
        roundLabel.text = "\(gameManager.round)"
        roundLabel.backgroundColor = .clear
        roundLabel.layer.cornerRadius = 21
        roundLabel.layer.borderWidth = 2
        roundLabel.layer.borderColor = UIColor(named: "lightlifgh")?.cgColor
        roundLabel.textAlignment = .center
    }
    
    func setupRoundText() {
        roundTextLabel.text = "ROUND"
        roundTextLabel.font = .systemFont(ofSize: 18, weight: .bold)
        roundTextLabel.textAlignment = .center
    }
    func setupBurgerButton() {
        burgerButton.setBackgroundImage(UIImage(named: "burger"), for: .normal)
        burgerButton.addTarget(self, action: #selector(showLeaderBoardViewController), for: .touchUpInside)
        

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(titleLabel)
        view.addSubview(guessingNumberLabel)
        view.addSubview(slider)
        view.addSubview(oneNumberLabel)
        view.addSubview(hundredNumberLabel)
        view.addSubview(hitMeButton)
        view.addSubview(backgraundImage)
        view.addSubview(scoreLabel)
        view.addSubview(scoreTextLabel)
        view.addSubview(roundLabel)
        view.addSubview(roundTextLabel)
        view.addSubview(burgerButton)
        
        setupTitleLabel()
        setupGuessingNumberLabel()
        setupSlider()
        setupOneNumberLabel()
        setupHundredNumberLabel()
        setupHitMeButton()
        setupBackgraund()
        setupScore()
        setupScoreText()
        setupRound()
        setupRoundText()
        setupBurgerButton()
        makeConstraints()
        
        slider.value = (slider.minimumValue + slider.maximumValue) / 2
    }

    func makeConstraints() {
        // MARK: - Constraints
        /// Use `snp` to set constraints
        /// In SnapKit translatesAutoresizingMaskIntoConstraints automatically is false
        /// In SnapKit `isActive` always true
        ///
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }

        guessingNumberLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(9)
            make.centerX.equalToSuperview()
        }

        oneNumberLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(90)
            make.width.equalTo(10)
            make.height.equalTo(21)
        }

        slider.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.width.equalTo(496.32)
            make.height.equalTo(10)
        }

        hundredNumberLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.width.equalTo(34)
            make.height.equalTo(21)
            make.left.equalToSuperview().offset(701)
        }

        hitMeButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.width.equalTo(128)
            make.height.equalTo(68.59)
            make.top.equalToSuperview().offset(258)
        }

        scoreLabel.snp.makeConstraints { make in
            make.width.equalTo(68)
            make.height.equalTo(55.78)
            make.top.equalToSuperview().offset(274)
            make.centerX.equalTo(oneNumberLabel.snp.centerX)
        }

        scoreTextLabel.snp.makeConstraints { make in
            make.bottom.equalTo(scoreLabel.snp.top).offset(-5)
            make.centerX.equalTo(scoreLabel.snp.centerX)
        }

        roundLabel.snp.makeConstraints { make in
            make.width.equalTo(68)
            make.height.equalTo(55.78)
            make.top.equalToSuperview().offset(274)
            make.centerX.equalTo(hundredNumberLabel.snp.centerX)
        }

        roundTextLabel.snp.makeConstraints { make in
            make.bottom.equalTo(roundLabel.snp.top).offset(-5)
            make.centerX.equalTo(roundLabel.snp.centerX)
        }

        burgerButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.left.equalToSuperview().offset(689)
            make.height.equalTo(55.78)
            make.width.equalTo(56)
        }
            
    }

    func showAlertSuccess(sliderValue: Int) {
        let myAlert = UIAlertController(title: "You guessed the number", message: "Congratulations! You selected \(sliderValue)", preferredStyle: .alert)
        let handler: ((UIAlertAction) -> Void)? = { action in
            self.gameManager.didWintheGame()
            self.updateLabels()
        }
        let action = UIAlertAction(title: "Continue", style: .default, handler: handler)
        myAlert.addAction(action)
        present(myAlert, animated: true, completion: nil)
    }

    func showAlertFailure(sliderValue: Int) {
        let myAlert = UIAlertController(title: "You didn't guess the number", message: "You selected \(sliderValue). Please, try again", preferredStyle: .alert)
        let handler: ((UIAlertAction) -> Void)? = { action in
            self.gameManager.didNotWintheGame()
            if self.gameManager.round < self.maxRounds {
                self.updateLabels()
            } else {
                self.gameManager.resetGame()
                self.showGameOverAlert()
            }
        }
        let action = UIAlertAction(title: "Continue", style: .default, handler: handler)
        myAlert.addAction(action)
        present(myAlert, animated: true, completion: nil)
    }

       func updateLabels() {
           guessingNumberLabel.text = String(gameManager.guessingNumberLabel)
           scoreLabel.text = "\(gameManager.score)"
           roundLabel.text = "\(gameManager.round)"
       }

    @objc func handleHitMeButtonAction() {
        let sliderValue = Int(slider.value)

        if sliderValue == gameManager.guessingNumberLabel {
            showAlertSuccess(sliderValue: sliderValue)
        } else {
            showAlertFailure(sliderValue: sliderValue)
        }
    }

       func showGameOverAlert() {
           let alert = UIAlertController(title: "Game Over", message: "You've completed 10 rounds!", preferredStyle: .alert)
           let action = UIAlertAction(title: "Restart", style: .default) { _ in
               self.gameManager.resetGame()
               self.updateLabels()
           }
           alert.addAction(action)
           present(alert, animated: true, completion: nil)
       }
    
    @objc func showLeaderBoardViewController() {
            let vc = LeaderBoardViewController()
            let nc = UINavigationController(rootViewController: vc)
            nc.modalPresentationStyle = .fullScreen
            present(nc, animated: true)
        }
   }
