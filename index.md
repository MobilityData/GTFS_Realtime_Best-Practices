# GTFS-Realtime Data Best Practices

## Introduction

These are recommended practices for describing real-time public transportation information in the [GTFS Realtime](https://gtfs.org/reference/realtime/v2/) data format.

### Document Structure

Recommended practices are organized into two primary sections

* __[Practice Recommendations Organized by message](#practice-recommendations-organized-by-message):__ Recommendations are organized by message and field in the same order described in the official GTFS-Realtime reference.
* __[Practice Recommendations Organized by Case](#practice-recommendations-organized-by-case):__ With particular cases, such as frequency-based service, practices may need to be applied across several messages and fields and even with the corresponding GTFS package. Such recommendations are consolidated in this section.

## Practice Recommendations Organized by Message

### FeedHeader

| Field Name | Recommendation |
| --- | --- |
| gtfs_realtime_version | Current version is "2.0". Valid versions are "2.0" and "1.0" (with the `string` data type). For example, `gtfs_realtime_version:2.0` and `gtfs_realtime_version:2` are both not valid. `gtfs_realtime_version:"2.0"` is valid. |
| incrementality | |
| timestamp | This timestamp must be greater than all timestamps for individual entities ([TripUpdate](#TripUpdate) and [VehiclePosition](#VehiclePosition)), and should not decrease between two sequential iterations. |
|  | The GTFS-rt header `timestamp` value should always change if the feed contents change - the feed contents must not change without updating the header `timestamp`.<br>*Common mistakes* - If there are multiple instances of GTFS-realtime feed behind a load balancer, each instance may be pulling information from the real-time data source and publishing it to consumers slightly out of sync. If a GTFS-rt consumer makes two back-to-back requests, and each request is served by a different GTFS-rt feed instance, the same feed contents could potentially be returned to the consumer with different timestamps.<br>*Possible solution* - Configure the load balancer for "sticky routes", so that the consumer always receives the GTFS-rt feed contents from the same GTFS-rt instance. |
### FeedEntity

| Field Name | Recommendation |
| --- | --- |
| id |  |
| is_deleted | |
| trip_update | When multiple trips in one block are included in one feed entity, their respective trip updates entities should be added to the feed entity in the same order that they are scheduled in the block (for more information about trips and blocks, please refer to [GTFS trips.txt](https://github.com/google/transit/blob/master/gtfs/spec/en/reference.md#tripstxt)). For example, trips with `trip_ids` 1, 2, and 3 that all belong to one block, and the vehicle travels trip 1, then trip 2, and then trip 3, the `trip_update` entities should appear in the feed in the order of trip 1, then trip 2, and then trip 3. Trip 3's information and predictions should not occur in the feed prior to trip 2's or trip 1's. |
| vehicle |  |
| alert |  |
### TripUpdate

| Field Name | Recommendation |
| --- | --- |
| trip | refer to [message TripDescriptor](#TripDescriptor) |
|  | If separate `VehiclePosition` and `TripUpdate` feeds are provided, [TripDescriptor](#TripDescriptor) and [VehicleDescriptor](#VehicleDescriptor) ID values pairing should match between the two feeds.<br>For example, a `VehiclePosition` entity has `vehicle_id:A` and `trip_id:4`, then the corresponding `TripUpdate` entity should also have `vehicle_id:A` and `trip_id:4`. If any `TripUpdate` entity has `trip_id:4` and any `vehicle_id` other than 4, this is an error. |
| vehicle | refer to [message VehicleDescriptor](#VehicleDescriptor) |
|  | If separate `VehiclePosition` and `TripUpdate` feeds are provided, [TripDescriptor](#TripDescriptor) and [VehicleDescriptor](#VehicleDescriptor) ID values pairing should match between the two feeds.<br/>For example, a `VehiclePosition` entity has `vehicle_id:A` and `trip_id:4`, then the corresponding `TripUpdate` entity should also have `vehicle_id:A` and `trip_id:4`. If any `TripUpdate` entity has `trip_id:4` and any `vehicle_id` other than 4, this is an error. |
| stop_time_update | `stop_time_updates` for a given `trip_id` should be strictly ordered by increasing `stop_sequence` and no `stop_sequence` should be repeated. While sorting `stop_sequence` is not strictly required by the specification, it is a good practice. |
| timestamp |  |
| delay | delay should be propagated within a trip and across trips in the same block. When propagating delay, any layover should be considered and subtracted from the delay time. For example, a vehicle is running on a block that consists of two trips, one with `trip_id`: "trip_A" and one with `trip_id`: "trip_B", and 10 minutes layover between the two trips. When the vehicle is running 20 minutes late on "trip_A", trip_update.delay on "trip_A" should be 1200 (20 minutes = 1200 seconds), and on "trip_B" should should be 600 (10 minutes). |
|  | `TripUpdate.delay` should represent schedule deviation, i.e., the observed past value for how ahead/behind schedule the vehicle is. Predictions for future stops should be provided through `StopTimeEvent.delay` |
### StopTimeUpdate

| Field Name | Recommendation |
| --- | --- |
| stop_sequence | If `stop_sequence` and `stop_id` are both provided, any combination of `stop_sequence` and `stop_id` must have a match in GTFS data. |
| stop_id | All `stop_ids`  must exist in the GTFS data in `stops.txt` and must have `location_type=0` in `stops.txt`. |
|  | If `stop_sequence` and `stop_id` are both provided, any combination of `stop_sequence` and `stop_id` must have a match in GTFS data. |
| arrival | Arrival times between sequential stops should always increase - they should never be the same or decrease. Arrival `time` (specified in [StopTimeEvent](#StopTimeEvent)) should be before departure `time`. |
| departure | Departure times between sequential stops should always increase - they should never be the same or decrease. Departure`time` (specified in [StopTimeEvent](#StopTimeEvent)) should be after arrival`time`. |
| schedule_relationship | delay should be propagated within a trip and across trips in the same block. When propagating delay, any layover should be considered and subtracted from the delay time. For example, a vehicle is running on a block that consists of two trips, one with `trip_id`: "trip_A" and one with `trip_id`: "trip_B", and 10 minutes layover between the two trips. When the vehicle is running 20 minutes late on "trip_A", trip_update.delay on "trip_A" should be 1200 (20 minutes = 1200 seconds), and on "trip_B" should should be 600 (10 minutes). |
|  | `TripUpdate.delay` should represent schedule deviation, i.e., the observed past value for how ahead/behind schedule the vehicle is. Predictions for future stops should be provided through `StopTimeEvent.delay` |
### StopTimeEvent

| Field Name | Recommendation |
| --- | --- |
| delay | If only `delay` is provided in a `stop_time_update` `arrival` or `departure` (and not `time`), then the GTFS [stop_times.txt](https://gtfs.org/reference/static#stopstxt) must contain arrival_times and/or departure_times for these corresponding stops. A `delay` value in the real-time feed is meaningless unless you have a clock time to add it to in the GTFS `stop_times.txt` file. |
| time | |
| uncertainty |  |
### VehiclePosition

| Field Name | Recommendation |
| --- | --- |
| trip | refer to [message TripDescriptor](#TripDescriptor) |
|  | If separate `VehiclePosition` and `TripUpdate` feeds are provided, [TripDescriptor](#TripDescriptor) and [VehicleDescriptor](#VehicleDescriptor) ID values pairing should match between the two feeds.<br/>For example, a `VehiclePosition` entity has `vehicle_id:A` and `trip_id:4`, then the corresponding `TripUpdate` entity should also have `vehicle_id:A` and `trip_id:4`. If any `TripUpdate` entity has `trip_id:4` and any `vehicle_id` other than 4, this is an error. |
| vehicle | refer to [message VehicleDescriptor](#VehicleDescriptor) |
|  | If separate `VehiclePosition` and `TripUpdate` feeds are provided, [TripDescriptor](#TripDescriptor) and [VehicleDescriptor](#VehicleDescriptor) ID values pairing should match between the two feeds.<br/>For example, a `VehiclePosition` entity has `vehicle_id:A` and `trip_id:4`, then the corresponding `TripUpdate` entity should also have `vehicle_id:A` and `trip_id:4`. If any `TripUpdate` entity has `trip_id:4` and any `vehicle_id` other than 4, this is an error. |
| position |  |
| current_stop_sequence |  |
| stop_id | All `stop_ids`  must exist in the GTFS data in `stops.txt` and must have `location_type=0` in `stops.txt`. |
| current_status |  |
| timestamp | Even though this field is optional, providing the timestamp at which vehicle position was measured is strongly recommended. |
| congestion_level |  |
| occupancy_status |  |
### Position

| Field Name | Recommendation |
| --- | --- |
| latitude |  |
| longitude | |
| bearing |  |
| odometer |  |
| speed |  |
### Alert

| Field Name | Recommendation |
| --- | --- |
| active_period |  |
| informed_entity | Specifiers (`agency_id`, `route_id`, etc.) in one [EntitySelector](https://gtfs.org/reference/realtime/v2/#message-entityselector) should be interpreted as being joined by the logical `AND` operator. Any combination of specifiers must exist in the GTFS data. |
| cause |  |
| effect |  |
| url |  |
| header_text |  |
| description_text |  |
| tts_header_text |  |
| tts_description_text |  |
| severity_level |  |
### TripDescriptor

| Field Name | Recommendation |
| --- | --- |
| trip_id | Developers need to make sure that all `trip_ids` must exist in the GTFS data, unless their `schedule_relationship` is set to `ADDED`. |
|  | Frequency-based trips must contain `trip_id`, `start_time`, and `start_date`. |
| route_id | Developers need to make sure that all `route_ids` must exist in the GTFS data. |
| direction_id | Developers need to make sure that all `direction_id` must exist in the GTFS data. |
| start_time | [Frequency-based trips](#Frequency-based-trips) must contain `trip_id`, `start_time`, and `start_date`. |
| start_date | [Frequency-based trips](#Frequency-based-trips) must contain `trip_id`, `start_time`, and `start_date`. |
| schedule_relationship | For [Frequency-based trips](#Frequency-based-trips), this should be `UNSCHEDULED` or empty. |
|  | Trips that have `schedule_relationship:ADDED` must not be in GTFS data. |

### VehicleDescriptor

| Field Name | Recommendation |
| --- | --- |
| id |  |
| label | |
| license_plate |  |
## Practice Recommendations Organized by Case

### Frequency-based trips

A frequency-based trip does not follow a fixed schedule but attempt to maintain predetermined headways. These trips are denoted in [GTFS frequency.txt](https://gtfs.org/reference/static/#frequenciestxt) by setting `exact_times=0`. There are several best practices to keep in mind when constructing GTFS-Realtime feeds for frequency-based trips.

In [TripUpdate.StopTimeUpdate](#StopTimeUpdate), the [StopTimeEvent](#StopTimeEvent) for `arrival` and `departure` should not contain `delay` because frequency-based trips do not follow a fixed schedule. Instead, `time` should be provided to indicate arrival/departure predictions.

Also in [TripUpdate.StopTimeUpdate](#StopTimeUpdate), `schedule_relationship` should not be `SCHEDULED` or `SKIPPED` because these values are only relevant for schedule-based trips (trips not defined in [frequencies.txt](https://gtfs.org/reference/static/#frequenciestxt) or in [frequencies.txt](https://gtfs.org/reference/static/#frequenciestxt) but with `exact_times=1`). As of May 2019, there is no enumeration value in`schedule_relationship` that is suitable for frequency-based trips. A new enumeration value, `UNSCHEDULED`, is being proposed to the official specification and will be the best option for frequency-based trips once approved. Until `UNSCHEDULED` is approved, we recommend leaving `schedule_relationship` empty.

When describing `trip` in [TripUpdate](#TripUpdate) or [VehiclePosition](#VehiclePosition) by using [TripDescriptor](#TripDescriptor), all of `trip_id`, `start_time`, and `start_date` must be provided, and`schedule_relationship` should be `UNSCHEDULED`.

Frequency-based  trips' [TripUpdate](#TripUpdate) should contain `vehicle_id`. This helps disambiguate predictions in situations where more than one vehicle is running the same trip instance simultaneously.

## About This Document

### Objectives

The objectives of maintaining GTFS-Realtime Best Practices is to:

* Improve end-user customer experience in public transportation apps
* Make it easier for software developers to deploy and scale applications, products, and services

### How to propose or amend published GTFS-Realtime Best Practices

GTFS applications and practice evolve, and so this document may need to be amended from time to time. To propose an amendment to this document, open a pull request [in the GTFS-Realtime Best Practices GitHub repository](https://github.com/MobilityData/GTFSRT-Best-Practices) and advocate for the change.

### Linking to This Document

Please link here in order to provide feed producers with guidance for correct formation of GTFS-Realtime data. Each individual recommendation has an anchor link. Click the recommendation to get the URL for the in-page anchor link.

If a GTFS-Realtime-consuming application makes requirements or recommendations for GTFS-Realtime data practices that are not described here, it is recommended to publish a document with those requirements or recommendations to supplement these common best practices.

## GTFS-Realtime Best Practices Working Group

The GTFS-Realtime Best Practices Working Group consists of public transportation providers, developers of  applications, consultants, and academic organizations to define common practices and expectations for GTFS-Realtime data. The goals of this working group are to support greater interoperability of data. To join the working group, email [gtfs@rmi.org](mailto:gtfs@rmi.org).

Members of this working group include:

* [Cambridge Systematics](https://www.camsys.com/)
* [Capital Metro](https://www.capmetro.org/)
* [Center for Urban Transportation Research at University of South Florida](https://www.cutr.usf.edu/)
* [Conveyal](http://conveyal.com/)
* [Google](https://www.google.com/)
* [IBI Group](http://www.ibigroup.com/)
* [Mapzen](https://mapzen.com/)
* [Microsoft](https://www.microsoft.com/)
* [Moovel](https://www.moovel.com/)
* [Oregon Department of Transportation](http://www.oregon.gov/odot/)
* [Swiftly](https://goswift.ly/)
* [Transit](https://transitapp.com/)
* [Trillium](http://trilliumtransit.com/)
* [TriMet](https://trimet.org/)
* [World Bank](http://www.worldbank.org/)

