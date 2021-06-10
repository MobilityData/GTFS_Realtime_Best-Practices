### TripUpdate

General guidelines for trip cancellations:
* When canceling trips over a number of days, producers should provide TripUpdates referencing the given `trip_ids` and `start_dates` as `CANCELED` as well as an Alert with `NO_SERVICE` referencing the same `trip_ids` and `TimeRange` that can be shown to riders explaining the cancellation (e.g., detour).
* If no stops in a trip will be visited, the trip should be `CANCELED` instead of having all `stop_time_updates` being marked as `SKIPPED`.  

| Field Name | Recommendation |
| --- | --- |
| trip | refer to [message TripDescriptor](#TripDescriptor) |
|  | If separate `VehiclePosition` and `TripUpdate` feeds are provided, [TripDescriptor](#TripDescriptor) and [VehicleDescriptor](#VehicleDescriptor) ID values pairing should match between the two feeds.<br>For example, a `VehiclePosition` entity has `vehicle_id:A` and `trip_id:4`, then the corresponding `TripUpdate` entity should also have `vehicle_id:A` and `trip_id:4`. If any `TripUpdate` entity has `trip_id:4` and any `vehicle_id` other than 4, this is an error. |
| vehicle | refer to [message VehicleDescriptor](#VehicleDescriptor) |
|  | If separate `VehiclePosition` and `TripUpdate` feeds are provided, [TripDescriptor](#TripDescriptor) and [VehicleDescriptor](#VehicleDescriptor) ID values pairing should match between the two feeds.<br/>For example, a `VehiclePosition` entity has `vehicle_id:A` and `trip_id:4`, then the corresponding `TripUpdate` entity should also have `vehicle_id:A` and `trip_id:4`. If any `TripUpdate` entity has `trip_id:4` and any `vehicle_id` other than 4, this is an error. |
| stop_time_update | `stop_time_updates` for a given `trip_id` should be strictly ordered by increasing `stop_sequence` and no `stop_sequence` should be repeated. |
|  | All TripUpdates should include at least one stop_time_update with a predicted arrival or departure time in the future (or recent past) while the trip is in progress (or scheduled to be in progress). |
| timestamp | Should reflect the time this prediction for this trip was updated |
| delay | `TripUpdate.delay` should represent schedule deviation, i.e., the observed past value for how ahead/behind schedule the vehicle is. Predictions for future stops should be provided through `StopTimeEvent.delay` or `StopTimeEvent.time` |
