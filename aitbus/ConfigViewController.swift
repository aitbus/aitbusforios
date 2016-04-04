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
        
        
        baseColletionView?.delegate =   self
        baseColletionView?.dataSource   =   self
        
        //baseColletionView?.backgroundColor = UIColor.
        
        baseColletionView?.registerClass(PPConfigCollectionViewCell.self, forCellWithReuseIdentifier: "PPConfigCollectionViewCell")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:PPConfigCollectionViewCell  = collectionView.dequeueReusableCellWithReuseIdentifier("PPConfigCollectionViewCell", forIndexPath: indexPath) as! PPConfigCollectionViewCell
        
        let indexRow:ConfigCell? = ConfigCell(rawValue: indexPath.row)
        
        
        
        switch indexRow {
        case ConfigCell.About?:
            cell.setIconImageName("config_info")
            break
            
        case ConfigCell.AppWeb?:
            break
            
        case ConfigCell.AppAsk?:
            break
            
        case ConfigCell.DataOfficial?:
            break
            
        case ConfigCell.BusPlace?:
            break
            
        case ConfigCell.SubmitSNS?:
            break
            
        default: break
            
        }
        
        return cell
        
    }
    
}

