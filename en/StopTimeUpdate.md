# StopTimeUpdate

| Field Name | Recommendation |
| --- | --- |
| stop_sequence | Provide `stop_sequence` whenever possible, as it unambiguously resolves to a GTFS stop time in `stop_times.txt` unlike `stop_id`, which can occur more than once in a trip (e.g., loop route). |
| stop_id | |
| arrival | Arrival times between sequential stops should increase - they should not be the same or decrease. | 
|         | Arrival `time` (specified in [StopTimeEvent](../StopTimeEvent)) should be before the departure `time` for the same stop if a layover or dwell time is expected - otherwise, arrival `time` should be be the same as departure `time`. |
| departure | Departure times between sequential stops should increase - they should not be the same or decrease. |
|           | Departure `time` (specified in [StopTimeEvent](../StopTimeEvent)) should be the same as the arrival `time` for the same stop if no layover or dwell time is expected - otherwise, departure `time` should be after arrival `time` . |
| schedule_relationship | |
