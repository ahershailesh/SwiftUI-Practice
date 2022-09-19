//
//  CalculatorView.swift
//  SwiftUI Practice
//
//  Created by Shailesh Aher on 26/08/22.
//

import SwiftUI

class CalculatorViewModel: ObservableObject {
    @Published var displayText: String = ""
    private var result: Double = 0
    private var operation: CalculatorButtonItem?
    
    func itemTapped(item: CalculatorButtonItem) {
        switch item {
        case .plus:
            result += Double(displayText) ?? 0
            displayText = "\(result)"
        case .subtract:
            result -= Double(displayText) ?? 0
            displayText = "\(result)"
        case .multiply:
            result *= Double(displayText) ?? 0
            displayText = "\(result)"
        case .devide:
            result /= Double(displayText) ?? 0
            displayText = "\(result)"
        case .equate:
            displayText = "\(result)"
        case .erase:
            result = 0
            displayText = ""
        default:
            display(item: item)
        }
        
    }
    
    private func display(item: CalculatorButtonItem) {
        displayText = displayText.appending(item.rawValue)
    }
    
    
}

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

extension Text {
    func scaledFont(name: String, size: Double) -> some View {
            return self.modifier(ScaledFont(name: name, size: size))
        }
}

struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String
    var size: Double

    func body(content: Content) -> some View {
       let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        return content.font(.custom(name, size: scaledSize))
    }
}


struct CalculatorView: View {
    
    private let items: [[CalculatorButtonItem]] = [
        [.erase, .plusMinus, .percent, .devide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .plus],
    ]
    @ObservedObject private var viewModel = CalculatorViewModel()
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    Text(viewModel.displayText.isEmpty ? "0" : viewModel.displayText)
                        .scaledFont(name: "SF", size: 72)
                        .foregroundColor(.white)
                        .frame(height: 200)
                }
                ForEach(items, id: \.self) { item in
                    getStackView(with: item)
                }
                HStack {
                    Button {
                        viewModel.itemTapped(item: .zero)
                    } label: {
                        ZStack {
                            Capsule()
                                .fill(CalculatorButtonItem.zero.backgroundColor)
                            Text(CalculatorButtonItem.zero.rawValue)
                                .foregroundColor(CalculatorButtonItem.zero.forgroundColor)
                                .font(.system(size: 48))
                        }
                        .padding(.init(top: 8, leading: 0, bottom: 8, trailing: 0))
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
        HStack(spacing: 8) {
            ForEach(items, id: \.self) { element in
                Button {
                    viewModel.itemTapped(item: element)
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
