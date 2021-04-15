## Practice Recommendations Organized by Use Case

### Frequency-based trips

A frequency-based trip does not follow a fixed schedule but attempts to maintain predetermined headways. These trips are denoted in [GTFS frequency.txt](https://gtfs.org/reference/static/#frequenciestxt) by setting `exact_times=0` or omitting the `exact_times` field (note that `exact_times=1` trips are *NOT* frequency-based trips - `frequencies.txt` with `exact_times=1` is simply used as a convenience method for storing schedule-based trips in a more compact manner). There are several best practices to keep in mind when constructing GTFS-realtime feeds for frequency-based trips.

In [TripUpdate.StopTimeUpdate](#StopTimeUpdate), the [StopTimeEvent](#StopTimeEvent) for `arrival` and `departure` should not contain `delay` because frequency-based trips do not follow a fixed schedule. Instead, `time` should be provided to indicate arrival/departure predictions.

Also in [TripUpdate.StopTimeUpdate](#StopTimeUpdate), `schedule_relationship` should be explictly set to `UNSCHEDULED` instead of `SCHEDULED` (which is also the default), because frequency-based trips do not follow a schedule.

As required by the spec, when describing `trip` in [TripUpdate](#TripUpdate) or [VehiclePosition](#VehiclePosition) by using [TripDescriptor](#TripDescriptor), all of `trip_id`, `start_time`, and `start_date` must be provided. Additionally, `schedule_relationship` should be `UNSCHEDULED`.

Frequency-based  trips' [TripUpdate](#TripUpdate) should contain `vehicle_id`. This helps disambiguate predictions in situations where more than one vehicle is running the same trip instance simultaneously.

