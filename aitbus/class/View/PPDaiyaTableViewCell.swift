//
//  PPDaiyaTableViewCell.swift
//  aitbus
//
//  Created by ppengotsu on 2016/04/21.
//  Copyright © 2016年 ppengotsu. All rights reserved.
//

import UIKit

enum DaiyaColor: Int {
    case Normal=0
    case Rest
}

class PPDaiyaTableViewCell: UITableViewCell {
    
    @IBOutlet var baseView:UIView!
    @IBOutlet var dayLabel:UILabel!
    @IBOutlet var daiyaLabel:UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
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

        
    }
    
    
    internal func setBackColorMode(daiyaColorMode:DaiyaColor){
        switch daiyaColorMode {
        case .Normal:
            self.baseView.backgroundColor = UIColor.init(red: 218/255.0, green: 247/255.0, blue: 255/255.0, alpha: 1.0)
            break
        case .Rest:
            self.baseView.backgroundColor = UIColor.init(red: 255/255.0, green: 128.0/255.0, blue: 128.0/255.0, alpha: 1.0)
            break
        }
    }
    
}
