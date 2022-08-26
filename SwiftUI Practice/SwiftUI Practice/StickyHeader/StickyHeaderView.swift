//
//  StickyHeaderView.swift
//  SwiftUI Practice
//
//  Created by Shailesh Aher on 26/08/22.
//

import SwiftUI

struct StickyHeaderView: View {
    var body: some View {
        List {
          Text("Non-sticky part of the header...")
            .font(.system(size: 32))

          Section(header: HStack {
            Text("Sticky header")
              .font(.system(size: 24))
            Spacer()
            Image(systemName: "sun.max.fill")
          }) {
            ForEach(1..<40) { index in
              Text("Row #\(index)")
            }
          }

          Section(header: HStack {
            Text("Sticky header 2")
              .font(.system(size: 24))
            Spacer()
            Image(systemName: "sun.max.fill")
          }) {
            ForEach(1..<40) { index in
              Text("Row #\(index)")
            }
          }
        }
        .listStyle(.plain)
    }
}

struct StickyHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        StickyHeaderView()
    }
}
