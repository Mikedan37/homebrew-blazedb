# homebrew-blazedb

Official Homebrew tap for the BlazeDB CLI (`blazerepl`).

This tap installs:

- `blazedb` (canonical command)
- `blazerepl` (symlink alias to `blazedb`)

Both commands run the same binary.

## Install

```bash
brew update
brew tap Mikedan37/blazedb
brew install blazerepl
```

## Verify Installation

```bash
which blazedb
which blazerepl
blazedb --help
```

You should see help output containing `blazedb start`.

## Usage

Start the interactive database picker + REPL:

```bash
blazedb start
```

or:

```bash
blazerepl start
```

Open a specific database file directly:

```bash
blazedb "/absolute/path/to/database.blazedb"
```

## Common REPL Commands

```text
fetchAll
fetch <row-index>
fetch <uuid>
query <field> <op> <value>
help
exit
```

Example query flow:

```bash
query role = assistant and project = Default sort createdAt desc limit 20
fetch 1
fetch 1 --json
```

## Update

```bash
brew update
brew upgrade blazerepl
```

## Uninstall

```bash
brew uninstall blazerepl
brew untap Mikedan37/blazedb
```

## Platform Notes

- **macOS**: installs prebuilt release assets from this tap's GitHub Releases.
- **Linux**: builds from source with Swift during `brew install`.

## Troubleshooting

### `blazedb` command not found

Check your Homebrew prefix and PATH:

```bash
brew --prefix
which -a blazedb
```

### Install fails during Swift build (Linux / source builds)

Ensure Swift toolchain is available and up to date, then retry:

```bash
brew install blazerepl
```

### Command resolves to older binary

If multiple binaries exist:

```bash
which -a blazedb
```

Ensure the Homebrew path appears first, or remove stale copies.

## Related

- Main project: <https://github.com/Mikedan37/BlazeDB>
- CLI docs: <https://github.com/Mikedan37/BlazeDB/blob/main/Docs/Tools/BLAZESHELL_DOCUMENTATION.md>
