### FeedEntity

| Field Name | Recommendation |
| --- | --- |
| id |  |
| is_deleted | |
| trip_update | When multiple trips in one block are included in one feed, it is recommended that their respective TripUpdate entities should be added to the feed entity in the same order that they are scheduled in the block (for more information about trips and blocks, please refer to [GTFS trips.txt](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#tripstxt)). For example, trips with `trip_ids` 1, 2, and 3 that all belong to one block, and the vehicle travels trip 1, then trip 2, and then trip 3, the `trip_update` entities should appear in the feed in the order of trip 1, then trip 2, and then trip 3. This facilitates the storage of arrival and departure times by consumers that store information for an entire block of trips together. |
| vehicle |  |
| alert |  |
