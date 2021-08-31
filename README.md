# Brow:
> For all your terminal browsing desires ™.

# Details:
- Write `brow "[QUERY]"` and pipe it through `less` (if on Unix-like systems) and a parsed result list will appear fetched from the `summary` of duckduckgo's search engine.
- Write `brow -ht "[QUERY]"` as a shorthand form of `brow "how to [QUERY]"`.

# Installation:
- Clone this repository and change directory to it
	```bash
		git clone 'https://www.github.com/observeofmath/brow'
		cd brow
	```
- Run `sudo ./install.sh`, give it a `$DIR` argument if installing on other directory. If so, make sure that
	- Run `sudo ./install.sh` if **not** giving a argument. It defaults to installing at `/usr/bin`

- Uninstall with:

  ```bash
  cd brow
  ./remove.sh
  # OR
  cd brow
  sudo ./remove.sh
  ``` 

# Example of usage:

```bash
	brow "Anime was a mistake"
	brow -ht "suck less at javascript"
```

# Needs:
- python >=3
- standard Unix libraries (curl, less, cat, echo, tail, etc...)
- patience
