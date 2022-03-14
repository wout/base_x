module Base58::Binary
  extend self

  # Converts a base58 string to a binary-encoded string.
  def self.decode(
    str : String,
    alphabet = DEFAULT
  ) : String
    String.new(Bytes.decode(str, alphabet))
  end

  # Converts a binary-encoded string to a base58 string.
  def self.encode(
    binary : String,
    alphabet = DEFAULT,
    leading_zeroes = true
  ) : String
    Bytes.encode(binary.to_slice, alphabet, leading_zeroes)
  end
end
