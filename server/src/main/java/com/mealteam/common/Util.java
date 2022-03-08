package com.mealteam.common;

import com.google.type.*;
import com.google.protobuf.*;

import com.aggiedish.protos.model.DayOpen;
import com.aggiedish.protos.model.DayOpen.TimeRange;

public class Util {

    public static TimeRange makeTimeRange(int fromHour, int toHour) {
        TimeOfDay from = TimeOfDay
            .newBuilder()
            .setHours(fromHour)
            .build();

        TimeOfDay to = TimeOfDay
            .newBuilder()
            .setHours(toHour)
            .build();

        return TimeRange
            .newBuilder()
            .setOpenTime(from)
            .setCloseTime(to)
            .build();
    }

    public static FloatValue makeFloatValue(Float num) {
        return FloatValue
            .newBuilder()
            .setValue(num)
            .build();
    }

    public static DoubleValue makeDoubleValue(Double num) {
        return DoubleValue
            .newBuilder()
            .setValue(num)
            .build();
    }

    public static Int64Value makeInt64Value(Long num) {
        return Int64Value
            .newBuilder()
            .setValue(num)
            .build();
    }

    public static Int32Value makeInt32Value(Integer num) {
        return Int32Value
            .newBuilder()
            .setValue(num)
            .build();
    }

    public static StringValue makeStringValue(String s) {
        return StringValue
            .newBuilder()
            .setValue(s)
            .build();
    }

    public static BoolValue makeBoolValue(Boolean b) {
        return BoolValue
            .newBuilder()
            .setValue(b)
            .build();
    }

    public static LatLng makeCoordinate(Double latitude, Double longitude) {
        return LatLng
            .newBuilder()
            .setLatitude(latitude)
            .setLongitude(longitude)
            .build();
    }
}
