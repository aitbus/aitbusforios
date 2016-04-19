//
//  ConfigViewController.swift
//  aitbus
//
//  Created by ppengotsu on 2016/02/09.
//  Copyright © 2016年 ppengotsu. All rights reserved.

import UIKit
import SafariServices
import MessageUI

enum ConfigCell: Int {
    case About=0
    case AppWeb
    case AppAsk
    case DataOfficial
    case BusPlace
    case SubmitSNS
}

enum NextUrl:String {
    case About = "https://blog.ppen.info/wp/"
    case AppWeb = "https://blog.ppen.info/wp/?page_id=29"
    case DataOfficialWeb = "https://www.ait.ac.jp/access/yakusa/"

}

    let AskMailAddress = "webmaster.ppen@hotmail.co.jp"
    let AskMailSubject = ""
    let AskMailBody = ""

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
    func collectionView(collectionView:UICollectionView,layout collectionViewLayout:UICollectionViewLayout,sizeForItemAtIndexPath indexPath:NSIndexPath) -> CGSize{
        return CGSize(width: (self.view.frame.width/3-10),height: 135)
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
            
//        case ConfigCell.SubmitSNS?:
//            cell.setDescriptionText(NSLocalizedString("ConfigViewController.Cell.Title.Sns",comment: ""))
//            cell.setIconImageName("config_sns")
//            cell.setIconImageBackGroudColorMode(CellIconImageBackColor.green)
//            break
            
        default:
            cell.setDescriptionText("")
//            cell.setIconImageName(nil)
            cell.setIconImageBackGroudColorMode(CellIconImageBackColor.none)
            break
            
        }
        return cell
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let indexRow:ConfigCell? = ConfigCell(rawValue: indexPath.row)
        
        switch indexRow {
        case ConfigCell.About?:
            let safariViewController = SFSafariViewController(URL: NSURL(string: NextUrl.About.rawValue)!)
            self.presentViewController(safariViewController, animated: true, completion: nil)
            break
            
        case ConfigCell.AppWeb?:
            let safariViewController = SFSafariViewController(URL: NSURL(string: NextUrl.AppWeb.rawValue)!)
            self.presentViewController(safariViewController, animated: true, completion: nil)
            break
            
        case ConfigCell.AppAsk?:
            if MFMailComposeViewController.canSendMail() == false {
                //メールを送る設定ができなてない時
                let alertController = UIAlertController(title: "メール設定がしてありません。", message: "メールの設定してください", preferredStyle: .Alert)
                let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                alertController.addAction(defaultAction)
                
                self.presentViewController(alertController, animated: true, completion: nil)
                return
            }
            
            let mailViewController = MFMailComposeViewController()
            mailViewController.setSubject(AskMailSubject)
            mailViewController.setToRecipients([AskMailAddress])
            mailViewController.setMessageBody(AskMailBody, isHTML: false)
            self.presentViewController(mailViewController, animated: true, completion: nil)
            
            break
            
        case ConfigCell.DataOfficial?:
            let safariViewController = SFSafariViewController(URL: NSURL(string: NextUrl.DataOfficialWeb.rawValue)!)
            self.presentViewController(safariViewController, animated: true, completion: nil)
            break
            
        case ConfigCell.BusPlace?:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mainVC = storyboard.instantiateViewControllerWithIdentifier("PPMapViewController") as! PPMapViewController
            self.navigationController?.pushViewController(mainVC, animated: true)
            break
            
        case ConfigCell.SubmitSNS?:

            break
            
        default:

            break
            

        }

    }
    
}

