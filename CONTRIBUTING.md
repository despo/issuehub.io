# Contributing to **issuehub.io**

## Quick guide:

1. Fork the repo.
2. Add a test for your change. Only styling, documentation and refactoring changes (that are already covered by tests) don't require any new tests. If you are adding functionality or fixing a bug, you need a test! Also, no need to test rails!
3. Make the test pass.
4. Push to your fork and submit a pull request.
5. Wait for comments or feedback!

Syntax:

* no trailing whitespace. Blank lines should not have any space.
* my_method(my_arg) or my_method arguments but definitely not my_method( my_arg )
* a = b and not a=b.
* aim for 1.9 hash syntax - `{ dog: "Akira" }` rather than `{ :dog => "Akira" }`
* follow the conventions you see used in the source already.
