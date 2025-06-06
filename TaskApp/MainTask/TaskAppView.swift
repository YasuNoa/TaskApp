//
//  ContentView.swift
//  TaskApp
//
//  Created by 田中正造 on 04/06/2025.
//

import SwiftUI


struct TaskAppView: View {
    
    var body: some View {
        TabView{
            TaskMainView()
                .tabItem{
                    Image(systemName: "house.fill")
                    
                }
            SearchView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                }
            RankingView()
                .tabItem{
                    Image(systemName: "trophy.fill")
                }
            MyPageView()
                .tabItem{
                    Image(systemName: "person.crop.circle.fill")
                }
        }
    }
}
struct TaskModifier: ViewModifier {
        func body(content: Content) -> some View {
            content
                .frame(maxWidth: .infinity,alignment: .leading)
        }
    }
        
    




#Preview {
    TaskAppView()
}
