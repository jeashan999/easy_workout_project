import UIKit

protocol MenuViewControllerDelegate: AnyObject {
    func menuViewControllerDidSelectOption(_ option: MenuOption)
    func menuViewControllerDidSelectLogout()
}

enum MenuOption: String, CaseIterable {
    case home = "Home"
    case profile = "Profile"
    case settings = "Settings"
    case logout = "Logout"
    
    var icon: UIImage? {
        switch self {
        case .home:
            return UIImage(systemName: "house")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        case .profile:
            return UIImage(systemName: "person")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        case .settings:
            return UIImage(systemName: "gearshape")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        case .logout:
            return UIImage(systemName: "power")?.withTintColor(.red, renderingMode: .alwaysOriginal)
        }
    }

}

class MenuViewController: UIViewController {
    
    weak var delegate: MenuViewControllerDelegate?
    
    private let menuTableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    private let menuItems = MenuOption.allCases
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemIndigo
        return view
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "menu_icon"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Menu"
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuTableView.dataSource = self
        menuTableView.delegate = self
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(headerView)
        headerView.addSubview(iconImageView)
        headerView.addSubview(titleLabel)
        view.addSubview(menuTableView)
        view.addSubview(footerView)
        
        let height = view.frame.height / 4
        
        headerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: height)
        iconImageView.frame = CGRect(x: 20, y: height / 2 - 20, width: 40, height: 40)
        titleLabel.frame = CGRect(x: 0, y: height / 2 - 20, width: view.frame.width, height: 40)
        menuTableView.frame = CGRect(x: 0, y: height, width: view.frame.width, height: view.frame.height - height * 2)
        footerView.frame = CGRect(x: 0, y: view.frame.height - height, width: view.frame.width, height: height)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = headerView.bounds
        gradientLayer.colors = [UIColor.systemIndigo.cgColor, UIColor.blue.cgColor]
        headerView.layer.addSublayer(gradientLayer)
        
        // Add shadow to menuTableView
        menuTableView.layer.masksToBounds = false
        menuTableView.layer.shadowColor = UIColor.black.cgColor
        menuTableView.layer.shadowOpacity = 0.3
        menuTableView.layer.shadowOffset = CGSize(width: 0, height: 1)
        menuTableView.layer.shadowRadius = 3
        
        // Customize table view appearance
        menuTableView.layer.cornerRadius = 10
    }
}

extension MenuViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let option = menuItems[indexPath.row]
        cell.backgroundColor = .clear
        cell.textLabel?.text = option.rawValue
        cell.textLabel?.font = UIFont.systemFont(ofSize: 20)
        cell.textLabel?.textColor = .black
        cell.imageView?.image = option.icon
        cell.imageView?.tintColor = .white
        return cell
    }
}

extension MenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let option = menuItems[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch option {
        case .home, .profile, .settings:
            delegate?.menuViewControllerDidSelectOption(option)
        case .logout:
            delegate?.menuViewControllerDidSelectLogout()
        }
    }
}
