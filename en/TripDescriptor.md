### TripDescriptor

| Field Name | Recommendation |
| --- | --- |
| trip_id | Developers need to make sure that all `trip_ids` must exist in the GTFS data. |
|  | Frequency-based trips must contain `trip_id`, `start_time`, and `start_date`. |
| route_id | Developers need to make sure that all `route_ids` must exist in the GTFS data. |
| direction_id | Developers need to make sure that all `direction_id` must exist in the GTFS data. |
| start_time | [Frequency-based trips](#Frequency-based-trips) must contain `trip_id`, `start_time`, and `start_date`. |
| start_date | [Frequency-based trips](#Frequency-based-trips) must contain `trip_id`, `start_time`, and `start_date`. |
| schedule_relationship | For [Frequency-based trips](#Frequency-based-trips), this should be `UNSCHEDULED` or empty. |
|  | Trips that have `schedule_relationship:CANCELED` will be canceled and not be available when calculating a trip plan.

