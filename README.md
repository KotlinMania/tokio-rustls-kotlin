# tokio-rustls-kotlin in Kotlin

[![GitHub link](https://img.shields.io/badge/GitHub-KotlinMania%2Ftokio-rustls-kotlin-blue.svg)](https://github.com/KotlinMania/tokio-rustls-kotlin)
[![Maven Central](https://img.shields.io/maven-central/v/io.github.kotlinmania/tokio-rustls-kotlin)](https://central.sonatype.com/artifact/io.github.kotlinmania/tokio-rustls-kotlin)
[![Build status](https://img.shields.io/github/actions/workflow/status/KotlinMania/tokio-rustls-kotlin/ci.yml?branch=main)](https://github.com/KotlinMania/tokio-rustls-kotlin/actions)

This is a Kotlin Multiplatform line-by-line transliteration port of [`rustls/tokio-rustls`](https://github.com/rustls/tokio-rustls) (crate `tokio-rustls`).

**Original Project:** This port is based on [`rustls/tokio-rustls`](https://github.com/rustls/tokio-rustls). All design credit and project intent belong to the upstream authors; this repository is a faithful port to Kotlin Multiplatform with no behavioural changes intended.

### Porting status

This is an **in-progress port**. The goal is feature parity with the upstream Rust crate while providing a native Kotlin Multiplatform API. Every Kotlin file carries a `// port-lint: source <path>` header naming its upstream Rust counterpart so the AST-distance tool can track provenance.

---

## Upstream README — `rustls/tokio-rustls`

> The text below is reproduced from [`https://github.com/rustls/tokio-rustls`](https://github.com/rustls/tokio-rustls). It is the upstream project's own description and remains under the upstream authors' authorship; links have been rewritten to absolute upstream URLs where appropriate so they continue to resolve from this repository.

# tokio-rustls

[![github actions](https://github.com/rustls/tokio-rustls/workflows/CI/badge.svg)](https://github.com/rustls/tokio-rustls/actions)
[![crates](https://img.shields.io/crates/v/tokio-rustls.svg)](https://crates.io/crates/tokio-rustls)
[![license](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/rustls/tokio-rustls/blob/main/LICENSE-MIT)
[![license](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://github.com/rustls/tokio-rustls/blob/main/LICENSE-APACHE)
[![docs.rs](https://docs.rs/tokio-rustls/badge.svg)](https://docs.rs/tokio-rustls)

Asynchronous TLS/SSL streams for [Tokio](https://tokio.rs/) using
[Rustls](https://github.com/rustls/rustls).

### Basic Structure of a Client

```rust
use rustls_pki_types::ServerName;
use std::sync::Arc;
use tokio::net::TcpStream;
use tokio_rustls::rustls::{ClientConfig, RootCertStore};
use tokio_rustls::TlsConnector;

// ...

let mut root_cert_store = RootCertStore::empty();
root_cert_store.extend(webpki_roots::TLS_SERVER_ROOTS.iter().cloned());
let config = ClientConfig::builder()
    .with_root_certificates(root_cert_store)
    .with_no_client_auth();
let connector = TlsConnector::from(Arc::new(config));
let dnsname = ServerName::try_from("www.rust-lang.org").unwrap();

let stream = TcpStream::connect(&addr).await?;
let mut stream = connector.connect(dnsname, stream).await?;

// ...
```

### Client Example Program

See [examples/client.rs](examples/client.rs). You can run it with:

```sh
cargo run --example client -- hsts.badssl.com
```

### Server Example Program

See [examples/server.rs](examples/server.rs). You can run it with:

```sh
cargo run --example server -- 127.0.0.1:8000 --cert certs/cert.pem --key certs/cert.key.pem
```

If you don't have a certificate and key, you can generate a random key and
self-signed certificate for testing with:

```sh
cargo install --locked rustls-cert-gen
rustls-cert-gen --output certs/ --san localhost
```

### License & Origin

This project is licensed under either of

- Apache License, Version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or
  https://www.apache.org/licenses/LICENSE-2.0)
- MIT license ([LICENSE-MIT](LICENSE-MIT) or
  https://opensource.org/licenses/MIT)

at your option.

This started as a fork of [tokio-tls](https://github.com/tokio-rs/tokio-tls).

### Contribution

Unless you explicitly state otherwise, any contribution intentionally submitted
for inclusion in tokio-rustls by you, as defined in the Apache-2.0 license, shall be
dual licensed as above, without any additional terms or conditions.

---

## About this Kotlin port

### Installation

```kotlin
dependencies {
    implementation("io.github.kotlinmania:tokio-rustls-kotlin:0.1.0")
}
```

### Building

```bash
./gradlew build
./gradlew test
```

### Targets

- macOS arm64
- Linux x64
- Windows mingw-x64
- iOS arm64 / simulator-arm64 (Swift export + XCFramework)
- JS (browser + Node.js)
- Wasm-JS (browser + Node.js)
- Android (API 24+)

### Porting guidelines

See [AGENTS.md](AGENTS.md) and [CLAUDE.md](CLAUDE.md) for translator discipline, port-lint header convention, and Rust → Kotlin idiom mapping.

### License

This Kotlin port is distributed under the same license terms as the upstream [`rustls/tokio-rustls`](https://github.com/rustls/tokio-rustls). See [LICENSE](LICENSE) (and any sibling `LICENSE-*` / `NOTICE` files mirrored from upstream) for the full text.

Original work copyrighted by the tokio-rustls authors.  
Kotlin port: Copyright (c) 2026 Sydney Renee and The Solace Project.

### Acknowledgments

Thanks to the [`rustls/tokio-rustls`](https://github.com/rustls/tokio-rustls) maintainers and contributors for the original Rust implementation. This port reproduces their work in Kotlin Multiplatform; bug reports about upstream design or behavior should go to the upstream repository.
