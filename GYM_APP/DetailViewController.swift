//
//  DetailViewController.swift
//  GYM_APP
//
//  Created by Divya Sood on 5/8/19.
//  Copyright © 2019 Divya Sood. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var passedData = (title: "Name", img: #imageLiteral(resourceName: "Image1"), price: 0)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        
        setupViews()

        // Do any additional setup after loading the view.
    }
    func setupViews(){
        self.view.addSubview(myScrollView)
        myScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive=true
        myScrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive=true
        myScrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive=true
        myScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive=true
        myScrollView.contentSize.height = 800
        
        myScrollView.addSubview(containerView)
        containerView.centerXAnchor.constraint(equalTo: myScrollView.centerXAnchor).isActive=true
        containerView.topAnchor.constraint(equalTo: myScrollView.topAnchor).isActive=true
        containerView.widthAnchor.constraint(equalTo: myScrollView.widthAnchor).isActive=true
        containerView.bottomAnchor.constraint(equalTo: myScrollView.bottomAnchor).isActive=true
        
        containerView.addSubview(imgView)
        imgView.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive=true
        imgView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive=true
        imgView.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive=true
        imgView.heightAnchor.constraint(equalToConstant: 200).isActive=true
        imgView.image = passedData.img
        
        containerView.addSubview(lblTitle)
        lblTitle.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 15).isActive=true
        lblTitle.topAnchor.constraint(equalTo: imgView.bottomAnchor).isActive=true
        lblTitle.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -15).isActive=true
        lblTitle.heightAnchor.constraint(equalToConstant: 50).isActive=true
        lblTitle.text = passedData.title
        
        containerView.addSubview(lblPrice)
        lblPrice.leftAnchor.constraint(equalTo: lblTitle.leftAnchor).isActive=true
        lblPrice.topAnchor.constraint(equalTo: lblTitle.bottomAnchor).isActive=true
        lblPrice.rightAnchor.constraint(equalTo: lblTitle.leftAnchor).isActive=true
        lblPrice.heightAnchor.constraint(equalToConstant: 40).isActive=true
        lblPrice.text = "$\(passedData.price)"
        
        containerView.addSubview(lblDescription)
        lblDescription.leftAnchor.constraint(equalTo: lblTitle.leftAnchor).isActive=true
        lblDescription.topAnchor.constraint(equalTo: lblPrice.bottomAnchor, constant: 10).isActive=true
        lblDescription.rightAnchor.constraint(equalTo: lblTitle.rightAnchor).isActive=true
        lblDescription.text = "\"Enjoy all the fitness classes you love, without the fitness studio price. Led by amazing instructors, our welcoming GX24 classes will challenge you to move smarter, push harder and show up inspired day after day. And, with everything from cardio and Zumba to BODYPUMP and yoga, it’s easy to find the class that fits you—right in your local 24 Hour Fitness club.\""
        lblDescription.sizeToFit()
    }
    
    let myScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints=false
        scrollView.showsVerticalScrollIndicator=false
        scrollView.showsHorizontalScrollIndicator=false
        return scrollView
    }()
    
    let containerView: UIView = {
        let v=UIView()
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    let imgView: UIImageView = {
        let v=UIImageView()
        v.image = #imageLiteral(resourceName: "Image1")
        v.contentMode = .scaleAspectFill
        v.clipsToBounds=true
        v.translatesAutoresizingMaskIntoConstraints=false
        return v
    }()
    
    let lblTitle: UILabel = {
        let lbl=UILabel()
        lbl.text = "Name"
        lbl.font=UIFont.systemFont(ofSize: 20)
        lbl.textColor = UIColor.black
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let lblPrice: UILabel = {
        let lbl=UILabel()
        lbl.text = "Price"
        lbl.font=UIFont.boldSystemFont(ofSize: 24)
        lbl.textColor = UIColor(white: 0.5, alpha: 1)
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
    let lblDescription: UILabel = {
        let lbl=UILabel()
        lbl.text = "Description"
        lbl.numberOfLines = 0
        lbl.font=UIFont.systemFont(ofSize: 20)
        lbl.textColor = UIColor.gray
        lbl.translatesAutoresizingMaskIntoConstraints=false
        return lbl
    }()
    
}
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


