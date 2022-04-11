### VehiclePosition

Following are the recommended fields that should be included for a VehiclePostions feed to provide consumers with high-quality data (e.g., for generating predictions)

| Field name | Notes |
| --- | --- |
| entity.id | Should be kept stable over the entire trip duration
| vehicle (VehiclePosition) |
| vehicle.timestamp | Providing the timestamp at which vehicle position was measured is strongly recommended. Otherwise, consumers must use the message timestamp, which can have misleading results for riders when the last message was updated more frequently than the individual position.
| vehicle.trip | 
| vehicle.trip.trip_id |
| vehicle.trip.start_time |
| vehicle.trip.start_date |
| vehicle.trip.schedule_relationship |
| vehicle.position | 
| vehicle.position.latitude |  
| vehicle.position.longitude |  
| vehicle.vehicle (VehicleDescriptor) |
| vehicle.vehicle.id | Should uniquely and stably identify a vehicle over the entire trip duration |
