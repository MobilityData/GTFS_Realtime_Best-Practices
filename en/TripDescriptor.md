### TripDescriptor

If separate `VehiclePosition` and `TripUpdate` feeds are provided, [TripDescriptor](#TripDescriptor) and [VehicleDescriptor](#VehicleDescriptor) ID values pairing should match between the two feeds.

For example, a `VehiclePosition` entity has `vehicle_id:A` and `trip_id:4`, then the corresponding `TripUpdate` entity should also have `vehicle_id:A` and `trip_id:4`.

When `schedule_relationship` is `SCHEDULED`, `route_id`, `trip_id`, and `direction_id` SHOULD match the referenced `route_id`, `trip_id`, and `direction_id` in the GTFS Schedule (static) dataset (feed). 

| Field Name | Recommendation |
| --- | --- |
| trip_id | |
| route_id | |
| direction_id | |
| start_time | |
| start_date | |
| schedule_relationship | The behavior of `ADDED` trips are unspecified and the use of this enumeration is not recommended. |

