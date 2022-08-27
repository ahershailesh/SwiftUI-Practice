//
//  MenuList.swift
//  SwiftUI Practice
//
//  Created by Shailesh Aher on 23/08/22.
//

import SwiftUI

enum MenuItem: String, CaseIterable {
    case calculator = "Calculator"
    case todo = "TODO"
    case weather = "Weather"
    case pinterest = "Pinterest"
    case youtube = "Youtube"
    
    var desinationView: some View {
        Group {
            switch self {
            case .calculator:
                CalculatorView()
            case .todo:
                Text(rawValue)
            case .weather:
                Text(rawValue)
            case .pinterest:
                Text(rawValue)
            case .youtube:
                Text(rawValue)
                
            }
        }
    }
}

struct MenuList: View {
    private let menuItems: [MenuItem] =
        MenuItem.allCases
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menuItems, id: \.self) { item in
                    HStack {
                        Text(item.rawValue)
                            .foregroundColor(.black)
                        NavigationLink(destination: item.desinationView) {
                            EmptyView()
                        }
                        .opacity(0)
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.blue)
                    }
                }
                .navigationTitle("Menu")
            }
        }
    }
}

struct MenuList_Previews: PreviewProvider {
    static var previews: some View {
        MenuList()
    }
}
