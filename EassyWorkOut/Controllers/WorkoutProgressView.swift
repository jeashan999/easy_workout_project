import CoreGraphics
import UIKit

class WorkoutProgressView: UIView {
    private let chartView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(chartView)
        configureConstraints()
        let data = [10.0, 20.0, 30.0, 40.0, 50.0] // Example data
        updateChart(with: data)
    }
    
    private func configureConstraints() {
        chartView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: topAnchor),
            chartView.leadingAnchor.constraint(equalTo: leadingAnchor),
            chartView.trailingAnchor.constraint(equalTo: trailingAnchor),
            chartView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Function to update the chart with data
    func updateChart(with data: [Double]) {
        // Remove any existing subviews from the chart view
        chartView.subviews.forEach { $0.removeFromSuperview() }
        
        let maxValue = data.max() ?? 0
        let barWidth: CGFloat = 30
        let barSpacing: CGFloat = 10
        let chartHeight = chartView.bounds.height
        
        var xOffset: CGFloat = 0
        
        for (_, value) in data.enumerated() {
            let barHeight = chartHeight * CGFloat(value / maxValue)
            let barX = xOffset + (barSpacing / 2)
            let barY = chartHeight - barHeight
            
            let barView = UIView(frame: CGRect(x: barX, y: barY, width: barWidth, height: barHeight))
            barView.backgroundColor = .systemBlue
            
            chartView.addSubview(barView)
            
            xOffset += barWidth + barSpacing
        }
    }
}
