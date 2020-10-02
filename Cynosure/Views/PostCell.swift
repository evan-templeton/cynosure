
import UIKit
import SDWebImage

class PostCell: UITableViewCell {

    @IBOutlet weak var postImageView: UIImageView!
    @IBOutlet weak var postAuthorLabel: UILabel!
    @IBOutlet weak var postTextView: UIView!
    @IBOutlet weak var postTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        postTextView.layer.cornerRadius = 13
        
    }
    
    func setPostCell(post: Post) {
        self.postImageView.loadImage(post.image)
        postAuthorLabel.text = post.author
        postTextLabel.text = post.body
    }
}
