//
//  CustomCardView.swift
//  AppMusic
//
//  Created by Jadiê on 15/04/23.
//

import UIKit

enum ViewModel {
    case full
    case card
}

class CustomCardView: UIView {
    
    var vmodel: ViewModel?
    var dataModel: CardViewModel?
    var containerLeadingConstraints: NSLayoutConstraint?
    var containerTrailingConstraints: NSLayoutConstraint?
    var containerTopConstraints: NSLayoutConstraint?
    var containerBottomConstraints: NSLayoutConstraint?
    
    lazy var cardContainerView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.clipsToBounds = true
        v.layer.cornerRadius = 30
        v.layer.shadowOpacity = 1
        v.layer.shadowOffset = CGSize(width: 0, height: -2)
        v.layer.shadowRadius = 20
        return v
    }()
    
    lazy var cardImage: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .black
        return img
    }()
    
    lazy var overlayView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        return v
    }()
    
    lazy var profileBorderView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .clear
        v.layer.borderWidth = 1
        v.layer.borderColor = UIColor.white.cgColor
        v.layer.cornerRadius = 25
        return v
    }()
    
    lazy var cardProfilePicture: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.backgroundColor = .black
        img.clipsToBounds = true
        img.layer.cornerRadius = 20
        return img
    }()
    
    lazy var addProfileImageButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .white
        btn.setBackgroundImage(UIImage(named: "plus"), for: .normal)
        btn.layer.cornerRadius = 10
        return btn
    }()
    
    lazy var cardCategoryTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    lazy var cardCategoryDateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 11, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    lazy var cardTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 31, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    lazy var likeAndTimeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    init(viewModel: ViewModel, cardData:CardViewModel) {
        let frame = CGRect.zero
        self.vmodel = viewModel
        self.dataModel = cardData
        super.init(frame: frame)
        self.addSubViews()
        self.setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubViews() {
        self.addSubview(self.cardContainerView)
        self.cardContainerView.addSubview(self.cardImage)
        self.cardContainerView.addSubview(self.overlayView)
        self.cardContainerView.addSubview(self.profileBorderView)
        self.cardContainerView.addSubview(self.cardProfilePicture)
        self.cardContainerView.addSubview(self.addProfileImageButton)
        self.cardContainerView.addSubview(self.cardCategoryTitleLabel)
        self.cardContainerView.addSubview(self.cardCategoryDateLabel)
        self.cardContainerView.addSubview(self.cardTitleLabel)
        self.cardContainerView.addSubview(self.descriptionTitleLabel)
        
        self.updateLayout(for: self.vmodel ?? .card)
    }
    
    private func setUpConstraints() {
        self.containerLeadingConstraints = cardContainerView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30)
        self.containerTrailingConstraints = cardContainerView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30)
        self.containerTopConstraints = cardContainerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15)
        self.containerBottomConstraints = cardContainerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15)
        
        self.containerLeadingConstraints?.isActive = true
        self.containerTrailingConstraints?.isActive = true
        self.containerTopConstraints?.isActive = true
        self.containerBottomConstraints?.isActive = true
        
        NSLayoutConstraint.activate([
            self.profileBorderView.topAnchor.constraint(equalTo: self.cardContainerView.topAnchor, constant: 60),
            self.profileBorderView.centerXAnchor.constraint(equalTo: cardContainerView.centerXAnchor),
            self.profileBorderView.widthAnchor.constraint(equalToConstant: 50),
            self.profileBorderView.heightAnchor.constraint(equalToConstant: 50),
            
            self.addProfileImageButton.trailingAnchor.constraint(equalTo: self.profileBorderView.trailingAnchor, constant: 4),
            self.addProfileImageButton.bottomAnchor.constraint(equalTo: self.profileBorderView.bottomAnchor, constant: 4),
            self.addProfileImageButton.widthAnchor.constraint(equalToConstant: 20),
            self.addProfileImageButton.heightAnchor.constraint(equalToConstant: 20),
            
            self.cardProfilePicture.centerXAnchor.constraint(equalTo: self.profileBorderView.centerXAnchor),
            self.cardProfilePicture.centerYAnchor.constraint(equalTo: self.profileBorderView.centerYAnchor),
            self.cardProfilePicture.widthAnchor.constraint(equalToConstant: 40),
            self.cardProfilePicture.heightAnchor.constraint(equalToConstant: 40),
            
            self.cardCategoryTitleLabel.topAnchor.constraint(equalTo: self.profileBorderView.bottomAnchor, constant: 10),
            self.cardCategoryTitleLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
            
            self.cardCategoryDateLabel.topAnchor.constraint(equalTo: self.cardCategoryTitleLabel.bottomAnchor, constant: 2),
            self.cardCategoryDateLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
            
            self.cardTitleLabel.topAnchor.constraint(equalTo: self.cardCategoryDateLabel.bottomAnchor, constant: 20),
            self.cardTitleLabel.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 20),
            self.cardTitleLabel.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -20),
            
            self.likeAndTimeLabel.topAnchor.constraint(equalTo: self.cardTitleLabel.bottomAnchor, constant: 20),
            self.likeAndTimeLabel.centerXAnchor.constraint(equalTo: self.cardContainerView.centerXAnchor),
            
            self.descriptionTitleLabel.topAnchor.constraint(equalTo: self.likeAndTimeLabel.bottomAnchor, constant: 30),
            self.descriptionTitleLabel.leadingAnchor.constraint(equalTo: self.cardContainerView.leadingAnchor, constant: 40),
            self.descriptionTitleLabel.trailingAnchor.constraint(equalTo: self.cardContainerView.trailingAnchor, constant: -40)

        ])
    }
    
    private func updateLayout(for mode: ViewModel) {
        if mode == .full {
            self.containerLeadingConstraints?.constant = 0
            self.containerTrailingConstraints?.constant = 0
            self.containerTopConstraints?.constant = 0
            self.containerBottomConstraints?.constant = 0
            self.descriptionTitleLabel.isHidden = false
        }else {
            self.containerLeadingConstraints?.constant = 30
            self.containerTrailingConstraints?.constant = -30
            self.containerTopConstraints?.constant = 15
            self.containerBottomConstraints?.constant = -15
            self.descriptionTitleLabel.isHidden = true
        }
    }
    
    
    public func setupView(data: CardViewModel) {
        self.cardCategoryTitleLabel.text = data.categoryName
        self.cardCategoryDateLabel.text = data.categoryDate
        self.cardTitleLabel.text = data.cardTitle
        self.likeAndTimeLabel.attributedText = NSAttributedString.featureText(data.likeCount ?? "", data.duration ?? "")
        self.descriptionTitleLabel.text = data.cardDescription
        self.cardImage.image = UIImage(named: data.cardImage ?? "")
        self.cardProfilePicture.image = UIImage(named: data.categoryImage ?? "")
    }
}
