//
//  ViewController.swift
//  AutoSizingTextView
//
//  Created by takeru on 2018/10/16.
//  Copyright © 2018 takeru. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setConstraint()
    }

    private func setupView() {
        textView = UITextView()
        textView.backgroundColor = .lightGray
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.delegate = self
        textView.text = "Type a Message!"
        view.addSubview(textView)
    }

    private func setConstraint() {
        textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        textView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        textView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        textView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textViewDidChange(textView)
    }
}

extension ViewController: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {
        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
}
