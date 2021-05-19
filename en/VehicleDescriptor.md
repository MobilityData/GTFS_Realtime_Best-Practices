### VehicleDescriptor

If separate `VehiclePosition` and `TripUpdate` feeds are provided, [TripDescriptor](#TripDescriptor) and [VehicleDescriptor](#VehicleDescriptor) ID values pairing should match between the two feeds.<br/>For example, a `VehiclePosition` entity has `vehicle_id:A` and `trip_id:4`, then the corresponding `TripUpdate` entity should also have `vehicle_id:A` and `trip_id:4`.

| Field Name | Recommendation |
| --- | --- |
| id | Should uniquely and stably identify a vehicle over the entire trip duration |
| label | |
| license_plate |  |
