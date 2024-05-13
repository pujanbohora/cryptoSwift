//
//  StatisticView.swift
//  SwiftCrypto
//
//  Created by Pawan Bohora on 5/13/24.
//

import SwiftUI

struct StatisticView: View {
    
    let stat: StatisticModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(stat.title)
                .font(.caption2)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(.theme.accent)
                
            
            HStack (spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(degrees:
                            (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                Text(stat.percentageChange?.asPrecentString() ?? "")
                    .font(.caption)
                    .bold()
                
            }
            .foregroundColor((stat.percentageChange ?? 0) >= 0 ? Color.theme.green : Color.theme.red)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)

        }
        
    }
    
}


struct StatisticView_Preview: PreviewProvider {
    static var previews: some View {
        Group {
            StatisticView(stat: dev.state1)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            StatisticView(stat: dev.state2)
                .previewLayout(.sizeThatFits)
            StatisticView(stat: dev.state3)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
        
    }
}
