# Language Support Basic of supporting a language are: completion, hover,
definition, diagnostics, references. These are taken straight from Language
Server Protocol, however, not all LSP can fulfill. Let's take `ruff` for
example, it used to do linting/diagnostics, now _almost_ all, except
completion.

# Idea For each language, build one specific repository that can be included
with plugin manager _and_ easy to setup. Prime example is `folke/lazydev.nvim`
For now, let's try implement one for Python.
## Plugin manager vs Personal management style
- Plugin manager - Lazy - prefer setup by plugin, ie. one plugin per file, and
not stretch out to multiple files.
- We prefer behavior-oriented setup: Each language is its own file, one file
might contain multiple plugins.
