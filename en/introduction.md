# GTFS Realtime Data Best Practices

## Introduction

These are recommended practices for describing realtime public transportation information in the [GTFS Realtime](https://gtfs.org/reference/realtime/v2/) data format.

### Document Structure

Recommended practices are organized into two primary sections

* __[Practice Recommendations Organized by Message](#practice-recommendations-organized-by-message):__ Recommendations are organized by message and field in the same order described in the official GTFS Realtime reference.
* __[Practice Recommendations Organized by Case](#practice-recommendations-organized-by-case):__ With particular cases, such as frequency-based service (vs. schedule-based service), practices may need to be applied across several messages and fields as well as the corresponding GTFS schedule data. Such recommendations are consolidated in this section.

### Feed Publishing & General Practices

* Feeds should be published at a public, permanent URL
* Ideally, the URL should be directly accessible without requiring a login to access the feed, to facilitate download by consuming software applications. While it is recommended (and the most common practice) to make a GTFS Realtime dataset openly downloadable, if a data provider does need to control access to GTFS Realtime for licensing or other reasons, it is recommended to control access to the GTFS Realtime feed using API keys, which will facilitate automatic downloads.
* Maintain persistent identifiers (id fields) for any identifies within a GTFS Realtime feed (e.g., FeedEntity.id, VehicleDescriptor.id, CarriageDetails.id) across feed iterations.
* GTFS Realtime feeds should be refreshed at least once every 30 seconds, or whenever the data changes, whichever is more frequent. VehiclePositions tend to change more frequently than other feed entities and should be updated as frequently as possible. If the content has not changed, the feed should be updated with a new `FeedHeader.timestamp` reflecting that the information is still relevant as of that timestamp.
* Data within a GTFS Realtime feed should not be older than 90 seconds for Trip Updates and Vehicle Positions and not older than 10 minutes for Service Alerts. For example, even if a producer is continuously refreshing the `FeedHeader.timestamp` timestamp every 30 seconds, the age of VehiclePositions within that feed should not be older than 90 seconds.
* The server hosting GTFS Realtime data should be reliable and consistently return validly-formatted protobuf-encoded responses. Fewer than 1% of responses should be invalid (protobuf errors or fetching errors).
* The web-server hosting GTFS Realtime data should be configured to correctly report the file modification date (see HTTP/1.1 - Request for Comments 2616, under Section 14.29) so consumers can leverage the `If-Modified-Since` HTTP header. This saves producers and consumers bandwidth by avoiding transferring feed contents that haven't changed.
* Feeds should provide protocol buffer-encoded feed content by default when queried via an HTTP request at the given URL - consumers should not need to define special HTTP accept headers to receive protocol-buffer encoded content.
* Feeds should use HTTPS instead of HTTP (without encryption) to ensure feed integrity.
* Feeds should cover the vast majority of trips included in the companion static GTFS dataset. In particular, it should include data for high-density and high-traffic city areas and busy routes.