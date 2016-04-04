//
//  PPConfigCollectionBaseView.swift
//  aitbus
//
//  Created by ppengotsu on 2016/03/01.
//  Copyright © 2016年 ppengotsu. All rights reserved.
//

import UIKit

@IBDesignable
class PPConfigCollectionBaseView: UIView {

    
    @IBOutlet var iconBaseView:UIView?
    @IBOutlet var descriptionLabel:UILabel?
    @IBOutlet var iconImageView:UIImageView?
    
    var nibView:UIView? //NIBから読み込んだView
    
    @IBInspectable var iconBaseViewCornerRaidus: CGFloat = 0 {
        didSet {
            iconBaseView!.layer.masksToBounds = true
            iconBaseView!.layer.cornerRadius = iconBaseViewCornerRaidus
        }
    }
    
    @IBInspectable var iconBaseViewBackColor: UIColor = UIColor.whiteColor() {
        didSet {
            iconBaseView?.backgroundColor = iconBaseViewBackColor
        }
    }
    
    @IBInspectable var descriptionLabelText: String = "" {
        didSet {
            iconBaseView?.backgroundColor = iconBaseViewBackColor
        }
    }
    
    @IBInspectable var iconImage: UIImage = UIImage() {
        didSet {
            iconImageView?.image = iconImage
        }
    }
    
    
    //MARK: - 公開

    
    
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
        let bundle = NSBundle(forClass: self.dynamicType)
        let nib = UINib(nibName: "PPConfigCollectionBaseView", bundle: bundle)
        nibView = nib.instantiateWithOwner(self, options: nil).first as? UIView
        
        addSubview(nibView!)
        
        nibView?.frame = self.frame
        
    }
    
    



}
