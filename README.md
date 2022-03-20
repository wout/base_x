# BaseX

A Crystal shard for base encoding / decoding of any given alphabet with optional
bitcoin-style leading zero compression.

![GitHub](https://img.shields.io/github/license/wout/base_x)
![GitHub tag (latest SemVer)](https://img.shields.io/github/v/tag/wout/base_x)
![GitHub Workflow Status](https://img.shields.io/github/workflow/status/wout/base_x/BaseX%20CI)

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

### Converting integers

```crystal
BaseX::Base58.decode_int("6hKMCS")
# => 3471391110
BaseX::Base58.encode(3471391110)
# => "6hKMCS"
```

### Converting bytes

```crystal
BaseX::Base58.decode("6hKMCS")
# => Bytes[206, 233, 57, 134]
BaseX::Base58.encode(Bytes[206, 233, 57, 134])
# => "6hKMCS"
```

**Note**: `BaseX::Base58.decode` is the same as `BaseX::Base58.decode_bytes`.

### Using other alphabets

```crystal
base_16_alphabet = "0123456789abcdef"
BaseX::Base.decode("ff3300", base_16_alphabet)
# => Bytes[255, 51, 0]
BaseX::Base.encode(Bytes[255, 51, 0], base_16_alphabet)
# => "ff3300"
```

### Leading zeroes

Some protocols, such as Bitcoin, require leading zeros to be encoded. Passing
`true` to the third argument of `BaseX::Bytes.encode` or
`BaseX::Binary.encode` will enable this behaviour.

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
- run the relevant spec for any file in src
- run spec file whenever they are saved

## Contributing

1. Fork it (<https://github.com/wout/base_x/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Wout](https://github.com/wout) - creator and maintainer

## Acknowledgements
This shard pulls inpiration from the following projects:
- [cryptocoinjs/base-x](https://github.com/cryptocoinjs/base-x)
- [dougal/base_x](https://github.com/dougal/base_x)
- [russ/base_x](https://github.com/russ/base_x)
