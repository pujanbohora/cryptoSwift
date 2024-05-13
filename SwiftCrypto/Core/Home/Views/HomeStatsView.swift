//
//  HomeStatsView.swift
//  SwiftCrypto
//
//  Created by Pawan Bohora on 5/13/24.
//

import SwiftUI

struct HomeStatsView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    @Binding var showPortfolio: Bool
    
    var body: some View {
        
        HStack {
            ForEach(vm.statistics) { stats in
                    StatisticView(stat: stats)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width,
               alignment: showPortfolio ? .trailing : .leading)
    }
}

//#Preview {
//    HomeStatsView(showPortfolio: .constant(false))
//        .environmentObject(dev.homeVM)
//}

struct HomeStatsView_Preview: PreviewProvider {
    static var previews: some View {
        HomeStatsView(showPortfolio: .constant(false))
            .environmentObject(dev.homeVM)
        
    }
}
