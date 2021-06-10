## Practice Recommendations Organized by Message

### FeedHeader

| Field Name | Recommendation |
| --- | --- |
| gtfs_realtime_version | Current version is "2.0".  All GTFS Realtime feeds should be "2.0" or higher, as early version of GTFS Realtime did not require all fields needed to represent various transit situations adequately. |
| incrementality | | 
| timestamp | This timestamp should not decrease between two sequential feed iterations. |
|  | This timestamp value should always change if the feed contents change - the feed contents should not change without updating the header `timestamp`.<br>*Common mistakes* - If there are multiple instances of GTFS Realtime feed behind a load balancer, each instance may be pulling information from the realtime data source and publishing it to consumers slightly out of sync. If a GTFS Realtime consumer makes two back-to-back requests, and each request is served by a different GTFS Realtime feed instance, the same feed contents could potentially be returned to the consumer with different timestamps.<br>*Possible solution* - Producers should provide a `Last-Modified` HTTP header, and consumers should pass their most recent `If-Modified-Since` HTTP header to avoid receiving stale data.<br>*Possible solution* - If HTTP headers cannot be used, options such as stick sessions can be used to ensure that each consumer is routed to the same producer server. |
