// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: protos/model/day_open.proto
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

struct Model_DayOpen {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// The time intervals within the day during which the eatery is open.
  var timeRangeOpen: [Model_DayOpen.TimeRange] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  struct TimeRange {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    /// The civil time at which the eatery opens.
    var openTime: Google_Type_TimeOfDay {
      get {return _openTime ?? Google_Type_TimeOfDay()}
      set {_openTime = newValue}
    }
    /// Returns true if `openTime` has been explicitly set.
    var hasOpenTime: Bool {return self._openTime != nil}
    /// Clears the value of `openTime`. Subsequent reads from it will return its default value.
    mutating func clearOpenTime() {self._openTime = nil}

    /// The civil time at which the eatery closes.
    var closeTime: Google_Type_TimeOfDay {
      get {return _closeTime ?? Google_Type_TimeOfDay()}
      set {_closeTime = newValue}
    }
    /// Returns true if `closeTime` has been explicitly set.
    var hasCloseTime: Bool {return self._closeTime != nil}
    /// Clears the value of `closeTime`. Subsequent reads from it will return its default value.
    mutating func clearCloseTime() {self._closeTime = nil}

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}

    fileprivate var _openTime: Google_Type_TimeOfDay? = nil
    fileprivate var _closeTime: Google_Type_TimeOfDay? = nil
  }

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "model"

extension Model_DayOpen: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DayOpen"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "time_range_open"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.timeRangeOpen) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.timeRangeOpen.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.timeRangeOpen, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Model_DayOpen, rhs: Model_DayOpen) -> Bool {
    if lhs.timeRangeOpen != rhs.timeRangeOpen {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Model_DayOpen.TimeRange: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Model_DayOpen.protoMessageName + ".TimeRange"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "open_time"),
    2: .standard(proto: "close_time"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._openTime) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._closeTime) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._openTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._closeTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Model_DayOpen.TimeRange, rhs: Model_DayOpen.TimeRange) -> Bool {
    if lhs._openTime != rhs._openTime {return false}
    if lhs._closeTime != rhs._closeTime {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}