### Alert

General guidelines for alerts and trips:
* When `trip_id` and `start_time` are within `exact_time=1` interval, `start_time` should be later than the beginning of the interval by an exact multiple of `headway_secs`. 
* When canceling trips over a number of days, producers should provide TripUpdates referencing the given `trip_ids` as `CANCELED` as well as an Alert with `NO_SERVICE` referencing the same `trip_ids` that can be shown to riders explaining the cancellation (e.g., detour).

| Field Name | Recommendation |
| --- | --- |
| active_period |  | 
| informed_entity |
| cause |  |
| effect | |
| url |  |
| header_text |  |
| description_text |  |
| tts_header_text |  |
| tts_description_text |  |
| severity_level |  |
