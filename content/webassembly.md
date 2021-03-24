---
title: 'webassembly'
date: 201801171309.13
tags:
- 'wasm'
- 'dev'
- 'internet'
---

according to [this
post](https://hacks.mozilla.org/2018/01/making-webassembly-even-faster-firefoxs-new-streaming-and-tiering-compiler/)
on the mozilla blog, we will be able to compile wasm as it streams into
the browser in much the same way that images are decoded. this is a huge
game changer from the current paradigm of loading javascript completely
before being able to parse and compile it.

> JavaScript code is much more expensive, byte for byte, than an image,
> because of the time spent parsing and compiling it. It's possible to
> parse and compile wasm as fast as it comes over the network, which
> makes it much more like an image than JavaScript code. Game changer!
>
> — Yehuda Katz (@wycats) [December 19,
> 2017](https://twitter.com/wycats/status/942908325775077376?ref_src=twsrc%5Etfw)

this will make [so many
things](https://github.com/WebAssembly/design/blob/master/UseCases.md)
possible in the browser that never were before!

i decided to follow this
[tutorial](http://webassembly.org/getting-started/developers-guide/) and
ended up with [this](https://tilde.team/~ben/wasm/hello.html).

i don't know what to do next. any ideas?
