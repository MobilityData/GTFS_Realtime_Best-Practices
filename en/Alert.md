### Alert

General guidelines for alerts and trips:
* When `trip_id` and `start_time` are within `exact_time=1` interval, `start_time` should be later than the beginning of the interval by an exact multiple of `headway_secs`. 

| Field Name | Recommendation |
| --- | --- |
| active_period |  | 
| informed_entity |
| cause |  |
| effect | If set to `NO_SERVICE`, any route, trip, or stop referenced in the informed_entity will be canceled or closed and will affect trip planning routing results. |
| url |  |
| header_text |  |
| description_text |  |
| tts_header_text |  |
| tts_description_text |  |
| severity_level |  |
