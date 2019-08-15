### VehiclePosition

Following are the minimal suggested field requirements for a VehiclePostions feed to provide consumers with high-quality data (e.g., for generating predictions)

| Field name | Required? | Description |
| --- | --- | --- |
| entity | Yes |  
| entity_id | Yes | Keep this stable until trip is updated
| vehicle (position) | Yes | (maps_transit.VehiclePosition)
| trip | Yes | 
| trip_id | Yes | Uniquely identifies a trip from the static GTFS
| start_time | Yes | Required for frequency-based trips (trips defined in GTFS frequencies.txt)
| start_date | Yes | Required for frequency-based trips (trips defined in GTFS frequencies.txt)
| schedule_relationship | Yes | SCHEDULED or other appropriate
| position | Yes |
| latitude | Yes | 
| longitude | Yes | 
| bearing | Optional |
| speed | Optional | 
| timestamp | Yes | Epoch timestamp of when the position of the vehicle was obtained in seconds
| vehicle   (descriptor) | Yes |
| id | Yes | This must uniquely and stably identify a   vehicle over the entire trip duration

Additional recommendations:

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
| timestamp | Providing the timestamp at which vehicle position was measured is strongly recommended. Otherwise, consumers must use the message timestamp, which can have misleading results for riders when the last message was updated more frequently than the individual position. |
| congestion_level |  |
| occupancy_status |  |
