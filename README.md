# Base58

A Crystal shard for converting integers, bytes or binary-encoded strings, to and
from Base58 using common alphabets.

## Installation

1. Add the dependency to your `shard.yml`:

```yaml
dependencies:
  base58:
    github: wout/base58
```

2. Run `shards install`

## Usage

```crystal
require "base58"
```

### Converting integers

```crystal
Base58::Int.decode("6hKMCS")
# => 3471391110
Base58::Int.encode(3471391110)
# => "6hKMCS"
```

### Converting bytes

```crystal
Base58::Bytes.decode("6hKMCS")
# => Bytes[206, 233, 57, 134]
Base58::Bytes.encode(Bytes[206, 233, 57, 134])
# => "6hKMCS"
```

### Converting binary-encoded strings

```crystal
Base58::Binary.decode("6hKMCS")
# => "\xCE\xE99\x86"
Base58::Binary.encode("\xCE\xE99\x86")
# => "6hKMCS"
```

### Using different alphabets

The default alphabet is the one used by Flickr:

```crystal
"123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ"
```

But another alphabet can be used by passing it as the second parameter:

```crystal
Base58::Bytes.decode("6Hknds", Base58::BITCOIN)
# => Bytes[206, 233, 57, 134]
Base58::Bytes.encode(Bytes[206, 233, 57, 134], Base58::BITCOIN)
# => "6Hknds"
```

Available alphabets are:

- `Base58::DEFAULT`: (`123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ`)
- `Base58::BITCOIN`: (`123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz`)
- `Base58::RIPPLE`: (`rpshnaf39wBUDNEGHJKLM4PQRST7VWXYZ2bcdeCg65jkm8oFqi1tuvAxyz`)

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

1. Fork it (<https://github.com/wout/base58/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Wout](https://github.com/wout) - creator and maintainer

## Acknowledgements
This shard pulls inpiration from the following projects:
- [cryptocoinjs/base-x](https://github.com/cryptocoinjs/base-x)
- [dougal/base58](https://github.com/dougal/base58)
- [russ/base58](https://github.com/russ/base58)
