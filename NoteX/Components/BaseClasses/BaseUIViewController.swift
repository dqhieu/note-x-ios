//
//  BaseUIViewController.swift
//  NoteX
//
//  Created by Dinh Quang Hieu on 5/29/18.
//  Copyright © 2018 Dinh Quang Hieu. All rights reserved.
//

import UIKit

class BaseUIViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboardNotifications()
        setupViews()
        setupSelectors()
        setupLayouts()
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    
    public func setupViews() {
        self.view.backgroundColor = UIColor.white
    }
    
    public func setupSelectors() {
        
    }
    
    public func setupLayouts() {
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.setupLayouts()
    }

    @objc public func didTapBack() {
        self.view.endEditing(true)
        self.navigationController?.popViewController(animated: true)
    }
    
    private func setupKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardWillShow(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    private func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    @objc func onKeyboardWillShow(notification: NSNotification) {
        
    }
    
    @objc func onKeyboardWillHide() {
        
    }
    
    public func isModal() -> Bool {
        if self.presentingViewController != nil {
            return true
        }
        if self.navigationController?.presentingViewController?.presentedViewController == self.navigationController {
            return true
        }
        if self.tabBarController?.presentingViewController is UITabBarController {
            return true
        }
        
        return false
    }
    
    func dismiss(completion: (() -> Void)?) {
        if isModal() {
            self.dismiss(animated: true, completion: completion)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    public func setupNavigationBar(
        title: String? = nil,
        
        leftBarButtonItem: UIBarButtonItem? = nil,
        leftText: String? = nil,
        leftImage: UIImage? = nil,
        leftSelector: Selector? = nil,
        
        rightBarButtonItem: UIBarButtonItem? = nil,
        rightText: String? = nil,
        rightImage: UIImage? = nil,
        rightSelector: Selector? = nil,
        
        isDarkBackground: Bool? = false,
        isTransparent: Bool? = false
        ) {
        self.navigationItem.hidesBackButton = true
        
        let textColor = isDarkBackground! ? UIColor.white : UIColor.black
        
        let textAttributes : [NSAttributedStringKey : Any] = [NSAttributedStringKey.foregroundColor: textColor, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20)]
        
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        if let title = title {
            let titleLabel = UILabel()
            titleLabel.attributedText = NSAttributedString(string: title, attributes: textAttributes)
            titleLabel.sizeToFit()
            self.navigationItem.titleView = titleLabel
            self.navigationController?.isNavigationBarHidden = false
        } else {
            self.navigationController?.isNavigationBarHidden = false
        }
        
        if leftBarButtonItem != nil {
            self.navigationItem.leftBarButtonItem = leftBarButtonItem
        } else if leftImage != nil && leftSelector != nil {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftImage, style: UIBarButtonItemStyle.plain, target: self, action: leftSelector!)
        } else if leftText != nil && leftSelector != nil {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: leftText, style: UIBarButtonItemStyle.plain, target: self, action: leftSelector!)
            self.navigationItem.leftBarButtonItem?.tintColor = UIColor.black
            
            self.navigationItem.leftBarButtonItem?.setTitleTextAttributes(textAttributes, for: UIControlState.normal)
        }
        
        // Right
        if rightBarButtonItem != nil {
            self.navigationItem.rightBarButtonItem = rightBarButtonItem
        } else if rightImage != nil && rightSelector != nil {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: rightImage, style: UIBarButtonItemStyle.plain, target: self, action: rightSelector!)
        } else if rightText != nil && rightSelector != nil {
            self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: rightText, style: UIBarButtonItemStyle.plain, target: self, action: rightSelector!)
            self.navigationItem.rightBarButtonItem?.tintColor = UIColor.black
            
            self.navigationItem.rightBarButtonItem?.setTitleTextAttributes(textAttributes, for: UIControlState.normal)
        }
        
        if (isTransparent != nil) && isTransparent! == true {
            self.navigationController?.navigationBar.isTranslucent = true
            self.navigationController?.navigationBar.setBackgroundImage(UIImage.fromColor(color: UIColor.clear), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage.fromColor(color: UIColor.clear)
        } else {
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.setBackgroundImage(UIImage.fromColor(color: UIColor.clear), for: UIBarMetrics.default)
            self.navigationController?.navigationBar.shadowImage = UIImage.fromColor(color: UIColor.clear)
        }
    }
}
