## Practice Recommendations Organized by Case

### Frequency-based trips

A frequency-based trip does not follow a fixed schedule but attempt to maintain predetermined headways. These trips are denoted in [GTFS frequency.txt](https://gtfs.org/reference/static/#frequenciestxt) by setting `exact_times=0`. There are several best practices to keep in mind when constructing GTFS-Realtime feeds for frequency-based trips.

In [TripUpdate.StopTimeUpdate](#StopTimeUpdate), the [StopTimeEvent](#StopTimeEvent) for `arrival` and `departure` should not contain `delay` because frequency-based trips do not follow a fixed schedule. Instead, `time` should be provided to indicate arrival/departure predictions.

Also in [TripUpdate.StopTimeUpdate](#StopTimeUpdate), `schedule_relationship` should not be `SCHEDULED` or `SKIPPED` because these values are only relevant for schedule-based trips (trips not defined in [frequencies.txt](https://gtfs.org/reference/static/#frequenciestxt) or in [frequencies.txt](https://gtfs.org/reference/static/#frequenciestxt) but with `exact_times=1`). As of May 2019, there is no enumeration value in`schedule_relationship` that is suitable for frequency-based trips. A new enumeration value, `UNSCHEDULED`, is being proposed to the official specification and will be the best option for frequency-based trips once approved. Until `UNSCHEDULED` is approved, we recommend leaving `schedule_relationship` empty.

When describing `trip` in [TripUpdate](#TripUpdate) or [VehiclePosition](#VehiclePosition) by using [TripDescriptor](#TripDescriptor), all of `trip_id`, `start_time`, and `start_date` must be provided, and`schedule_relationship` should be `UNSCHEDULED`.

Frequency-based  trips' [TripUpdate](#TripUpdate) should contain `vehicle_id`. This helps disambiguate predictions in situations where more than one vehicle is running the same trip instance simultaneously.

