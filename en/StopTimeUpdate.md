### StopTimeUpdate

| Field Name | Recommendation |
| --- | --- |
| stop_sequence | Provide `stop_sequence` whenever possible, as it unambiguously resolves to a GTFS stop time in `stop_times.txt` unlike `stop_id`, which can occur more than once in a trip (e.g., loop route). |
| stop_id | |
| arrival | Arrival times between sequential stops should increase - they should not be the same or decrease. Arrival `time` (specified in [StopTimeEvent](#StopTimeEvent)) should be before or the same as the departure `time` for the same stop. |
| departure | Departure times between sequential stops should increase - they should not be the same or decrease. Departure `time` (specified in [StopTimeEvent](#StopTimeEvent)) should be the same as or after the arrival `time` for the same stop. |
| schedule_relationship | |
