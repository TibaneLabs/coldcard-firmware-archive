# Coldcard Firmware Archive

A mirror of **every officially-signed Coldcard firmware image** (`.dfu`) released by
Coinkite, for the Mk3 / Mk4 / Mk5 numpad devices and the Q1. Kept for research,
reproducibility, and long-term availability — several older builds are no longer served
from Coinkite's own download site.

**Every file is verified** against Coinkite's published `signatures.txt` (SHA256). See
[`verify.sh`](verify.sh). Nothing here is modified: these are the exact signed binaries,
each carrying Coinkite's own secp256k1 signature that the device bootloader checks.

This is an unofficial archive. It is **not** affiliated with or endorsed by Coinkite.
The firmware is © Coinkite Inc., distributed under MIT + the Commons Clause (which
permits copying and redistribution, and forbids *selling*). This repository redistributes
the binaries unmodified for archival; it does not sell them.

## Contents (128 files verified · manifest lists 133)

| line | dir | count | versions |
|---|---|---|---|
| Mk3/4/5 stable | [`mk/`](mk) | 65 | v3.0.6 – v5.6.1 |
| Q1 stable | [`q1/`](q1) | 46 | v0.0.3Q – v1.5.1Q |
| Mk edge (experimental, `X`) | [`edge-mk/`](edge-mk) | 11 | v6.0.0X – v6.6.0X |
| Q1 edge (experimental, `QX`) | [`edge-q1/`](edge-q1) | 6 | v6.3.3QX – v6.6.0QX |

Filenames are Coinkite's originals: `<UTC-build-timestamp>-<version>-<board>-coldcard[-factory].dfu`.
`-factory` variants also program the (unreplaceable) bootloader; the plain variant is the
field-upgrade image. `X` / `QX` suffixes are **edge/experimental** builds that carry the
mainline version number — the Q1's own *stable* line is versioned separately (`v1.x`).

## Known gaps (5)

Listed in `signatures.txt` but not currently retrievable from Coinkite's download server
(404). Recorded here with their official SHA256 so a surfaced copy can be verified and
added. Contributions welcome.

| file | official sha256 |
|---|---|
| `2021-04-29T1725-v4.1.0-coldcard.dfu` | `2c39330bef467af8dcd7e2f393a970e1ca177b1812f830269916657ff79598eb` |
| `2021-04-30T1748-v4.1.1-coldcard.dfu` | `08e1ec1fd073afbbc9014db6da07fd96c6b20a6710fe491eb805afeba865fe3f` |
| `2022-03-24T1645-v5.0.1-mk3-coldcard.dfu` | `afb6048397af4093e63567563544098e1cfb45b7ca673536253eb6494d60125c` |
| `2022-05-04T1254-v5.0.3-mk3-coldcard.dfu` | `6dbf0aca0f98fb7bdc761eeead4786617b804dad4afb42ee02febf23d31b5e9b` |
| `2025-11-20T1601-v6.4.0QX-q1-coldcard.dfu` | `371f13f3e1a5ef28d14933daf03820f0e51d26ffa96008dd5595da0dfac646cf` |

## Adding a missing file

```sh
# drop the .dfu in the right folder, then:
./verify.sh          # must report it verified against signatures.txt
```

Only add files whose SHA256 matches `signatures.txt`. Never add a `.dfu` that fails
verification.
