//
//  ConfigViewController.swift
//  aitbus
//
//  Created by ppengotsu on 2016/02/09.
//  Copyright © 2016年 ppengotsu. All rights reserved.

import UIKit


enum ConfigCell: Int {
    case About=0
    case AppWeb
    case AppAsk
    case DataOfficial
    case BusPlace
    case SubmitSNS
}

class ConfigViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    @IBOutlet var baseColletionView:UICollectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        baseColletionView?.backgroundColor = UIColor.init(red: 237.0/255.0, green: 237.0/255.0, blue: 237.0/255.0, alpha: 1.0)
        
        baseColletionView?.delegate =   self
        baseColletionView?.dataSource   =   self
        
        //baseColletionView?.backgroundColor = UIColor.
        
        let nib:UINib = UINib(nibName: "PPConfigCollectionViewCell", bundle: nil)
        baseColletionView?.registerNib(nib,forCellWithReuseIdentifier: "PPConfigCollectionViewCell")
        //baseColletionView?.registerClass(PPConfigCollectionViewCell.self, forCellWithReuseIdentifier: "PPConfigCollectionViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:PPConfigCollectionViewCell  = collectionView.dequeueReusableCellWithReuseIdentifier("PPConfigCollectionViewCell", forIndexPath: indexPath) as! PPConfigCollectionViewCell
        
        let indexRow:ConfigCell? = ConfigCell(rawValue: indexPath.row)
        
        cell.layer.masksToBounds = false
        cell.layer.shadowOpacity = 0.3
        cell.layer.shadowOffset = CGSizeMake(0,5)
        cell.layer.shadowColor = UIColor.blackColor().CGColor
        
        switch indexRow {
        case ConfigCell.About?:
            cell.setDescriptionText(NSLocalizedString("ConfigViewController.Cell.Title.About",comment: ""))
            cell.setIconImageName("config_info")
            cell.setIconImageBackGroudColorMode(CellIconImageBackColor.red)
            break
            
        case ConfigCell.AppWeb?:
            cell.setDescriptionText(NSLocalizedString("ConfigViewController.Cell.Title.AppWeb",comment: ""))
            cell.setIconImageName("config_web")
            cell.setIconImageBackGroudColorMode(CellIconImageBackColor.red)
            break
            
        case ConfigCell.AppAsk?:
            cell.setDescriptionText(NSLocalizedString("ConfigViewController.Cell.Title.AppMail",comment: ""))
            cell.setIconImageName("config_mail")
            cell.setIconImageBackGroudColorMode(CellIconImageBackColor.red)
            break
            
        case ConfigCell.DataOfficial?:
            cell.setDescriptionText(NSLocalizedString("ConfigViewController.Cell.Title.DataWeb",comment: ""))
            cell.setIconImageName("config_web")
            cell.setIconImageBackGroudColorMode(CellIconImageBackColor.green)
            break
            
        case ConfigCell.BusPlace?:
            cell.setDescriptionText(NSLocalizedString("ConfigViewController.Cell.Title.BusPlace",comment: ""))
            cell.setIconImageName("config_pin")
            cell.setIconImageBackGroudColorMode(CellIconImageBackColor.green)
            break
            
        case ConfigCell.SubmitSNS?:
            cell.setDescriptionText(NSLocalizedString("ConfigViewController.Cell.Title.Sns",comment: ""))
            cell.setIconImageName("config_sns")
            cell.setIconImageBackGroudColorMode(CellIconImageBackColor.green)
            break
            
        default:
            cell.setDescriptionText("")
//            cell.setIconImageName(nil)
            cell.setIconImageBackGroudColorMode(CellIconImageBackColor.none)
            break
            
        }
        return cell
        
    }
    
}

