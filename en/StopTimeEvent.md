### StopTimeEvent

| Field Name | Recommendation |
| --- | --- |
| delay | If only `delay` is provided in a `stop_time_update` `arrival` or `departure` (and not `time`), then the GTFS [stop_times.txt](https://gtfs.org/reference/static#stopstxt) should contain arrival_times and/or departure_times for these corresponding stops. A `delay` value in the realtime feed is meaningless unless you have a clock time to add it to in the GTFS `stop_times.txt` file. |
| time | |
| uncertainty |  |
