//
//  CalculatorView.swift
//  SwiftUI Practice
//
//  Created by Shailesh Aher on 26/08/22.
//

import SwiftUI

enum CalculatorButtonItem: String {
    case erase = "AC"
    case plusMinus = "+/-"
    case percent = "%"
    case devide = "/"
    case multiply = "X"
    case subtract = "-"
    case plus = "+"
    case equate = "="
    
    // Number
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case dot = "."
    
    var forgroundColor: Color {
        switch self {
        case .erase, .plusMinus, .percent: return .black
        default: return .white
        }
    }
    
    var backgroundColor: Color {
        switch self {
        case .erase, .plusMinus, .percent: return .gray
        case .devide, .multiply, .subtract, .plus, .equate: return .orange
        default: return .blue
        }
    }
}

struct CalculatorView: View {
    
    private let items: [[CalculatorButtonItem]] = [
        [.erase, .plusMinus, .percent, .devide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .plus],
    ]
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Text("0")
                        .font(.system(size: 72))
                        .foregroundColor(.white)
                        .frame(width: .infinity, height: 200)
                }
                ForEach(items, id: \.self) { item in
                    getStackView(with: item)
                }
                HStack {
                    Button {
                        print(0)
                    } label: {
                        ZStack {
                            Capsule()
                                .fill(CalculatorButtonItem.zero.backgroundColor)
                            Text(CalculatorButtonItem.zero.rawValue)
                                .foregroundColor(CalculatorButtonItem.zero.forgroundColor)
                                .font(.system(size: 48))
                        }
                        .padding()
                    }
                    HStack {
                        getStackView(with: [.dot, .equate])
                    }
                }
            }
            .padding()
        }
    }
    
    private func getStackView(with items: [CalculatorButtonItem]) -> some View {
        HStack {
            ForEach(items, id: \.self) { element in
                Button {
                    print(element)
                } label: {
                    ZStack {
                        Circle()
                            .fill(element.backgroundColor)
                        Text(element.rawValue)
                            .foregroundColor(element.forgroundColor)
                            .font(.system(size: 48))
                    }
                }

            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
