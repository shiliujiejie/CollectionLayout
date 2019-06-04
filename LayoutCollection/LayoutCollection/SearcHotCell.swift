
import UIKit

class SearcHotCell: UICollectionViewCell {

    static let cellId = "SearcHotCell"
    var titleLab: UILabel = {
        let lan = UILabel()
        lan.font = UIFont.systemFont(ofSize: 12)
        lan.textAlignment = .center
        lan.textColor = UIColor.darkGray
        
        lan.layer.cornerRadius = 11
        lan.layer.borderColor = UIColor.lightGray.cgColor
        lan.layer.masksToBounds = true
        lan.layer.borderWidth = 0.5
        return lan
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLab)
        titleLab.frame = self.bounds
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
  
   
}
