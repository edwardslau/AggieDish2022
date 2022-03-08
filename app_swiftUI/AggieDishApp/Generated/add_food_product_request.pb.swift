// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: protos/add_food_product_request.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Model_AddFoodProductRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The identifier of the eatery with which to associate the food product.
  var eateryID: SwiftProtobuf.Google_Protobuf_StringValue {
    get {return _eateryID ?? SwiftProtobuf.Google_Protobuf_StringValue()}
    set {_eateryID = newValue}
  }
  /// Returns true if `eateryID` has been explicitly set.
  var hasEateryID: Bool {return self._eateryID != nil}
  /// Clears the value of `eateryID`. Subsequent reads from it will return its default value.
  mutating func clearEateryID() {self._eateryID = nil}

  /// The food product to add.
  var foodProduct: Model_FoodProduct {
    get {return _foodProduct ?? Model_FoodProduct()}
    set {_foodProduct = newValue}
  }
  /// Returns true if `foodProduct` has been explicitly set.
  var hasFoodProduct: Bool {return self._foodProduct != nil}
  /// Clears the value of `foodProduct`. Subsequent reads from it will return its default value.
  mutating func clearFoodProduct() {self._foodProduct = nil}

  /// Refer to model.Menu.MenuDay.day for more information.
  var day: SwiftProtobuf.Google_Protobuf_StringValue {
    get {return _day ?? SwiftProtobuf.Google_Protobuf_StringValue()}
    set {_day = newValue}
  }
  /// Returns true if `day` has been explicitly set.
  var hasDay: Bool {return self._day != nil}
  /// Clears the value of `day`. Subsequent reads from it will return its default value.
  mutating func clearDay() {self._day = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _eateryID: SwiftProtobuf.Google_Protobuf_StringValue? = nil
  fileprivate var _foodProduct: Model_FoodProduct? = nil
  fileprivate var _day: SwiftProtobuf.Google_Protobuf_StringValue? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "model"

extension Model_AddFoodProductRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".AddFoodProductRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "eatery_id"),
    2: .standard(proto: "food_product"),
    3: .same(proto: "day"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._eateryID) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._foodProduct) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._day) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._eateryID {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._foodProduct {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try { if let v = self._day {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Model_AddFoodProductRequest, rhs: Model_AddFoodProductRequest) -> Bool {
    if lhs._eateryID != rhs._eateryID {return false}
    if lhs._foodProduct != rhs._foodProduct {return false}
    if lhs._day != rhs._day {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}