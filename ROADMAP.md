# Community maintenance roadmap

This roadmap tracks the initial maintenance work for the community fork. Priorities may change when a
reproducible safety or compatibility problem is found.

## P0: Safety and data integrity

- Reproduce and fix false-positive file matches that could delete unrelated data.
- Add tests around application identifiers, path matching, exclusions, and shared-container detection.
- Make Lipo operations verifiable and recoverable before modifying application bundles.
- Review privileged helper commands and validate every path crossing the XPC boundary.

## P1: Build and compatibility foundation

- Keep unsigned Debug builds working in GitHub Actions.
- Verify supported macOS versions with current Xcode releases.
- Audit and pin external dependencies where practical.
- Add regression tests for confirmed bug fixes.

## P2: Community release process

- Publish source releases with clear changelogs and checksums where applicable.
- Document the difference between upstream and community builds.
- Evaluate unsigned binary releases separately; do not imply Apple notarization or upstream endorsement.
- Consider a separate Homebrew tap only after community binary releases are reproducible.

## Out of scope for the bootstrap phase

- Large new features or UI redesigns.
- Taking over the upstream Homebrew cask.
- Claiming official successor status or using the original author's identity.
- Monetization prohibited by the repository license.
