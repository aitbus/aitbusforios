//
//  PPConfigCollectionViewCell.swift
//  aitbus
//
//  Created by ppengotsu on 2016/02/09.
//  Copyright © 2016年 ppengotsu. All rights reserved.
//

import UIKit
enum CellIconImageBackColor: Int {
    case red=0
    case green
    case none

}


@IBDesignable
class PPConfigCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var baseView:PPConfigCollectionBaseView?
    
    var nibView:UIView? //NIBから読み込んだView
    
    
    //MARK: - 公開
    internal func setDescriptionText(text: String){
        baseView?.descriptionLabel!.text = text
    }
    
    internal func setIconImageName(iconName:String){
        baseView?.iconImageView?.hidden = false
        baseView?.iconImageView!.image = UIImage.init(named: iconName)
    }
    
    internal func setIconImageBackGroudColorMode(iconBackColor:CellIconImageBackColor){
        switch iconBackColor {
        case CellIconImageBackColor.red:
            baseView?.iconBaseView!.backgroundColor = UIColor.init(red: 255.0/255.0, green: 213.0/255.0, blue: 223.0/255.0, alpha: 1.0)
            break
        case CellIconImageBackColor.green:
            baseView?.iconBaseView!.backgroundColor = UIColor.init(red: 226.0/255.0, green: 245.0/255.0, blue: 239.0/255.0, alpha: 1.0)
            break
        case CellIconImageBackColor.none:
            baseView?.iconBaseView!.backgroundColor = UIColor.init(red: 242.0/255.0, green: 242.0/255.0, blue: 242.0/255.0, alpha: 1.0)
            break
        }
    }
    
    
    
    //MARK: - 非公開
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    /**
     コードから初期化された呼ばれる
     
     - parameter frame:
     
     - returns:
     */
    override init(frame: CGRect) {
        super.init(frame: frame)
        
         commonInit()
        
    }
    
    /**
     StoryBoardとXIBから初期化するとこれが呼ばれる
    
     - parameter aDecoder:
     
     - returns:
     */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
         commonInit()
    }
    
    
    
    /**
     共通の初期化
     */
    private func commonInit(){
//        let bundle = NSBundle(forClass: self.dynamicType)
//        let nib = UINib(nibName: "PPConfigCollectionViewCell", bundle: bundle)
//        nibView = nib.instantiateWithOwner(self, options: nil).first as? UIView
//        
//        addSubview(nibView!)


    }
    

    
}
