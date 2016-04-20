//
//  PPPlaceView.swift
//  aitbus
//
//  Created by ppengotsu on 2016/04/19.
//  Copyright © 2016年 ppengotsu. All rights reserved.
//

import UIKit

@IBDesignable
class PPPlaceView: UIView {
    
     var nibView:UIView! //NIBから読み込んだView
    
    @IBOutlet var timeNameLabel:UILabel!
    @IBOutlet var fromPlaceLabel:UILabel!
    @IBOutlet var toPlaceLabel:UILabel!

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
        let nib = UINib(nibName: "PPPlaceView", bundle: bundle)
        nibView = nib.instantiateWithOwner(self, options: nil).first as? UIView
        self.frame = nibView.frame
        addSubview(nibView!)
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
        self.layer.shadowOffset = CGSizeMake(8, 8)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.9
        
        
    }
    
    @IBAction func swipeLeft(sender:UISwipeGestureRecognizer){
        
    }
    
    @IBAction func swipeRight(sender:UISwipeGestureRecognizer){
        
    }
    
    


}
