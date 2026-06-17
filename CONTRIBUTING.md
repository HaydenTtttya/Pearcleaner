# Contributing to the Pearcleaner community fork

Thank you for helping maintain Pearcleaner. This fork prioritizes user safety, compatibility, and focused
bug fixes over feature growth.

## Before opening an issue

- Search this fork and the [upstream issue tracker](https://github.com/alienator88/Pearcleaner/issues).
- Use the provided issue template and include exact reproduction steps.
- For deletion-related reports, describe the expected and selected paths without sharing private data.
- Never test destructive behavior without a backup or disposable test data.

## Development workflow

1. Create a branch from `main`.
2. Keep changes focused and avoid unrelated formatting rewrites.
3. Build with `./script/build_and_run.sh` or run the unsigned CI-equivalent build:

   ```bash
   xcodebuild \
     -project Pearcleaner.xcodeproj \
     -scheme "Pearcleaner Debug" \
     -configuration Debug \
     -derivedDataPath .derivedData \
     CODE_SIGNING_ALLOWED=NO \
     build
   ```

4. Add or update tests where practical, especially around path matching and deletion decisions.
5. Open a pull request explaining the problem, risk, test coverage, and user-visible behavior.

## Safety expectations

Changes that delete, move, thin, or modify user files must fail safely. Prefer leaving a file behind over
deleting an uncertain match. Keep privileged operations narrow and validate paths before invoking the
helper tool.

## License

Contributions are accepted under the repository's Apache 2.0 license with the Commons Clause condition.
By submitting a contribution, you agree that it may be distributed under those terms. Preserve existing
copyright, license, and attribution notices.

## Keeping a local fork current

```bash
git fetch upstream
git switch main
git merge --ff-only upstream/main
git push origin main
```
