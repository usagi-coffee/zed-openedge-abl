# OpenEdge ABL for Zed

This is a language package for the [Zed](http://zed.dev) code editor that adds support for the [OpenEdge ABL](http://www.progress.com/openedge) language.

- LSP server: [abl-language-server](https://github.com/usagi-coffee/abl-language-server)
- `ABL` grammar: [tree-sitter-abl](https://github.com/usagi-coffee/tree-sitter-abl)
- `DF` grammar: [tree-sitter-df](https://github.com/usagi-coffee/tree-sitter-df)

# Installation

Currently the only way to install the extension is to use Zed's `Install Dev Extension` with a [patched llvm/clang](https://github.com/llvm/llvm-project/pull/179722) as the extension faces a few problems:

- `tree-sitter-abl` is so big it needs to go below 100MB to be uploaded to github as cargo does not support `LFS`.
- LLVM/Clang needs [patches](https://github.com/llvm/llvm-project/pull/179722) to compile `tree-sitter-abl`.
- `wasi-sdk` and `emscripten` need to adopt the patched clang/llvm.
- Zed needs a bump for `wasi-sdk` version.

Only after these changes it will be posible to publish it to the extensions repository.

```
git clone https://github.com/usagi-coffee/zed-openedge-abl
```
