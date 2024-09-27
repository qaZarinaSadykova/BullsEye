//
//  LeaderBoardViewController.swift
//  Bullseye
//
//  Created by Zarina Sadykova on 22.09.24.
//
import UIKit
import SnapKit

class LeaderBoardViewController: UIViewController {
    
    let closedButton = UIButton()
    let titleLabel = UILabel()
    let stackView = UIStackView()
    let descriptionStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground // Динамический цвет фона
        setupCloseButton()
        setupTitleLabel()
        setupDescriptionStackView()
        setupPlayerStack()
        makeConstraints()
    }

    func setupCloseButton() {
        closedButton.setBackgroundImage(UIImage(named: "close"), for: .normal)
        closedButton.addTarget(self, action: #selector(returnToMainVC), for: .touchUpInside)
        view.addSubview(closedButton)
    }
    
    func setupTitleLabel() {
        titleLabel.text = "Leaderboard".uppercased()
        titleLabel.font = UIFont.systemFont(ofSize: 27, weight: .heavy)
        titleLabel.textColor = .label // Динамический цвет текста
        view.addSubview(titleLabel)
    }
    
    func setupDescriptionStackView() {
        descriptionStackView.axis = .horizontal
        descriptionStackView.spacing = 20

        let headers = ["", "PLAYER", "SCORE", "ROUNDS", ""]
        
        for text in headers {
            let label = UILabel()
            label.text = text
            label.font = UIFont.boldSystemFont(ofSize: 14)
            label.textAlignment = .center
            label.textColor = .label // Динамический цвет текста
            descriptionStackView.addArrangedSubview(label)
        }

        view.addSubview(descriptionStackView)
        descriptionStackView.distribution = .fillEqually
    }
    
    func setupPlayerStack() {
        stackView.axis = .vertical
        stackView.spacing = 20
        view.addSubview(stackView)
        
        let players = [("DOG", "459", "4"), ("DOG", "459", "4"), ("DOG", "459", "4")]
        for (index, player) in players.enumerated() {
            let playerLabel = createPlayerLabel(place: "\(index + 1)", name: player.0, score: player.1, round: player.2)
            stackView.addArrangedSubview(playerLabel)
        }
    }

    func createPlayerLabel(place: String, name: String, score: String, round: String) -> UIView {
        let label = UIView()
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor(named: "lightlightgray")?.cgColor // Динамический цвет
        label.layer.cornerRadius = 28
        label.translatesAutoresizingMaskIntoConstraints = false
        label.widthAnchor.constraint(equalToConstant: 670).isActive = true
        label.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        let circleView = UIView()
        circleView.layer.cornerRadius = 28
        circleView.layer.borderWidth = 2
        circleView.layer.borderColor = UIColor(named: "lightlightgray")?.cgColor // Динамический цвет
        circleView.backgroundColor = .clear
        circleView.translatesAutoresizingMaskIntoConstraints = false

        let circleNumberLabel = UILabel()
        circleNumberLabel.text = place
        circleNumberLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        circleNumberLabel.textAlignment = .center
        circleNumberLabel.translatesAutoresizingMaskIntoConstraints = false

        circleView.addSubview(circleNumberLabel)
        NSLayoutConstraint.activate([
            circleNumberLabel.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            circleNumberLabel.centerYAnchor.constraint(equalTo: circleView.centerYAnchor)
        ])
        
        let nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy) // Используйте .heavy для более жирного шрифта
        nameLabel.textColor = .label

        let scoreLabel = UILabel()
        scoreLabel.text = score
        scoreLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy) // Используйте .heavy
        scoreLabel.textColor = .label

        let roundLabel = UILabel()
        roundLabel.text = round
        roundLabel.font = UIFont.systemFont(ofSize: 18, weight: .heavy) // Используйте .heavy
        roundLabel.textColor = .label

        let circleStack = UIStackView(arrangedSubviews: [circleView])
        circleStack.axis = .horizontal
        circleStack.alignment = .center

        let horizontalStack = UIStackView(arrangedSubviews: [circleStack, nameLabel, scoreLabel, roundLabel])
        horizontalStack.axis = .horizontal
        horizontalStack.distribution = .equalSpacing
        horizontalStack.alignment = .center
        
        label.addSubview(horizontalStack)
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            horizontalStack.leadingAnchor.constraint(equalTo: label.leadingAnchor),
            horizontalStack.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: -190),
            horizontalStack.topAnchor.constraint(equalTo: label.topAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: label.bottomAnchor)
        ])
        
        circleView.widthAnchor.constraint(equalToConstant: 56).isActive = true
        circleView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        
        // Храним ссылку на circleView для обновления цвета
        label.tag = 1000 // Уникальный тег для поиска
        circleView.tag = 2000 // Уникальный тег для поиска

        return label
    }
    
    func makeConstraints() {
        closedButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(30)
            make.height.equalTo(55.78)
            make.width.equalTo(56)
            make.left.equalToSuperview().offset(689)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(44)
            make.left.equalToSuperview().offset(293)
        }

        descriptionStackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(65)
            make.trailing.equalToSuperview().inset(65)
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(descriptionStackView.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(65)
            make.trailing.equalToSuperview().inset(65)
        }
    }

    @objc func returnToMainVC() {
        self.dismiss(animated: true)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            updateCircleBorderColors()
        }
    }

    func updateCircleBorderColors() {
        for subview in stackView.arrangedSubviews {
            if let label = subview as? UIView {
                if let circleView = label.viewWithTag(2000) { // Найти circleView по тегу
                    circleView.layer.borderColor = UIColor(named: "lightlightgray")?.cgColor // Динамический цвет
                }
                label.layer.borderColor = UIColor(named: "lightlightgray")?.cgColor // Обновляем цвет границы
            }
        }
    }
}
