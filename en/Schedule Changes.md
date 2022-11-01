### Service Changes

#### When to represent service changes in GTFS Realtime [TripUpdate](#TripUpdate) Feed vs [GTFS Schedule](https://gtfs.org/reference/static/)

Generally speaking, it is preferable to publish changes to the schedule in advance (7 days, if possible), using GTFS Schedule.  However, Schedule changes which are not represented in the static GTFS Schedule happen for a variety of reasons including construction, events, or unplanned service disruptions.  

Valid reasons for not representing these in your static GTFS Schedule include:

1. Service Changes were finalized less than one week/* in advance of the relevant service.
2. Complexity of `service_ids` required to represent altered service.  
3. Operational inability for the transit provider to post frequent updates to GTFS Schedule.

/* One week is generally the time it takes for a GTFS consumer to turn around an updated GTFS feed to the customers.

!Note: It is always valid and useful to publish "abnormal" service changes in the GTFS Realtime Alerts feed.

#### Best Practices

* Service changes should be represented in the posted [GTFS Schedule](https://gtfs.org/reference/static/) if it is feasible to do so one-week in advance of the change and it doesn't result in undue complexity to the `service_ids` – otherwise, they should be represented in the [`TripUpdate`](#TripUpdate) feed.
* "Regular service" Routes and Stops should remain in the [GTFS Schedule](https://gtfs.org/reference/static/) files `routes.txt` and `stops.txt` respsectfully so that they can be selected in GTFS Realtime `EntitySelected` (To be confirmed - note that this might not work for some GTFS-consumers)
* GTFS Producers should notify relevant GTFS Consumers of any out-of-the-ordinary updates to their [GTFS Schedule](https://gtfs.org/reference/static/) which happen less than a week from the relevant service so that the GTFS Consumers know to pick up the changes.
* Abnormal service should always be represented in the [Alerts](#Alerts) feed as this shows up to customers as an alert to them.  
* Routes which are detoured or skipping stops should be represented in [Alerts](#Alerts) as a route-level `DETOUR` effect, relevant stop-level `STOP_MOVED` `REDUCED_SERVICE` or `NO-SERVICE` effects.  If they are not represented in the posted GTFS Schedule, then they should also be represented as a series of [`TripUpdates.StopTimeUpdate`](https://gtfs.org/realtime/reference/#message-stoptimeupdate) messages with [`schedule_relationship`](https://gtfs.org/realtime/reference/#enum-schedulerelationship) `SKIPPED` for missed stops and [`schedule_relationship`](https://gtfs.org/realtime/reference/#enum-schedulerelationship) `UNSCHEDULED` for added stops.
* Trips which are skipped should be represented in [Alerts](#Alerts) through a route-level effect of `NO-SERVICE` or `REDUCED_SERVICE`.  If they are not represented in the posted GTFS Schedule, then they should also be represented as a [`TripUpdates.StopTimeUpdate`](https://gtfs.org/realtime/reference/#message-stoptimeupdate) message by setting [`schedule_relationship`](https://gtfs.org/realtime/reference/#enum-schedulerelationship) to `SKIPPED`.
* Station entrances/exits which are temporarly closed should be represented in [Alerts](#Alerts) as `NO-SERVICE` effect.
