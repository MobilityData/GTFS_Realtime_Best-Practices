# GTFS Realtime Best Practices

Best Practices for Structuring [GTFS Realtime](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/reference.md) Data.
⚠️ NOTE: The best practices are in the process of being merged into the spec. If you'd like to suggest a new best practice, please go to https://github.com/google/transit/ to open an issue or create a PR. ⚠️

## Current Version
**The current release is v1.0**

## Documentation Structure

The GTFS Realtime Best Practices are written in Markdown and are organized by Message and by use case.

* `field_name`: The name of the GTFS Realtime field being described
* `recommendations`: An array of the recommendations provided for each field_name

## GTFS Realtime Best Practices Amendment Process
Anyone may propose a change to the GTFS Realtime Best Practices by following the process below.

1. Create a git branch with updates to all relevant parts of the documentation (except for translations).
1. Create a pull request on [MobilityData/GTFS_Realtime_Best-Practices](https://github.com/MobilityData/GTFS_Realtime_Best-Practices). Pull requests must contain an extended description of the patch following the template provided (Best Practice being proposed, use cases, data examples, and optional public-facing implementation). The creator of the pull request becomes the _advocate_.
1. The discussion of the proposal follows. Pull request comments should be used as the sole discussion forum.
  	- The discussion lasts for as long as the advocate feels necessary, but must be at least 7 calendar days.
  	- The advocate is responsible for timely update of the proposal (i.e. pull request) based on the comments for which they agree to.
  	- The advocate can claim the proposal abandoned at any time before calling for a vote, in which case the advocate should close the pull request.
1. The advocate can call for a vote on a version of the proposal at any point in time following the initial 7-day interval required for discussion.
1. Voting lasts the minimum period sufficient to cover 7 full calendar days (i.e., 168 hours), ending at 23:59:59 UTC.
  	- The advocate should announce the specific end time at the start of the vote.
  	- During the voting period, only editorial changes to the proposal are allowed (typos, wording may change as long as it does not change the meaning of the proposal).
  	- Anyone is allowed to vote yes (+1) or no (-1) in the form of comment on the pull request. Votes can be changed until the end of the voting period. If a voter changes their vote, it is recommended to do so by updating the original vote comment by striking through the original vote and writing the new vote.
  	- Votes before the start of the voting period are not considered.
1. The proposal is accepted if there are at least 3 votes with at least 80% in favor.
  	- The proposer's vote does not count towards the 3 vote total. For example, if Proposer X creates a pull request and votes yes, and User Y and Z vote yes, this is counted as 2 total yes votes.
  	- Votes against shall be motivated, and provide actionable and constructive feedback.
  	- If the vote has failed, then the advocate may choose to continue work on the proposal, or to abandon the proposal. Either decision of the advocate must be announced in pull request discussion.
  	- If the advocate continues the work on the proposal then a new vote can be called for at any point in time.
1. Any pull request remaining inactive for 30 calendar days will be automatically closed by a moderator. When a pull request is closed, the corresponding proposal is considered abandoned. The advocate may reopen the pull request at any time if they wish to continue or maintain the discussion.
1. If the proposal is accepted:
  	- MobilityData is committed to merging the voted upon version of the pull request, and performing the pull request within 5 business days.

Questions can also be addressed by contacting specifications@mobilitydata.org.

## Best Practices Versioning
To enable the evolution of the GTFS Realtime Best Practices, semantic versioning tracks additions and breaking changes. Semantic versions are established by a git tag in the form of `vX.Y` where `X.Y` is the version name. Multiple changes (commits) may be batched into a single new release.

A whole integer increase is used for breaking changes (MAJOR changes). A decimal increase is used for non-breaking changes (MINOR changes or patches).

Breaking changes include:
- Removing or changing a Best Practice.

Non-breaking changes include:
- Adding Best Practices.
- Modifying documentation language that clarifies semantics or structure.

## License

Except as otherwise noted, the content of this repository is licensed under the [Creative Commons Attribution 3.0 License](https://creativecommons.org/licenses/by/3.0/), and code samples are licensed under the [Apache 2.0 License](http://www.apache.org/licenses/LICENSE-2.0).
