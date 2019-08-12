## Practice Recommendations Organized by Message

### FeedHeader

| Field Name | Recommendation |
| --- | --- |
| gtfs_realtime_version | Current version is "2.0". Valid versions are "2.0" and "1.0" (with the `string` data type). For example, `gtfs_realtime_version:2.0` and `gtfs_realtime_version:2` are both not valid. `gtfs_realtime_version:"2.0"` is valid. |
| incrementality | |
| timestamp | This timestamp must be greater than all timestamps for individual entities ([TripUpdate](#TripUpdate) and [VehiclePosition](#VehiclePosition)), and should not decrease between two sequential iterations. |
|  | The GTFS-realtime header `timestamp` value should always change if the feed contents change - the feed contents must not change without updating the header `timestamp`.<br>*Common mistakes* - If there are multiple instances of GTFS-realtime feed behind a load balancer, each instance may be pulling information from the real-time data source and publishing it to consumers slightly out of sync. If a GTFS-realtime consumer makes two back-to-back requests, and each request is served by a different GTFS-realtime feed instance, the same feed contents could potentially be returned to the consumer with different timestamps.<br>*Possible solution* - Configure the load balancer for "sticky routes", so that the consumer always receives the GTFS-realtime feed contents from the same GTFS-realtime instance. |
