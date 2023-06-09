//
//  ViewController.swift
//  MusicScreen
//
//  Created by Владимир Красный on 10.05.2023.
//

import UIKit

class ViewController: UIViewController {
    //CaseIterable - протокол, который автоматически генерирует свойство массива всех случаев в перечислении
    //CaseIterableи во время компиляции Swift автоматически сгенерирует allCasesсвойство, которое представляет собой массив всех случаев вашего перечисления в том порядке, в котором вы их определили.
    enum MyColors: CaseIterable {
        case red, green, blue, yellow, purple, orange
        
        var uiColor: UIColor {
               switch self {
               case .red:
                   return UIColor.red
               case .green:
                   return UIColor.green
               case .blue:
                   return UIColor.blue
               case .yellow:
                   return UIColor.yellow
               case .purple:
                   return UIColor.purple
               case .orange:
                   return UIColor.orange
               }
           }
    }
    
    private let myView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        myView.backgroundColor = UIColor(red: 19/255.0, green: 38/255.0, blue: 61/255.0, alpha: 1.0)
        return myView
    }()
    
    private let photoView: UIImageView = {
        let photoView = UIImageView()
        photoView.translatesAutoresizingMaskIntoConstraints = false
        photoView.image = UIImage(named: "m1000x1000.jpeg")
        return photoView
    }()
    
    private let labelBigView: UILabel = {
        let labelBigView = UILabel()
        labelBigView.translatesAutoresizingMaskIntoConstraints = false
        labelBigView.text = "Summer Bustle"
        labelBigView.textColor = .white
        labelBigView.font = labelBigView.font.withSize(20)
        return labelBigView
    }()
    
    private let subTitleSmallView: UILabel = {
        let subTitleSmallView = UILabel()
        subTitleSmallView.translatesAutoresizingMaskIntoConstraints = false
        subTitleSmallView.text = "Frances The Mute"
        subTitleSmallView.textColor = UIColor(red: 159/255.0, green: 175/255.0, blue: 193/255.0, alpha: 1.0)
        subTitleSmallView.font = subTitleSmallView.font.withSize(8)
        return subTitleSmallView
    }()
    
    private let myImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(myView)
        myView.addSubview(photoView)
        myView.addSubview(labelBigView)
        myView.addSubview(subTitleSmallView)
        
        myImageView.image = UIImage(systemName: "plus.circle")
        myImageView.tintColor = .white
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action:#selector(imageTapped(tapGestureRecognizer:)))
        myImageView.isUserInteractionEnabled = true
        myImageView.addGestureRecognizer(tapGestureRecognizer)
        
        myView.addSubview(myImageView)
        addConstraint()
        
        //использовать UIPicker
        
    }
    private func addConstraint() {
        var constraint = [NSLayoutConstraint]()
        //Базовый ограничения
        constraint.append(myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraint.append(myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraint.append(myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraint.append(myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        //PHOTO
        constraint.append(photoView.widthAnchor.constraint(equalTo: myView.widthAnchor,multiplier: 0.65))
        constraint.append(photoView.heightAnchor.constraint(equalTo: myView.heightAnchor,multiplier: 0.35))
        //CENTERING THE ELEMENTS
        constraint.append(photoView.centerYAnchor.constraint(equalTo: myView.centerYAnchor))
        constraint.append(photoView.centerXAnchor.constraint(equalTo: myView.centerXAnchor))
        //LABEL
        constraint.append(labelBigView.bottomAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 30))
        constraint.append(labelBigView.leadingAnchor.constraint(equalTo: photoView.leadingAnchor))
        //SUBTITLE
        constraint.append(subTitleSmallView.bottomAnchor.constraint(equalTo: labelBigView.bottomAnchor, constant: 8))
        constraint.append(subTitleSmallView.leadingAnchor.constraint(equalTo: photoView.leadingAnchor))
        //CIRCLE
        constraint.append(myImageView.bottomAnchor.constraint(equalTo: photoView.bottomAnchor, constant: 40))
        constraint.append(myImageView.trailingAnchor.constraint(equalTo: photoView.trailingAnchor))
        
        //Activate
        NSLayoutConstraint.activate(constraint)
    }

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let randomColor = MyColors.allCases.randomElement()?.uiColor ?? .white
        myView.backgroundColor = randomColor
    }
}
