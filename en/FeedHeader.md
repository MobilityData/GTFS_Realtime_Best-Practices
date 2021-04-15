## Practice Recommendations Organized by Message

### FeedHeader

| Field Name | Recommendation |
| --- | --- |
| gtfs_realtime_version | Current version is "2.0".  All GTFS-realtime feeds should be "2.0" or higher, as early version of GTFS-realtime did not require all fields needed to represent various transit situations adequately. |
| incrementality | | 
| timestamp | This timestamp should not decrease between two sequential feed iterations. |
|  | The GTFS-realtime header `timestamp` value should always change if the feed contents change - the feed contents must not change without updating the header `timestamp`.<br>*Common mistakes* - If there are multiple instances of GTFS-realtime feed behind a load balancer, each instance may be pulling information from the realtime data source and publishing it to consumers slightly out of sync. If a GTFS-realtime consumer makes two back-to-back requests, and each request is served by a different GTFS-realtime feed instance, the same feed contents could potentially be returned to the consumer with different timestamps.<br>*Possible solution* - Configure the load balancer for "sticky routes", so that the consumer always receives the GTFS-realtime feed contents from the same GTFS-realtime instance. |
