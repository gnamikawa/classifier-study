# Contributing

Thanks for helping out. Two rules keep this repo tidy: use the devShell so you
get the same tools as everyone else, and let the formatter run before you
commit.

## Code style

All sources are formatted by [`treefmt`](https://numtide.github.io/treefmt/):

- `.nix` — `nixfmt`
- `.md`, `.json` — `prettier`

Run the formatter before committing:

```
treefmt
```

Or, equivalently, via the flake:

```
nix fmt
```

The `.githooks/pre-commit` hook runs `treefmt --ci` and refuses any commit that
would change a file. Please do not disable it — if it fails, fix the
formatting.

## Comments and tests

Code here explains itself through names and tests, not comments, because
comments go out of date without anything failing. If you feel a comment is
needed, try in this order: rename or restructure so it isn't; write a test whose
name states the reason; record a big decision in `docs/adr/`; or explain it in
the commit message. `STYLE.md` has the full rule and the few comments that are
allowed.

Run every test with:

```
nix flake check
```

## Commit messages

Commits follow [Conventional Commits](https://www.conventionalcommits.org/).
The subject line must match:

```
<type>(<scope>)?: <summary>
```

- `type` is one of `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`,
  `build`, `ci`, `chore`, `revert`.
- `scope` is optional and lower-case.
- The subject is at most 72 characters, in the imperative mood, no trailing
  period.

The `.githooks/commit-msg` hook rejects commits whose subject does not match.
Merge, revert, and `fixup!`/`squash!` messages are exempt.
