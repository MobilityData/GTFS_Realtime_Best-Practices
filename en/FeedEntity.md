### FeedEntity

All entities should only be removed from a GTFS Realtime feed when they are no longer relevant to users. Feeds are considered to be stateless, meaning that each feed reflects the entire real-time state of the transit system. If an entity is provided in one feed instance but dropped in a subsequent feed update, it should be assumed that there is no real-time information for that entity.

| Field Name | Recommendation |
| --- | --- |
| id | Should be kept stable over the entire trip duration |
| is_deleted | |
| trip_update | |
| vehicle |  |
| alert |  |
