//
//  Sort.swift
//  AggieDish
//
//  Created by Ruiyi He on 2/8/22.
//
//  Adapted from https://gist.github.com/emmanuelkehinde/ff0af45b9837eb2a925381a709960f9e


import SwiftUI

struct DropdownOption: Hashable {
    let key: String
    let value: String

    public static func == (lhs: DropdownOption, rhs: DropdownOption) -> Bool {
        return lhs.key == rhs.key
    }
}

struct DropdownRow: View {
    var option: DropdownOption
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    var body: some View {
        Button(action: {
            if let onOptionSelected = self.onOptionSelected {
                onOptionSelected(self.option)
            }
        }) {
            HStack {
                Text(self.option.value)
                    .font(.system(size: 14))
                    .foregroundColor(Color.black)
                Spacer()
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 5)
    }
}

struct Dropdown: View {
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(self.options, id: \.self) { option in
                    DropdownRow(option: option, onOptionSelected: self.onOptionSelected)
                }
            }
        }
        .frame(minHeight: CGFloat(options.count) * 30, maxHeight: 250)
        .padding(.vertical, 5)
        .background(Color.white)
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct DropdownSelector: View {
    @State private var shouldShowDropdown = false
    @State private var selectedOption: DropdownOption? = nil
    var options: [DropdownOption]
    var onOptionSelected: ((_ option: DropdownOption) -> Void)?
    private let buttonHeight: CGFloat = 30

    var body: some View {
        Button(action: {
            self.shouldShowDropdown.toggle()
        }) {
            Image(systemName: "line.3.horizontal.decrease")
                .font(Font.body.weight(.medium))
                .foregroundColor(Color.black)
        }
        .overlay(
            VStack {
                if self.shouldShowDropdown {
                    Spacer(minLength: buttonHeight + 10)
                    Dropdown(options: self.options, onOptionSelected: { option in
                        shouldShowDropdown = false
                        selectedOption = option
                        self.onOptionSelected?(option)
                    })
                    .frame(width: 180, height: self.buttonHeight)
                    .offset(x:20)
                }
            }, alignment: .topTrailing
        )
    }
}


struct Sort: View {
    static var uniqueKey: String {
        UUID().uuidString
    }

    static let options: [DropdownOption] = [
        DropdownOption(key: uniqueKey, value: "Distance Nearest"),
        DropdownOption(key: uniqueKey, value: "Review"),
//        DropdownOption(key: uniqueKey, value: "Cost"),
//        DropdownOption(key: uniqueKey, value: "Time")
    ]
    
    var body: some View {
        Group {
            DropdownSelector(
                options: Sort.options,
                onOptionSelected: { option in
                    print(option)
            })
            .padding(.horizontal)
        }
    }
}
struct Sort_Previews: PreviewProvider {
    static var previews: some View {
        Sort()
    }
}
