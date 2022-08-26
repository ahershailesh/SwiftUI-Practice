//
//  MenuList.swift
//  SwiftUI Practice
//
//  Created by Shailesh Aher on 23/08/22.
//

import SwiftUI

struct MenuList: View {
    private let menuItems = [
        "TODO",
        "Weather",
        "Calculator",
        "Pinterest"
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(menuItems, id: \.self) { item in
                    HStack {
                        Text(item)
                            .foregroundColor(.black)
                        NavigationLink(destination: Text(item)) {
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
