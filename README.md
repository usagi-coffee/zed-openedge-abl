# OpenEdge ABL for Zed

This is a language package for the [Zed](http://zed.dev) code editor that adds support for the [OpenEdge ABL](http://www.progress.com/openedge) language.

- LSP server: [abl-language-server](https://github.com/usagi-coffee/abl-language-server)
- `ABL` grammar: [tree-sitter-abl](https://github.com/usagi-coffee/tree-sitter-abl)
- `DF` grammar: [tree-sitter-df](https://github.com/usagi-coffee/tree-sitter-df)

# Installation

Currently the only way to install the extension is to use Zed's `Install Dev Extension` as the extension faces a few problems:

- `tree-sitter-abl` is so big it needs to go below 100MB to be uploaded to github as cargo does not support `LFS`.
- LLVM/Clang needs [patches](https://github.com/llvm/llvm-project/pull/179722) to compile `tree-sitter-abl`.
- `wasi-sdk` and `emscripten` need to adopt the patched clang/llvm.
- Zed needs a bump for `wasi-sdk` version.

Only after these changes it will be posible to publish it to the extensions repository.

```
git clone https://github.com/usagi-coffee/zed-openedge-abl
# Zed -> Extensions -> Install Dev Extension -> Select `zed-openedge-abl` directory
```

# License

```
MIT License

Copyright (c) Kamil Jakubus and contributors

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
