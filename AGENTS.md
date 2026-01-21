# AGENTS.md

## Project overview
- Zed language extension for OpenEdge ABL (syntax highlighting and tree-sitter grammar).
- Primary config lives in `extension.toml`; language metadata in `languages/` and grammar in `grammars/`.

## Key paths
- `extension.toml`: registers grammars and language configuration.
- `languages/`: Zed language metadata (`config.toml` per language).
- `grammars/abl`: tree-sitter grammar sources for you to look at.
- `docs/language.md`: Zed documentation relevant to language extensions and language servers.
- `scripts/extract_keywords.py`: helper script for keyword extraction.

## Conventions
- Prefer small, focused changes; avoid reformatting unrelated files.
- If updating grammar or queries, align changes with `extension.toml` and the language `config.toml` in `languages/`.
- Use `docs/language.md` as the source of truth for Zed language extension behavior, including language server guidance.

