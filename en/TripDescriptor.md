### TripDescriptor

If separate `VehiclePosition` and `TripUpdate` feeds are provided, [TripDescriptor](#TripDescriptor) and [VehicleDescriptor](#VehicleDescriptor) ID values pairing should match between the two feeds.

For example, a `VehiclePosition` entity has `vehicle_id:A` and `trip_id:4`, then the corresponding `TripUpdate` entity should also have `vehicle_id:A` and `trip_id:4`.

| Field Name | Recommendation |
| --- | --- |
| `schedule_relationship` | The behavior of `ADDED` trips are unspecified and the use of this enumeration is not recommended. |

