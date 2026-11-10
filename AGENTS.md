# Guide for AI agents

You are a code-writing agent working in this repository. Read this file before
you make changes, and re-read it when you start a new task.

## Environment

<!-- Describe how to enter the project's development environment (e.g. `nix
develop`, `direnv allow`, `uv sync`, `pnpm install`). List the tools it
provides and any hooks it wires into the checkout. -->

## Formatting is mandatory

<!-- Name the formatter(s) this repo uses and the pre-commit hook that enforces
them. State the rule plainly: run the formatter before every commit, do not
bypass the hook (no `--no-verify`, no editing the hook), fix the formatting
if the hook fails. -->

## Working style

For length, plain language, jargon, and standalone-sentence rules, see
`CONTEXT.md` `## Working style`. Those rules govern both conversation and any
prose written into the repository (ADRs, commit messages).

## Coding style

See `STYLE.md`. Its comment rule replaces any global "docstring on every named
function" rule while working in this repository: client code carries no
explanatory comments, and knowledge goes into names, tests, ADRs or commit
messages instead.

## Where to find why

The code carries no comments explaining itself. Before changing something whose
reason is unclear, look in this order:

1. `CONTEXT.md` — what a term means.
2. The tests, and the `checks` in `flake.nix` — what must stay true, and why.
   A failing test's name is the explanation you need: fix the code, or change
   the test only if the reason it states no longer holds.
3. `docs/adr/` — decisions and the alternatives they beat.
4. `STYLE.md` — standing rules.
5. Git history — `git log -- <file>` for a file,
   `git log -L <start>,<end>:<file>` or `git log -L :<funcname>:<file>` for a
   line range or function, and `git log -S<string>` for when a piece of text
   appeared or disappeared.

## Commit rules

Every commit in this repository must satisfy all three of the following:

### 1. Bisectable

Every commit must build and pass checks on its own. `git bisect` should never
land on a broken commit. If a change spans several files, keep them in one
commit rather than split a working change into a broken intermediate.

### 2. Short

One coherent change per commit. If the diff contains two unrelated ideas, that
is two commits. If you cannot describe the commit in a single sentence, split
it.

### 3. Easy-to-understand prose in Conventional Commits form

Every subject line must follow
[Conventional Commits](https://www.conventionalcommits.org/):

```
<type>(<scope>)?: <summary>
```

- `type` is one of `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`,
  `build`, `ci`, `chore`, `revert`. Pick the type that fits the intent, not
  the one that fits the biggest file changed.
- `scope` is optional and lower-case. Include it when it helps a reader
  locate the change; omit it when the change is repo-wide.
- The `summary` after the colon is a full, readable sentence in the
  imperative mood, at most 72 characters, no trailing period, no ticket
  IDs.
- Always include a body. The body explains **why** the change exists, not
  what the diff already shows. Prefer plain English sentences over bullet
  lists of file names.
- Avoid empty words in the summary: `cleanup`, `misc`, `update`, `tweak`,
  `WIP`, `stuff`.
- A colleague skimming `git log --oneline` six months from now should be
  able to understand what happened and why from the subject alone.

<!-- If this repo installs a `commit-msg` hook that enforces the subject
pattern and length, note it here and state that it must not be bypassed. -->

Examples of subjects to reject:

```
fix stuff
WIP
misc cleanup
feat: added stuff and things            # empty summary
refactor(all): big cleanup across the repo   # scope too broad, empty word
```

## Self-check before you finish

After each commit, run `git log --oneline -5` and read your own subjects back.
If any of them fail the rules above, amend or rewrite the history before
opening a pull request.
