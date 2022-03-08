// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: protos/model/food_product.proto
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

struct Model_FoodProduct {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var name: SwiftProtobuf.Google_Protobuf_StringValue {
    get {return _name ?? SwiftProtobuf.Google_Protobuf_StringValue()}
    set {_name = newValue}
  }
  /// Returns true if `name` has been explicitly set.
  var hasName: Bool {return self._name != nil}
  /// Clears the value of `name`. Subsequent reads from it will return its default value.
  mutating func clearName() {self._name = nil}

  var description_p: SwiftProtobuf.Google_Protobuf_StringValue {
    get {return _description_p ?? SwiftProtobuf.Google_Protobuf_StringValue()}
    set {_description_p = newValue}
  }
  /// Returns true if `description_p` has been explicitly set.
  var hasDescription_p: Bool {return self._description_p != nil}
  /// Clears the value of `description_p`. Subsequent reads from it will return its default value.
  mutating func clearDescription_p() {self._description_p = nil}

  var allergyCautionTag: [SwiftProtobuf.Google_Protobuf_StringValue] = []

  var cuisine: SwiftProtobuf.Google_Protobuf_StringValue {
    get {return _cuisine ?? SwiftProtobuf.Google_Protobuf_StringValue()}
    set {_cuisine = newValue}
  }
  /// Returns true if `cuisine` has been explicitly set.
  var hasCuisine: Bool {return self._cuisine != nil}
  /// Clears the value of `cuisine`. Subsequent reads from it will return its default value.
  mutating func clearCuisine() {self._cuisine = nil}

  var subItem: [Model_FoodProduct.SubItem] = []

  var timeRangeServed: [Model_DayOpen.TimeRange] = []

  var id: SwiftProtobuf.Google_Protobuf_StringValue {
    get {return _id ?? SwiftProtobuf.Google_Protobuf_StringValue()}
    set {_id = newValue}
  }
  /// Returns true if `id` has been explicitly set.
  var hasID: Bool {return self._id != nil}
  /// Clears the value of `id`. Subsequent reads from it will return its default value.
  mutating func clearID() {self._id = nil}

  var image: SwiftProtobuf.Google_Protobuf_StringValue {
    get {return _image ?? SwiftProtobuf.Google_Protobuf_StringValue()}
    set {_image = newValue}
  }
  /// Returns true if `image` has been explicitly set.
  var hasImage: Bool {return self._image != nil}
  /// Clears the value of `image`. Subsequent reads from it will return its default value.
  mutating func clearImage() {self._image = nil}

  var price: SwiftProtobuf.Google_Protobuf_DoubleValue {
    get {return _price ?? SwiftProtobuf.Google_Protobuf_DoubleValue()}
    set {_price = newValue}
  }
  /// Returns true if `price` has been explicitly set.
  var hasPrice: Bool {return self._price != nil}
  /// Clears the value of `price`. Subsequent reads from it will return its default value.
  mutating func clearPrice() {self._price = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  struct SubItem {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var name: SwiftProtobuf.Google_Protobuf_StringValue {
      get {return _name ?? SwiftProtobuf.Google_Protobuf_StringValue()}
      set {_name = newValue}
    }
    /// Returns true if `name` has been explicitly set.
    var hasName: Bool {return self._name != nil}
    /// Clears the value of `name`. Subsequent reads from it will return its default value.
    mutating func clearName() {self._name = nil}

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}

    fileprivate var _name: SwiftProtobuf.Google_Protobuf_StringValue? = nil
  }

  init() {}

  fileprivate var _name: SwiftProtobuf.Google_Protobuf_StringValue? = nil
  fileprivate var _description_p: SwiftProtobuf.Google_Protobuf_StringValue? = nil
  fileprivate var _cuisine: SwiftProtobuf.Google_Protobuf_StringValue? = nil
  fileprivate var _id: SwiftProtobuf.Google_Protobuf_StringValue? = nil
  fileprivate var _image: SwiftProtobuf.Google_Protobuf_StringValue? = nil
  fileprivate var _price: SwiftProtobuf.Google_Protobuf_DoubleValue? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "model"

extension Model_FoodProduct: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".FoodProduct"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
    2: .same(proto: "description"),
    3: .standard(proto: "allergy_caution_tag"),
    4: .same(proto: "cuisine"),
    5: .standard(proto: "sub_item"),
    7: .standard(proto: "time_range_served"),
    8: .same(proto: "id"),
    9: .same(proto: "image"),
    10: .same(proto: "price"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._name) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._description_p) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.allergyCautionTag) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._cuisine) }()
      case 5: try { try decoder.decodeRepeatedMessageField(value: &self.subItem) }()
      case 7: try { try decoder.decodeRepeatedMessageField(value: &self.timeRangeServed) }()
      case 8: try { try decoder.decodeSingularMessageField(value: &self._id) }()
      case 9: try { try decoder.decodeSingularMessageField(value: &self._image) }()
      case 10: try { try decoder.decodeSingularMessageField(value: &self._price) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._name {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._description_p {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    if !self.allergyCautionTag.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.allergyCautionTag, fieldNumber: 3)
    }
    try { if let v = self._cuisine {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    } }()
    if !self.subItem.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.subItem, fieldNumber: 5)
    }
    if !self.timeRangeServed.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.timeRangeServed, fieldNumber: 7)
    }
    try { if let v = self._id {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
    } }()
    try { if let v = self._image {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 9)
    } }()
    try { if let v = self._price {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Model_FoodProduct, rhs: Model_FoodProduct) -> Bool {
    if lhs._name != rhs._name {return false}
    if lhs._description_p != rhs._description_p {return false}
    if lhs.allergyCautionTag != rhs.allergyCautionTag {return false}
    if lhs._cuisine != rhs._cuisine {return false}
    if lhs.subItem != rhs.subItem {return false}
    if lhs.timeRangeServed != rhs.timeRangeServed {return false}
    if lhs._id != rhs._id {return false}
    if lhs._image != rhs._image {return false}
    if lhs._price != rhs._price {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Model_FoodProduct.SubItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Model_FoodProduct.protoMessageName + ".SubItem"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._name) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._name {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Model_FoodProduct.SubItem, rhs: Model_FoodProduct.SubItem) -> Bool {
    if lhs._name != rhs._name {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}