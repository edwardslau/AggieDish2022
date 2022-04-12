import SwiftUI
import Combine

struct CartItem: Identifiable, Hashable, Equatable {
//  var id: Int
  var id = UUID()
  var name: String
  var price: Double
//  var count: Int
}

var itemsInCart: [CartItem] = []

//struct ProductOrder: Equatable {
//    var product: CartItem
//    var quantity: UInt
//
//    init(product: CartItem, quantity: UInt = 1) {
//        self.product = product
//        self.quantity = quantity
//    }
//
//    var incremented: ProductOrder {
//        return ProductOrder(product: product, quantity: quantity + 1)
//    }
//
//    var decremented: ProductOrder {
//        return ProductOrder(product: product, quantity: quantity - 1)
//    }
//}
//
//enum CartAction {
//    case insert(product: CartItem)
//    case incrementProduct(withId: Int)
//    case decrementProduct(withId: Int)
//    case clear
//}
//
//class ShoppingCart {
//    let orders: AnyPublisher<[ProductOrder], Never>
//    let input: AnySubscriber<CartAction, Never>
//
//    init() {
//        let actionInput = PassthroughSubject<CartAction, Never>()
//
//        self.orders = actionInput.scan([Int:ProductOrder]()) { (currentOrders, action) -> [Int:ProductOrder] in
//            var newOrders = currentOrders
//            switch (action) {
//            case .insert(let product):
//                newOrders.updateValue(ProductOrder(product: product), forKey: product.id)
//            case .incrementProduct(withId: let productId):
//                if let order = newOrders[productId] {
//                    newOrders.updateValue(order.incremented, forKey: productId)
//                }
//            case .decrementProduct(withId: let productId):
//                if let order = newOrders[productId] {
//                    let decrementedOrder = order.decremented
//                    if (decrementedOrder.quantity == 0) {
//                        newOrders.removeValue(forKey: productId)
//                    } else {
//                        newOrders.updateValue(decrementedOrder, forKey: productId)
//                    }
//                }
//            case .clear:
//                return [:]
//            }
//
//            return newOrders
//        }
//            .map(\.values)
//            .map(Array.init)
//            .eraseToAnyPublisher()
//
//        self.input = AnySubscriber(actionInput)
//    }
//}
//
//extension ProductOrder {
//    var price: Double {
//        return product.price * Double(quantity)
//    }
//}
//
//extension ShoppingCart {
//    var numberOfProducts: AnyPublisher<Int, Never> {
//        return orders.map(\.count).eraseToAnyPublisher()
//    }
//
//    var totalPrice: AnyPublisher<Double, Never> {
//        return orders.map { $0.reduce(0) { (acc, order) -> Double in
//                acc + order.price
//            }
//        }.eraseToAnyPublisher()
//    }
//
//}
//
//extension ShoppingCart {
//    func discountedTotalPrice(discountRate: Double = 0.1) -> AnyPublisher<Double, Never> {
//        return totalPrice.map { $0 * (1.0 - discountRate) }.eraseToAnyPublisher()
//    }
//}
//
//
