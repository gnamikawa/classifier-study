# Project template

A minimal starting point for new repositories. Ships:

- A Nix `devShell` that provides [`treefmt`](https://numtide.github.io/treefmt/)
  (nixfmt + prettier).
- Git hooks in `.githooks/` that enforce formatting (`pre-commit`) and
  [Conventional Commits](https://www.conventionalcommits.org/) subject lines
  (`commit-msg`), wired in automatically on `nix develop`.
- `AGENTS.md` — house rules for AI coding agents.
- `CONTRIBUTING.md` — the same rules, phrased for humans.
- `STYLE.md` — code explains itself through names and tests; knowledge that
  would be a comment goes to a test, an ADR or a commit message.
- `CONTEXT.md` — the project's glossary and writing rules.

## Getting started

```
nix develop      # enter the devShell; also wires .githooks into this checkout
treefmt          # format all sources
```

## Making it your own

After cloning, edit these files to fit the new project:

- `flake.nix` — add the language toolchains and packages the project needs.
- `AGENTS.md` — fill in the `Environment` and `Formatting` placeholders.
- `STYLE.md` — name the project's library code, and say where each language's
  tests live.
- `CONTEXT.md` — define the project's own terms.
- `README.md` — replace this file with the project's own description.
- `CONTRIBUTING.md` — adjust if the project's contribution flow differs.
