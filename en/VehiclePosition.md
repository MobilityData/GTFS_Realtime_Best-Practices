### VehiclePosition

Following are the minimal suggested field requirements for a VehiclePostions feed to provide consumers with high-quality data (e.g., for generating predictions)

| Field name | Description |
| --- | --- |
| entity.id | This should be kept stable until trip is updated
| vehicle (VehiclePosition) |
| vehicle.timestamp | Providing the timestamp at which vehicle position was measured is strongly recommended. Otherwise, consumers must use the message timestamp, which can have misleading results for riders when the last message was updated more frequently than the individual position.
| vehicle.trip | 
| vehicle.trip.trip_id |
| vehicle.trip.start_time |
| vehicle.trip.start_date |
| vehicle.trip.schedule_relationship |
| vehicle.position | The vehicle position should be within 200 meters of the GTFS shapes.txt data for the current trip unless there is an alert with the effect of `DETOUR` for this `trip_id`.
| vehicle.position.latitude |  
| vehicle.position.longitude |  
| vehicle.vehicle (VehicleDescriptor) |
| vehicle.vehicle.id | This should uniquely and stably identify a vehicle over the entire trip duration