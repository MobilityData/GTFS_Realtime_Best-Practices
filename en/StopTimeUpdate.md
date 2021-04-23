### StopTimeUpdate

| Field Name | Recommendation |
| --- | --- |
| stop_sequence | Provide stop_sequence whenever possible, as it unambiguously resolves to a GTFS stop time in stop_times.txt. |
| stop_id | |
| arrival | Arrival times between sequential stops should increase - they should not be the same or decrease. Arrival `time` (specified in [StopTimeEvent](#StopTimeEvent)) should be before departure `time`. |
| departure | Departure times between sequential stops should increase - they should not be the same or decrease. Departure`time` (specified in [StopTimeEvent](#StopTimeEvent)) should be after arrival`time`. |
| schedule_relationship | |
