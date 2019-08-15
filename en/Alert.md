### Alert

General guidelines for alerts and trips:
* If a TripDescriptor is specified in an alert, the informed_entities must provide a `trip_id`. 
* When a TripDescriptor doesn’t specify `start_date` or `start_time`, all trips with the corresponding `trip_id` are affected.
* Specifying start_time for frequency-based trips (defined in GTFS `frequencies.txt`) doesn’t define a trip instance. However, it allows you to attach alerts to the corresponding trip defined in trip updates, even if these trip updates are in a separate feed.  
* Frequency-based trips (defined in GTFS `frequencies.txt`) with unspecified start_time show the alert for all route results involving the trip.
* When `trip_id` and `start_time` are within `exact_time=1` interval, `start_time` must be later than the beginning of the interval by an exact multiple of `headway_secs`. 


| Field Name | Recommendation |
| --- | --- |
| active_period | When no active_period message is present, the TripDescriptor applies to every matching trip. For example, when only tripid is specified for a non-frequency based trip, the alert will be applied indefinitely for all known service dates. If active_period messages are defined, then only trips within these periods are affected by the alert. We strongly advise against using a trip descriptor to represent multiple trips where possible, advising instead to use multiple informed_entity to represent the desired specific trip instances (with start_date) if multiple are affected. | 
| informed_entity |
| cause |  |
| effect | If set to `NO_SERVICE`, any route, trip, or stop referenced in the informed_entity will be canceled or closed and will affect trip planning routing results. The recommended way of cancelling a non-frequency based trip (trips not defined in GTFS `frequencies.txt`) via alert is to provide a descriptor with both tripid, and start_date. It is strongly discouraged to provide a tripid without start_date, which would then rely on the active_period. In cases where a trip takes longer than 24 hours, providing start_date is strongly advised to avoid ambiguities.|
| url |  |
| header_text |  |
| description_text |  |
| tts_header_text |  |
| tts_description_text |  |
| severity_level |  |
