annotation BaseX::Alphabets
end

@[BaseX::Alphabets(
  base2: {
    default: "01",
  },
  base8: {
    default: "01234567",
  },
  base11: {
    default: "0123456789a",
  },
  base32: {
    default: "0123456789ABCDEFGHJKMNPQRSTVWXYZ",
    z_base:  "ybndrfg8ejkmcpqxot1uwisza345h769",
  },
  base36: {
    default: "0123456789abcdefghijklmnopqrstuvwxyz",
  },
  base45: {
    default: "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ $%*+-./:",
  },
  base58: {
    default: "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz",
    flickr:  "123456789abcdefghijkmnopqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ",
    ripple:  "rpshnaf39wBUDNEGHJKLM4PQRST7VWXYZ2bcdeCg65jkm8oFqi1tuvAxyz",
  },
  base62: {
    default: "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",
  },
  base67: {
    default: "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_.!~",
  }
)]
module BaseX
end
