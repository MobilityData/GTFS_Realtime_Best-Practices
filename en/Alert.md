### Alert

General guidelines for alerts:
* When `trip_id` and `start_time` are within `exact_time=1` interval, `start_time` should be later than the beginning of the interval by an exact multiple of `headway_secs`. 
* When canceling trips over a number of days, producers should provide TripUpdates referencing the given `trip_ids` and `start_dates` as `CANCELED` as well as an Alert with `NO_SERVICE` referencing the same `trip_ids` and `TimeRange` that can be shown to riders explaining the cancellation (e.g., detour).
* If an alert affects all stops on a line, use a line-based alert instead of a stop-based alert. Do not apply the alert to every stop of the line.
* While there is no character limit for service alerts, transit riders will often be viewing alerts on mobile devices. Please be concise.

| Field Name | Recommendation |
| --- | --- |
| active_period |  | 
| informed_entity |
| cause |  |
| effect | |
| url |  |
| header_text |  |
| description_text | Use line breaks to make your service alert easier to read. |
| tts_header_text |  |
| tts_description_text |  |
| severity_level |  |
