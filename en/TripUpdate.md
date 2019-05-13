### TripUpdate

| Field Name | Recommendation |
| --- | --- |
| trip | refer to [message TripDescriptor](#TripDescriptor) |
|  | If separate `VehiclePosition` and `TripUpdate` feeds are provided, [TripDescriptor](#TripDescriptor) and [VehicleDescriptor](#VehicleDescriptor) ID values pairing should match between the two feeds.<br>For example, a `VehiclePosition` entity has `vehicle_id:A` and `trip_id:4`, then the corresponding `TripUpdate` entity should also have `vehicle_id:A` and `trip_id:4`. If any `TripUpdate` entity has `trip_id:4` and any `vehicle_id` other than 4, this is an error. |
| vehicle | refer to [message VehicleDescriptor](#VehicleDescriptor) |
|  | If separate `VehiclePosition` and `TripUpdate` feeds are provided, [TripDescriptor](#TripDescriptor) and [VehicleDescriptor](#VehicleDescriptor) ID values pairing should match between the two feeds.<br/>For example, a `VehiclePosition` entity has `vehicle_id:A` and `trip_id:4`, then the corresponding `TripUpdate` entity should also have `vehicle_id:A` and `trip_id:4`. If any `TripUpdate` entity has `trip_id:4` and any `vehicle_id` other than 4, this is an error. |
| stop_time_update | `stop_time_updates` for a given `trip_id` should be strictly ordered by increasing `stop_sequence` and no `stop_sequence` should be repeated. While sorting `stop_sequence` is not strictly required by the specification, it is a good practice. |
| timestamp |  |
| delay | delay should be propagated within a trip and across trips in the same block. When propagating delay, any layover should be considered and subtracted from the delay time. For example, a vehicle is running on a block that consists of two trips, one with `trip_id`: "trip_A" and one with `trip_id`: "trip_B", and 10 minutes layover between the two trips. When the vehicle is running 20 minutes late on "trip_A", trip_update.delay on "trip_A" should be 1200 (20 minutes = 1200 seconds), and on "trip_B" should should be 600 (10 minutes). |
|  | `TripUpdate.delay` should represent schedule deviation, i.e., the observed past value for how ahead/behind schedule the vehicle is. Predictions for future stops should be provided through `StopTimeEvent.delay` |
