# Brow:
> *For all your terminal browsing desires *™.

# Details:
- Reads from the `$HOME/.brow/.browrc` file and parses its input
	- Links are listed and separated by `\n`; whitespace doesn't count outside a non-whitespace character.
	- Use `*` for string substitution.
	- Any nuances (better display, dynamic search, ...) may be added by the user. (This is open source after all...)
- The user chooses the search engine with the `-s` flag, the default is `duckduckgo`. (Also, there is the `-ht` flag as an abbreviation of `how to`)
- `curl` `curl`s the url.
- A python script is executed (must have the `html.parse`) & the results are logged.
