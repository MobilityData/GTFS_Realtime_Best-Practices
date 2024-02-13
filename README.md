# GTFS Realtime Best Practices

Best Practices for Structuring [GTFS Realtime](https://github.com/google/transit/blob/master/gtfs-realtime/spec/en/reference.md) Data.
⚠️ NOTE: The best practices are in the process of being merged into the spec. If you'd like to suggest a new best practice, please go to https://github.com/google/transit/ to open an issue or create a PR. ⚠️

## Current Version
**The current release is v1.0**

## Documentation Structure

The GTFS Realtime Best Practices are written in Markdown and are organized by Message and by use case.

* `field_name`: The name of the GTFS Realtime field being described
* `recommendations`: An array of the recommendations provided for each field_name

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
