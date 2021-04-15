### StopTimeUpdate

| Field Name | Recommendation |
| --- | --- |
| stop_sequence | Provide stop_sequence whenever possible, as it unambiguously resolves to a GTFS stop time in stop_times.txt. |
| stop_id | |
| arrival | Arrival times between sequential stops should increase - they should not be the same or decrease. Arrival `time` (specified in [StopTimeEvent](#StopTimeEvent)) should be before departure `time`. |
| departure | Departure times between sequential stops should increase - they should not be the same or decrease. Departure`time` (specified in [StopTimeEvent](#StopTimeEvent)) should be after arrival`time`. |
| schedule_relationship | delay should be propagated within a trip and across trips in the same block. When propagating delay, any layover should be considered and subtracted from the delay time. For example, a vehicle is running on a block that consists of two trips, one with `trip_id`: "trip_A" and one with `trip_id`: "trip_B", and 10 minutes layover between the two trips. When the vehicle is running 20 minutes late on "trip_A", trip_update.delay on "trip_A" should be 1200 (20 minutes = 1200 seconds), and on "trip_B" should should be 600 (10 minutes). |
|  | `TripUpdate.delay` should represent schedule deviation, i.e., the observed past value for how ahead/behind schedule the vehicle is. Predictions for future stops should be provided through `StopTimeEvent.delay` |
|  | If a stop has `schedule_relationship:SKIPPED`, routing results in trip plans will be affected and that stop will not be available to riders.
