import SwiftUI

struct CustomizationSelection: View {
    var optionName: String
    var price: Double
    var isOptional: Bool
    @State var isSelected: Bool = false
    
    func toggle(){isSelected = !isSelected}
    
    var body: some View {
        HStack {
            Button(action: toggle){
               Image(systemName: getButton(isOptional: isOptional, isSelected: isSelected))
                    .foregroundColor(.black)
            }
            Text(optionName)
                .padding()
                .font(.headline.weight(.medium))
            Spacer()
            price == 0 ? Text("") : Text("+$"+String(format: "%.2f",price))
                .foregroundColor(.secondary)
        }
    }
}

func getButton(isOptional: Bool, isSelected: Bool) -> String{
    if (isOptional) {
        return isSelected ? "checkmark.square.fill" : "square"
    } else {
        return isSelected ? "checkmark.circle.fill" : "circle"
    }
}

struct EditNumberAddToCart: View {
    @State var count: Int = 1

    var body: some View {
        HStack {
            Spacer()
            Button(action: {
                count = count > 1 ? count - 1 : 1
            }, label: {
                Image(systemName: "minus")
                    .imageScale(.medium)
                    .frame(width: 60, height: 60)
                    .background(Color.black.opacity(0.06))
                    .cornerRadius(30)
                    .foregroundColor(.black)
            })
            Text(String(count))
                .frame(minWidth: 50)
            Button(action: {
                count += 1
            }, label: {
                Image(systemName: "plus")
                    .imageScale(.medium)
                    .frame(width: 60, height: 60)
                    .background(Color.black.opacity(0.06))
                    .cornerRadius(30)
                    .foregroundColor(.black)
            })
            Spacer()
        }
        .padding()
    }
}
