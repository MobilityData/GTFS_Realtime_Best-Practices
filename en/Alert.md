### Alert

General guidelines for alerts and trips:
* If a TripDescriptor is specified in an alert, the informed_entities must provide a `trip_id`. 
* When a TripDescriptor doesn’t specify `start_date` or `start_time`, all trips with the corresponding `trip_id` are affected.
* Specifying start_time for frequency-based trips (defined in GTFS `frequencies.txt`) doesn’t define a trip instance. However, it allows you to attach alerts to the corresponding trip defined in trip updates, even if these trip updates are in a separate feed.  
* Frequency-based trips (defined in GTFS `frequencies.txt`) with unspecified start_time show the alert for all route results involving the trip.
* When `trip_id` and `start_time` are within `exact_time=1` interval, `start_time` must be later than the beginning of the interval by an exact multiple of `headway_secs`. 


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
