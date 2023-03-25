//
//  HomeController.swift
//  EassyWorkOut
//
//  Created by jeashan anuja on 2023-03-12.
//

import UIKit

class HomeController: UIViewController {
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let label = UILabel()
    private var isScrollEnabled = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(contentView)
        
        let contentWidth = view.bounds.width
        let contentHeight = 1000.0
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalToConstant: contentWidth),
            contentView.heightAnchor.constraint(equalToConstant: contentHeight)
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Scroll me!"
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        let scrollGesture = UIPanGestureRecognizer(target: self, action: #selector(handleScrollGesture(_:)))
        scrollView.addGestureRecognizer(scrollGesture)
    }
    
    override var canBecomeFirstResponder: Bool {
        return true
    }
    
    override var keyCommands: [UIKeyCommand]? {
        return [
            UIKeyCommand(input: UIKeyCommand.inputUpArrow, modifierFlags: [], action: #selector(enableScroll(_:))),
            UIKeyCommand(input: UIKeyCommand.inputUpArrow, modifierFlags: [], action: #selector(disableScroll(_:)))
        ]
    }
    
    @objc func handleScrollGesture(_ gestureRecognizer: UIPanGestureRecognizer) {
        guard isScrollEnabled else { return }
        
        guard let scrollView = gestureRecognizer.view as? UIScrollView else { return }
        
        let translation = gestureRecognizer.translation(in: scrollView)
        scrollView.contentOffset.y -= translation.y
        gestureRecognizer.setTranslation(.zero, in: scrollView)
    }
    
    @objc func enableScroll(_ sender: UIKeyCommand) {
        isScrollEnabled = true
    }
    
    @objc func disableScroll(_ sender: UIKeyCommand) {
        isScrollEnabled = false
    }
}
