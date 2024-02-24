//
//  ViewController.swift
//  Task8
//
//  Created by pavel mishanin on 24/2/24.
//

import UIKit

final class ViewController: UIViewController, UIScrollViewDelegate {

    private let avatarImageView = UIImageView(image: UIImage(systemName: "person.crop.circle.fill"))
    private let vScrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Avatar"
        
        avatarImageView.tintColor = .systemGray
        avatarImageView.contentMode = .scaleAspectFit
        
        view.addSubview(vScrollView)
        vScrollView.contentSize = CGSize(width: view.frame.width, height: UIScreen.main.bounds.height*1.2)
        
        guard let navigationBar = navigationController?.navigationBar else { return }
        navigationBar.addSubview(avatarImageView)

        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            avatarImageView.rightAnchor.constraint(equalTo: navigationBar.rightAnchor, constant: -16),
            avatarImageView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor, constant: -16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 36),
            avatarImageView.widthAnchor.constraint(equalTo: avatarImageView.heightAnchor)
        ])
        

    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        vScrollView.frame = view.bounds
        
        vScrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        avatarImageView.isHidden = avatarImageView.frame.origin.y - 16 <= 0
    }
}

