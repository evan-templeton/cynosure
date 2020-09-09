
import UIKit

class HomeFeedViewController: UIViewController {

    var user: User?
    
    var posts: [Post] = []
    
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeTableView.dataSource = self
        homeTableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        
        navigationItem.backBarButtonItem = .none
        
        loadPosts()
    }

    func loadPosts() {
        posts = []
        let newPost = Post(image: "https://imagesvc.meredithcorp.io/v3/mm/image?url=https%3A%2F%2Fstatic.onecms.io%2Fwp-content%2Fuploads%2Fsites%2F20%2F2020%2F04%2F28%2Ftaylor-swift-1-2000.jpg", author: "Taylor Swift", body: "In isolation my imagination has run wild and this album is the result. I’ve told these stories to the best of my ability with all the love, wonder, and whimsy they deserve. Now it’s up to you to pass them down. folklore is out now: https://taylor.lnk.to/folklore")
        let newPost1 = Post(image: "https://thepuristonline.com/wp-content/uploads/2019/12/@RZA.jpg", author: "RZA", body: "#CutThroatCity, directed by @rza and starring @Tip as Cousin Bass. Now in theaters everywhere! Get theaters & tickets at http://cutthroatcitymovie.com")
        let newPost2 = Post(image: "https://static.billboard.com/files/media/anderson-paak-2018-cr-katie-spoleti-billboard-1548-1024x677.jpg", author: "Anderson .Paak", body: "THEY SAY THE BOY DONT MISS!!!! NEW MUSIC WT THE BIGGEST BOSS @RickRoss OUT NOW EVERYWHERE INCLUDING #MADDEN21! PRODUCED BY THE YOUNG LEGEND @Hit_Boy RUN IT UUUUUPPPPP!!!!")
        let newPost4 = Post(image: "https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5ed554fab14861000600baf1%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D53%26cropX2%3D739%26cropY1%3D114%26cropY2%3D800", author: "Jay-Z", body: "The line clearly meant don’t pit me against my brothers no matter what our differences are (red hat) now go pick up Meek album . Drake and Meek on there together .")
        posts.append(newPost)
        posts.append(newPost1)
        posts.append(newPost2)
        posts.append(newPost4)
        homeTableView.reloadData()
        let indexPath = IndexPath(row: posts.count - 1, section: 0)
        homeTableView.scrollToRow(at: indexPath, at: .top, animated: false)
    }
}

extension HomeFeedViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath) as! PostCell
        cell.setPostCell(post: post)
        
        return cell
    }
}
