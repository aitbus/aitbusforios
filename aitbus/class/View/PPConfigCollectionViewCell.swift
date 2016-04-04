//
//  PPConfigCollectionViewCell.swift
//  aitbus
//
//  Created by ppengotsu on 2016/02/09.
//  Copyright © 2016年 ppengotsu. All rights reserved.
//

import UIKit

@IBDesignable
class PPConfigCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet var baseView:PPConfigCollectionBaseView?
    
    var nibView:UIView? //NIBから読み込んだView
    
    
    //MARK: - 公開
    public func setDescriptionText(text: String){
        baseView?.descriptionLabel!.text = text
    }
    
    public func setIconImageName(iconName:String){
        baseView?.iconImageView!.image = UIImage.init(named: iconName)
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
