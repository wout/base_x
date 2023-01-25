# BaseX

A Crystal shard for base encoding/decoding of any given alphabet with optional
bitcoin-style leading zero compression.

![GitHub](https://img.shields.io/github/license/wout/base_x)
![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/wout/base_x)
![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/wout/base_x/ci.yml?branch=main)

## Supported alphabets

Base | Alphabet
------------- | -------------
2 | `01`
8 | `01234567`
11 | `0123456789a`
32 | `0123456789ABCDEFGHJKMNPQRSTVWXYZ`
32 | `ybndrfg8ejkmcpqxot1uwisza345h769` (z-base-32)
36 | `0123456789abcdefghijklmnopqrstuvwxyz`
45 | `0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ $%*+-./:`
58 | `123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz` (bitcoin)
58 | `123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ` (flickr)
58 | `rpshnaf39wBUDNEGHJKLM4PQRST7VWXYZ2bcdeCg65jkm8oFqi1tuvAxyz` (ripple)
62 | `0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ`
67 | `ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.!~`

## Installation

1. Add the dependency to your `shard.yml`:

```yaml
dependencies:
  base_x:
    github: wout/base_x
```

2. Run `shards install`

## Usage

```crystal
require "base_x"
```

### Converting bytes

```crystal
BaseX::Base58.decode("6hKMCS")
# => Bytes[206, 233, 57, 134]
BaseX::Base58.encode(Bytes[206, 233, 57, 134])
# => "6hKMCS"
```

or:

```crystal
BaseX::Base45.decode("5R%/+F5SZ6LLW+J60D")
# => Bytes[231, 5, 88, 240, 215, 89, 21, 180, 87, 179, 227, 86]
BaseX::Base45.encode(Bytes[231, 5, 88, 240, 215, 89, 21, 180, 87, 179, 227, 86])
# => "5R%/+F5SZ6LLW+J60D"
```

**Note**: `BaseX::BaseXX.decode` is the same as `BaseX::BaseXX.decode_bytes`.

### Converting integers

```crystal
BaseX::Base58.decode_int("6hKMCS")
# => 3471391110
BaseX::Base58.encode(3471391110)
# => "6hKMCS"
```

### Using other alphabets

```crystal
base_16_alphabet = "0123456789abcdef"
BaseX.decode("ff3300", base_16_alphabet)
# => Bytes[255, 51, 0]
BaseX.encode(Bytes[255, 51, 0], base_16_alphabet)
# => "ff3300"
```

### Leading zeroes

Some protocols, such as Bitcoin, require leading zeros to be encoded. Passing
`true` to the third argument of `BaseX::Base58.encode` will enable this
behaviour.

```crystal
bitcoin_address_hex = "00000000000000000000123456789ABCDEF0"
bitcoin_address_bytes = String.new(bitcoin_address_hex.hexbytes)

BaseX::Base58.encode(bitcoin_address_bytes, leading_zeroes: true)
# => 111111111143c9JGph3DZ
```

## Development
Make sure you have [Guardian.cr](https://github.com/f/guardian) installed. Then
run:

```bash
$ guardian
```

This will automatically:
- run ameba for src and spec files
- run the relevant spec for any file in the src dir
- run spec a file whenever it's saved

## Contributing

1. Fork it (<https://github.com/wout/base_x/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Wout](https://github.com/wout) - creator and maintainer

## Acknowledgments
This shard pulls inspiration from the following projects:
- [cryptocoinjs/base-x](https://github.com/cryptocoinjs/base-x)
- [dougal/base58](https://github.com/dougal/base58)
- [russ/base58](https://github.com/russ/base58)
