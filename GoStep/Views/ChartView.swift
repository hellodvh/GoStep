import SwiftUI

struct ChartView: View {
    
    let values: [Int]
    let labels: [String]
    let xAxisLabels: [String]
    
    var body: some View {
        GeometryReader { geo in
            
            HStack(alignment: .bottom) {
                
                ForEach(0..<values.count) { index in
                    
                    let max = values.max() ?? 0
                    
                    VStack {
                        Text(labels[index])
                            .font(.caption)
                            .rotationEffect(.degrees(-60))
                        
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.red)
                            .frame(width:15, height: CGFloat(values[index]) / CGFloat(max) * geo.size.height * 0.6)
                        
                        Text(xAxisLabels[index])
                            .font(.caption2)
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.primary.opacity(0.2))
                .cornerRadius(10)
                .padding(.bottom, 10)
                .padding(.horizontal, 10)
                .padding(.vertical, 10)
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        let values = [213, 300, 5, 3, 350, 430, 342, 30]
        let labels = ["label1", "label2", "label3","label4","label5","label6","label7","label8"]
        let xAxisValues = ["May 30","May 31","June 1","June 2","June 3","June 4","June 5","June 6",]
        ChartView(values: values, labels: labels, xAxisLabels: xAxisValues)
    }
}
