import UIKit

class HeroHeaderUIView: UIView {
    private let heroImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "background")
        return imageView
    }()
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome to the Easy Workout"
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let aboutLabel: UILabel = {
        let label = UILabel()
        label.text = "This app provides you with tools to track your workouts, set fitness goals, and monitor your progress. Stay motivated and achieve your fitness goals with Gym Dashboard!"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let additionalLabel: UILabel = {
        let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed fringilla turpis a odio maximus vestibulum. Nullam eu finibus massa. Nunc ut placerat mauris. Morbi non ante ligula."
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(heroImageView)
        addSubview(welcomeLabel)
        addSubview(aboutLabel)
        addSubview(additionalLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        heroImageView.frame = bounds
        
        let contentWidth = bounds.width - 32
        let centerY = bounds.height / 2
        
        welcomeLabel.frame = CGRect(x: 16, y: centerY - 80, width: contentWidth, height: 30)
        aboutLabel.frame = CGRect(x: 16, y: welcomeLabel.frame.maxY + 10, width: contentWidth, height: 100)
        additionalLabel.frame = CGRect(x: 16, y: aboutLabel.frame.maxY + 10, width: contentWidth, height: 150)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
