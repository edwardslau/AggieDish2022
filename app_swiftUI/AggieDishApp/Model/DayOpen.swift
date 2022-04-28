import Foundation

struct TimeRange {
  var openTime: Google_Type_TimeOfDay
  var closeTime: Google_Type_TimeOfDay
}

struct DayOpen {
  var dayOpen: [TimeRange]
}
