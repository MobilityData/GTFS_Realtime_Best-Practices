### VehiclePosition

| Field Name | Recommendation |
| --- | --- |
| trip | refer to [message TripDescriptor](#TripDescriptor) |
|  | If separate `VehiclePosition` and `TripUpdate` feeds are provided, [TripDescriptor](#TripDescriptor) and [VehicleDescriptor](#VehicleDescriptor) ID values pairing should match between the two feeds.<br/>For example, a `VehiclePosition` entity has `vehicle_id:A` and `trip_id:4`, then the corresponding `TripUpdate` entity should also have `vehicle_id:A` and `trip_id:4`. If any `TripUpdate` entity has `trip_id:4` and any `vehicle_id` other than 4, this is an error. |
| vehicle | refer to [message VehicleDescriptor](#VehicleDescriptor) |
|  | If separate `VehiclePosition` and `TripUpdate` feeds are provided, [TripDescriptor](#TripDescriptor) and [VehicleDescriptor](#VehicleDescriptor) ID values pairing should match between the two feeds.<br/>For example, a `VehiclePosition` entity has `vehicle_id:A` and `trip_id:4`, then the corresponding `TripUpdate` entity should also have `vehicle_id:A` and `trip_id:4`. If any `TripUpdate` entity has `trip_id:4` and any `vehicle_id` other than 4, this is an error. |
| position | The vehicle position should be within 200 meters of the GTFS shapes.txt data for the current trip unless there is an alert with the effect of `DETOUR` for this `trip_id`. |
| current_stop_sequence |  |
| stop_id | All `stop_ids`  must exist in the GTFS data in `stops.txt` and must have `location_type=0` in `stops.txt`. |
| current_status |  |
| timestamp | Even though this field is optional, providing the timestamp at which vehicle position was measured is strongly recommended. |
| congestion_level |  |
| occupancy_status |  |
