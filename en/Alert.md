### Alert

General guidelines for alerts and trips:
* When `trip_id` and `start_time` are within `exact_time=1` interval, `start_time` should be later than the beginning of the interval by an exact multiple of `headway_secs`. 

| Field Name | Recommendation |
| --- | --- |
| active_period |  | 
| informed_entity |
| cause |  |
| effect | If set to `NO_SERVICE`, any route, trip, or stop referenced in the informed_entity will be canceled or closed and will affect trip planning routing results. The recommended way of cancelling a trip not defined in GTFS `frequencies.txt` via alert is to provide a descriptor with both tripid, and start_date. It is strongly discouraged to provide a tripid without start_date, which would then rely on the active_period. In cases where a trip takes longer than 24 hours, providing start_date is strongly advised to avoid ambiguities.|
| url |  |
| header_text |  |
| description_text |  |
| tts_header_text |  |
| tts_description_text |  |
| severity_level |  |
