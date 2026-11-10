# Coding style

Applies to every file authored in this repository.

## 1. Comments: the code describes itself

Applies to every language.

Comments go stale silently, and so does any prose that describes how the code
currently works: nothing fails when it stops being true. Only some written
knowledge cannot drift unnoticed. A test fails the moment the code stops
matching it, and an ADR or a commit message is a dated record of a moment, so it
never claims to describe later code. Names, types and tests therefore carry the
meaning. When a name needs a comment to be understood, rename it or restructure
the code.

### Library code

**Library code** is code whose callers live in another repository or another
build output. Each item of a library's public interface carries a docstring in
the language's default format (TSDoc, JSDoc, PEP 257, godoc, rustdoc, a `#`
block above a Nix binding). The docstring states the **contract** only: what
goes in, what comes out, what is guaranteed. It names no other file, issue or
ADR, and does not narrate how the code works.

<!-- Name this project's library code here: the outputs, packages or modules
whose callers live elsewhere. If the project has none, say so. -->

### Client code

**Client code** is everything else, tests included. It carries only these
comments:

1. Lines a tool requires: shebangs, lint or type-check suppressions, license
   headers.
2. "Do not edit" markers inside generated output.
3. A **trap warning**: one line beside code that looks wrong but is not, stating
   the hazard. Write one only when no test can check the hazard.

### Where the knowledge goes

When writing code, or removing an existing comment, sort each piece of knowledge
in this order and stop at the first match:

1. It restates what the code already says: delete it.
2. A machine can check it, or it is a light decision: write a **test as
   documentation**. The test name is a full sentence stating the reason, and
   `describe` blocks (or test files, where the framework has no blocks) group
   tests by the `CONTEXT.md` term they concern.
   <!-- Add one sentence per language: where its tests live and what runs
   them. -->
3. It is a heavy decision — hard to reverse, surprising without context, and the
   result of a real trade-off: record it in an ADR under `docs/adr/`, extending
   the area's existing ADR where one covers it.
4. It is history, or a light decision no test can check: write it in the commit
   message, and keep that commit to the one file it explains so
   `git log -- <file>` finds it.

A commit that removes comments lists, in its message, where each removed piece
of knowledge went, so a reviewer can confirm nothing was lost.

### Tests as documentation

A test name says what must stay true and why, in one sentence a newcomer can
read: "an expired session sends you back to the login page", not "test
expiry". When the reason is not obvious from the behaviour, the name
carries it after a comma or "because". A failing test's name is the explanation
the next reader needs.

When a language in this repository has no test harness yet, add one before its
first checkable claim needs a home. Until then, that claim falls back to a trap
warning.
